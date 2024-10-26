import yaml

def format_to_yaml(single_line_data):
    # Initialize an empty dictionary
    data_dict = {}
    items = single_line_data.split()
    
    # Iterate through each key-value pair
    for item in items:
        if ":" in item:
            key, value = item.split(":", 1)
            data_dict[key.strip()] = value.strip()

    # Handle nested dictionary for 'COMPOSITION' specifically
    data_dict['COMPOSITION'] = {
        'DPPC': {'NAME': 'DPPC', 'MAPPING': 'mappingDPPCcharmm.yaml'},
        'SOL': {'NAME': 'SOL', 'MAPPING': 'mappingSPCwater.yaml'},
        'SOD': {'NAME': 'NA', 'MAPPING': 'mappingNA.yaml'},
        'CLA': {'NAME': 'CL', 'MAPPING': 'mappingCL.yaml'}
    }

    # Convert dictionary to YAML format
    formatted_yaml = yaml.dump(data_dict, sort_keys=False)
    return formatted_yaml

# Example usage
single_line_data = "DOI: 10.5281/zenodo.1009027 SOFTWARE: gromacs TRJ: DPPC_512_NaCl_150mM_325K_md.xtc TPR: DPPC_512_NaCl_150mM_325K_md.tpr PREEQTIME: 0 TIMELEFTOUT: 0 DIR_WRK: /media/osollila/Data/tmp/DATABANK/ PUBLICATION: null AUTHORS_CONTACT: Martinez-Seara, Hector SYSTEM: DPPC_512_NaCl_150mM_325K SOFTWARE_VERSION: 5.0.4 FF: CHARMM36 FF_SOURCE: CHARMM-GUI v1.6 FF_DATE: null CPT: DPPC_512_NaCl_150mM_325K_md.cpt LOG: null TOP: DPPC_512_NaCl_150mM_325K_md.top COMPOSITION: DPPC: NAME: DPPC MAPPING: mappingDPPCcharmm.yaml SOL: NAME: SOL MAPPING: mappingSPCwater.yaml SOD: NAME: NA MAPPING: mappingNA.yaml CLA: NAME: CL MAPPING: mappingCL.yaml"

