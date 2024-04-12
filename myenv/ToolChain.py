import CheckRequirement
import SolidityToSmtLib

def main():
    # Check requirements first
    missing_packages = CheckRequirement.check_requirements()
    if missing_packages:
        print("The following dependencies are missing:")
        for package in missing_packages:
            print(f"- {package}")
        return
    
    # If all requirements are satisfied, proceed with Solidity to SMT-LIB conversion
    contract_file = "/home/marco/Desktop/Bank.sol"
    output_file = "Contract.smtLib2"
    SolidityToSmtLib.solidity_to_smtlib(contract_file, output_file)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()
