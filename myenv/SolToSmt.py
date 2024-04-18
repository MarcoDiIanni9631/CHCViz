import subprocess

def SolToSmt(contract_file, output_file):
    try:
        # Execute the command to convert the Solidity contract to SMT-LIB format
        command = f"solc --model-checker-engine chc --model-checker-targets assert --model-checker-print-query --model-checker-solvers smtlib2 --model-checker-timeout 1000 --model-checker-show-unproved {contract_file}"
        
        # Execute the command and capture the output
        output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, text=True)
        
        # Write the output to a file
        with open(output_file, 'w') as f:
            f.write(output)
            print(f"Output saved successfully to: {output_file}")
            
    except subprocess.CalledProcessError as e:
        # Handle any errors that occur during the command execution
        print("Error executing command:", e)



def main():
    # Set contract_file to "bank_smt.smt2"
    input_file = "Bank.sol"
    output_folder = "/home/marco/GITHUB/SmartContractToGraph/"
  # Call the function to convert SMT to PL
    SolToSmt(input_file, output_folder)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()
