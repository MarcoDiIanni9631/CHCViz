import os
import subprocess

#in development, the command generate an error.

def dot_to_svg(contract_file):
    try:
      #  print("prima di lanciare il comando per la trasformazione dot")
      # Execute the command to convert the Solidity contract to SMT-LIB format

        command = f"    dot -Tsvg {contract_file} -o {contract_file}.svg "
        
        # Execute the command and capture the output
        output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, text=True)

      #  print("dopo la trasformazione")

            
    except subprocess.CalledProcessError as e:
        # Handle any errors that occur during the command execution
        print("Error executing command:", e)

    print(f"Svg saved successfully")

def main():
    # Set contract_file to "bank_smt.smt2"
    contract_file = "Bank_parsed.dot"
    
    # Get the filename without extension
    filename_without_extension = os.path.splitext(contract_file)[0]
    
    # Set output_file to have .pl extension
    output_file = f"{filename_without_extension}.pl"
    
    # Call the function to convert SMT to PL
    dot_to_svg(contract_file, output_file)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()