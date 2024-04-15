def smt_parser(input_file, output_file):
    """
    Parses the SMT-LIB file and extracts the query between (set-logic HORN) and (check-sat).
    """
    # Read the content of the input file
    with open(input_file, 'r') as f:
        lines = f.readlines()

    # Find the index of the line containing "(set-logic HORN)"
    start_index = None
    for i, line in enumerate(lines):
        if "(set-logic HORN)" in line:
            start_index = i
            break

    # Find the index of the line containing "(check-sat)"
    end_index = None
    for i, line in enumerate(lines):
        if "(check-sat)" in line:
            end_index = i
            break

    # If both indices are found, extract the text between them
    if start_index is not None and end_index is not None:
        extracted_lines = lines[start_index:end_index + 1]

        # Write the extracted text to the output file
        with open(output_file, 'w') as f:
            f.writelines(extracted_lines)

        print("The query has been successfully extracted.")
    else:
        print("Unable to find '(set-logic HORN)' or '(check-sat)' in the input file.")

def main():
    # Set contract_file to "bank_smt.smt2"
    input_file = "Bank.smt2"
    output_file = "Bank_parsed.smt2"
  # Call the function to convert SMT to PL
    smt_parser(input_file, output_file)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()
