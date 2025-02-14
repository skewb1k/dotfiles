import yaml
import shutil
from pathlib import Path
import argparse

parser = argparse.ArgumentParser(description="Script with flags")

parser.add_argument(
    "-r", "--restore", action="store_true", help="Enable verbose output"
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
            source_path.parent.mkdir(parents=True, exist_ok=True)

            # Copy the file back to source
            if dest_path.exists():
                shutil.copy2(dest_path, source_path)
                print(f"Restored {dest_path} to {source_path}")
            else:
                print(f"Destination file {dest_path} does not exist")
        else:
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
