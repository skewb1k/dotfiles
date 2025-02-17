import yaml
import shutil
from pathlib import Path
import argparse

parser = argparse.ArgumentParser(description="Script with flags")

parser.add_argument(
    "-r", "--restore", action="store_true", help="Enable restore mode"
)

args = parser.parse_args()

if args.restore:
    print("Restore mode enabled")

script_dir = Path(__file__).parent.absolute()

yaml_path = script_dir / "config.yml"
with open(yaml_path) as f:
    config = yaml.safe_load(f)
    for item in config:
        source_path = Path(item["source"]).expanduser()
        dest_path = script_dir / item["destination"]

        if args.restore:
            dest_path.parent.mkdir(parents=True, exist_ok=True)

            # If the source is a directory, we restore the contents of the destination to the source
            if dest_path.is_dir():
                # Recursively copy the content back from destination to source
                for src_file in dest_path.iterdir():
                    if src_file.is_dir():
                        shutil.copytree(src_file, source_path / src_file.name, dirs_exist_ok=True)
                        print(f"Restored directory {src_file} to {source_path / src_file.name}")
                    else:
                        # Ensure the parent directory of the destination file exists
                        (source_path / src_file.name).parent.mkdir(parents=True, exist_ok=True)
                        shutil.copy2(src_file, source_path / src_file.name)
                        print(f"Restored file {src_file} to {source_path / src_file.name}")
            else:
                # Ensure the parent directory of the destination file exists
                dest_path.parent.mkdir(parents=True, exist_ok=True)
                # Restore a single file
                if dest_path.exists():
                    shutil.copy2(dest_path, source_path)
                    print(f"Restored {dest_path} to {source_path}")
                else:
                    print(f"Destination file {dest_path} does not exist")
        else:
            # Delete the destination file or directory before copying
            if dest_path.exists():
                if dest_path.is_dir():
                    shutil.rmtree(dest_path)
                    print(f"Deleted directory {dest_path}")
                else:
                    dest_path.unlink()
                    print(f"Deleted file {dest_path}")

            # Ensure destination path exists for directories
            if source_path.is_dir():
                # Copy directory recursively
                try:
                    shutil.copytree(source_path, dest_path, dirs_exist_ok=True)
                    print(f"Copied directory {source_path} to {dest_path}")
                except Exception as e:
                    print(f"Failed to copy directory: {e}")
            else:
                # Copy a single file
                dest_path.parent.mkdir(parents=True, exist_ok=True)
                try:
                    shutil.copy2(source_path, dest_path)
                    print(f"Copied file {source_path} to {dest_path}")
                except Exception as e:
                    print(f"Failed to copy file: {e}")
