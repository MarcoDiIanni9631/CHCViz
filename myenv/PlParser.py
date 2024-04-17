import sys

def pl_parser(input_file, output_file):
    try:
        # Read input file
        with open(input_file, 'r') as file:
            content = file.read()

        # Apply transformations using replace
        content = content.replace("mapping(", "mapping__") 
        content = content.replace("to_uint256)", "to_uint256__") 
        content = content.replace(")_tuple", "___tuple")  
        content = content.replace(" => ", "_to_")
        content = content.replace("block.", "block_")
        content = content.replace("msg.", "msg_")
        content = content.replace("tx.", "tx_")
        content = content.replace("-18446744073709551616", "0")
        content = content.replace("115792089237316195423570985008687907853269984665640564039457584007913129639935", "1158")
        content = content.replace("1461501637330902918203684832716283019655932542975", "146")
        content = content.replace("3504541104", "35")
        content = content.replace("773487949", "77")
        content = content.replace("3732496093", "37")
        content = content.replace("2153715177", "22")
        content = content.replace("876046271", "88")
        content = content.replace("false", "ff")
        content = content.replace("tuple(bool,bytes)_accessor", "tuple__bool,bytes___accessor")


        

        # Write transformed content to output file
        with open(output_file, 'w') as file:
            file.write(content)

        print(f"Transformation completed. Output written to '{output_file}'.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    # Check if the correct number of arguments is provided
    if len(sys.argv) != 3:
        print("Usage: python custom_parser.py <input_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    # Call custom_parser function with input and output files as arguments
    pl_parser(input_file, output_file)
