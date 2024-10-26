import os
import yaml

def format_to_yaml(input_file, output_file):
    # Read the input YAML string
    with open(input_file, 'r') as f:
        single_line_data = f.read()

    # Process the data (as described previously)
    data_dict = {}
    items = single_line_data.split()
    for item in items:
        if ":" in item:
            key, value = item.split(":", 1)
            data_dict[key.strip()] = value.strip()

    # Handle nested structure
    data_dict['COMPOSITION'] = {
        'DPPC': {'NAME': 'DPPC', 'MAPPING': 'mappingDPPCcharmm.yaml'},
        'SOL': {'NAME': 'SOL', 'MAPPING': 'mappingSPCwater.yaml'},
        'SOD': {'NAME': 'NA', 'MAPPING': 'mappingNA.yaml'},
        'CLA': {'NAME': 'CL', 'MAPPING': 'mappingCL.yaml'}
    }

    # Write formatted data to output file
    with open(output_file, 'w') as f:
        yaml.dump(data_dict, f, sort_keys=False)

# Main script execution
if __name__ == "__main__":
    input_file = os.getenv("INPUT_FILE", "input.yaml")
    output_file = os.getenv("OUTPUT_FILE", "temp.yaml")
    format_to_yaml(input_file, output_file)
