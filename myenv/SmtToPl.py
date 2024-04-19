import os
import subprocess

#in development, the command generate an error.

def SmtToPl(contract_file, output_file):
    try:
        #Move to eldarica-master folder 
        #os.chdir("/home/marco/eldarica-master")

        # Execute the command to convert the Solidity contract to SMT-LIB format

        command = f"eld -p {contract_file}"
        
        # Execute the command and capture the output
        output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, text=True)
        
        #Move to the original folder

        #os.chdir("../GITHUB/SmartContractToGraph/")

        #write the output to the given output_file name
        with open(output_file, 'w') as f:
            f.write(output)
            print(f"Output saved successfully to: {output_file}")
            
    except subprocess.CalledProcessError as e:
        # Handle any errors that occur during the command execution
        print("Error executing command:", e)

def main():
    # Set contract_file to "bank_smt.smt2"
    contract_file = "Bank_parsed.smt2"
    
    # Get the filename without extension
    filename_without_extension = os.path.splitext(contract_file)[0]
    
    # Set output_file to have .pl extension
    output_file = f"{filename_without_extension}.pl"
    
    # Call the function to convert SMT to PL
    SmtToPl(contract_file, output_file)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()
