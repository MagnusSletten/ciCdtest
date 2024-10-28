import yaml
import os

def format_to_yaml(input_file, output_file):
    # Read and parse the input YAML string
    with open(input_file, 'r') as f:
        data_dict = yaml.safe_load(f)

    # Write the parsed data back to the output YAML file
    with open(output_file, 'w') as f:
        yaml.dump(data_dict, f, sort_keys=False)

# Main script execution
if __name__ == "__main__":
    input_file = os.getenv("INPUT_FILE", "input.yaml")
    output_file = os.getenv("OUTPUT_FILE", "output.yaml")
    format_to_yaml(input_file, output_file)

