import CheckRequirement
import SolToSmt
import os
import SmtParser
import SmtToPl
import PlParser
import PlToDot

def main():

    # Check requirements first
    if not (CheckRequirement.check_requirements()):
        return 

    # If all requirements are satisfied, initialize file names
    contract_file = "Bank.sol"
    filename_without_extension = os.path.splitext(contract_file)[0]  # Extract filename without extension
    output_file = f"{filename_without_extension}.txt" 
    smtParsed = f"{filename_without_extension}.smt2"
    outputProlog = f"{filename_without_extension}.pl"
    prologParsed = f"{filename_without_extension}_parsed.pl"
    
    #Convert from sol to Smt
    SolToSmt.SolToSmt(contract_file, output_file)
    
    #Parse smt for eldarica use
    SmtParser.smt_parser(output_file,smtParsed)
   
    #Convert from Smt to Pl
    SmtToPl.SmtToPl(smtParsed,outputProlog)
   
    #Parse pl for logtalk use
    PlParser.pl_parser(outputProlog,prologParsed)

    # Converto from Pl to Dot
    PlToDot.PlToDot(prologParsed)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()
