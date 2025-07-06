import re
import sys

if len(sys.argv) != 2:
    print("Usage: python extract_colors.py <filename>")
    sys.exit(1)

filename = sys.argv[1]

with open(filename) as f:
    text = f.read()

pattern = r'\b(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(?:\s+(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){2}\b'

matches = re.findall(pattern, text)

for color in matches:
    r, g, b = map(int, color.split())
    hex_color = "#{:02X}{:02X}{:02X}".format(r, g, b)
    swatch = f"\033[48;2;{r};{g};{b}m   \033[0m"
    print(f"{(r, g, b)} -> {hex_color} {swatch}")

