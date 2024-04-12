import subprocess
#import CheckRequirement

def solidity_to_smtlib(commandSoltoSmtlib):

    # Open solidity file to save the output
    with open("Contract.smtLib2", "w") as f:
        # Execute the command and paste the result on the file
        subprocess.run(commandSoltoSmtlib, shell=True, stdout=f)      
        output = subprocess.check_output(commandSoltoSmtlib, shell=True, stderr=subprocess.STDOUT, text=True)
        f.write(output)

def run_automation(contract_file):
    # Convert Solidity contract to SMT-LIB format
    smtlib_query = solidity_to_smtlib(contract_file)


def main():
    commandSoltoSmtlib = "solc --model-checker-engine chc --model-checker-targets assert --model-checker-print-query --model-checker-solvers smtlib2 --model-checker-timeout 1000 --model-checker-show-unproved /home/marco/Desktop/Bank.sol "

    solidity_to_smtlib(commandSoltoSmtlib)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()