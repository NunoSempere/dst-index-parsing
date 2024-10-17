import re

def parse_dst_values(html_file):
    with open(html_file, 'r') as file:
        content = file.read()
    
    # Find the pre tag content
    match = re.search(r'<pre class="data">(.*?)</pre>', content, re.DOTALL)
    if not match:
        raise ValueError("Could not find the data table in the HTML file")
    
    pre_content = match.group(1)
    lines = pre_content.strip().split('\n')[4:]  # Skip header lines
    
    dst_values = []
    for line in lines:
        values = re.findall(r'-?\d+', line[10:])  # Start from column 10 to skip date
        dst_values.extend(map(int, values))
    
    return dst_values

# Usage
dst_values = parse_dst_values('195701.html')
print(f"Number of DST values: {len(dst_values)}")
print(f"First 10 DST values: {dst_values[:10]}")
