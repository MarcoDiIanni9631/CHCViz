import CheckRequirement
import SolToSmt
import os
import SmtParser
import SmtToPl
import PlParser

def main():
    # Check requirements first
    missing_packages = CheckRequirement.check_requirements()
    if missing_packages:
        print("The following dependencies are missing:")
        for package in missing_packages:
            print(f"- {package}")
        return
    
    # If all requirements are satisfied, proceed with Solidity to SMT-LIB conversion
    contract_file = "Bank.sol"
    filename_without_extension = os.path.splitext(contract_file)[0]  # Extract filename without extension
    output_file = f"{filename_without_extension}.txt" 
    smtParsed = f"{filename_without_extension}.smt2"
    outputProlog = f"../GITHUB/SmartContractToGraph/{filename_without_extension}.pl"
    prologParsed = f"../GITHUB/SmartContractToGraph/{filename_without_extension}_parsed.pl"

    SolToSmt.SolToSmt(contract_file, output_file)
    SmtParser.smt_parser(output_file,smtParsed)
    SmtToPl.SmtToPl(smtParsed,outputProlog)
    PlParser.pl_parser(outputProlog,prologParsed)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()
