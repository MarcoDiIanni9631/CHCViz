import sys
import myenv.CheckRequirement
import myenv.SolToSmt
import os
import myenv.SmtParser
import myenv.SmtToPl
import myenv.PlParser
#import PlToDot_gnu 
import myenv.PlToDot_swi
import myenv.DotToSvg

def toolchain():

    # Check if the correct number of command-line arguments is provided
    if len(sys.argv) != 2:
        print("Usage: python script.py <solidity_file_path> ")
        return

    # Extract command-line arguments
    solidity_file_with_path = sys.argv[1]


    # Check requirements first
    if not (myenv.CheckRequirement.check_requirements()):
        return 

    # If all requirements are satisfied, initialize file names
    
    solidity_file = os.path.basename(solidity_file_with_path)
    filename_without_extension = os.path.splitext(solidity_file)[0]  # Extract filename without extension


    output_file = f"{filename_without_extension}.txt" 
    smtParsed = f"{filename_without_extension}.smt2"
    outputProlog = f"{filename_without_extension}.pl"
    prologParsed = f"{filename_without_extension}_parsed.pl"
    
    prolog_without_extension_prolog = os.path.splitext(prologParsed)[0]  # Extract filename without extension
    
    dotFile = f"{prolog_without_extension_prolog}_object_xref_diagram.dot"
    
    #Convert from sol to Smt
    myenv.SolToSmt.SolToSmt(solidity_file_with_path, output_file)
    
    #Parse smt for eldarica use
    myenv.SmtParser.smt_parser(output_file, smtParsed)
   
    #Convert from Smt to Pl
    myenv.SmtToPl.SmtToPl(smtParsed, outputProlog)
   
    #Parse pl for logtalk use
    myenv.PlParser.pl_parser(outputProlog, prologParsed)

    # Converto from Pl to Dot
    myenv.PlToDot_swi.PlToDot_swi(prologParsed)

    # Converto from Pl to Dot
    myenv.DotToSvg.dot_to_svg(dotFile)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    toolchain()
