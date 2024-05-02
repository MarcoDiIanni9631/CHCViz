import sys
import os
import glob
import myenv.CheckRequirement
import myenv.SolToSmt
import myenv.SmtParser
import myenv.SmtToPl
import myenv.PlParser
import myenv.PlToDot_swi
import myenv.DotToSvg

def toolchain_for_file(solidity_file_with_path):

    print("####################################")  # New line for clarity

    # Check requirements first
    if not myenv.CheckRequirement.check_requirements():
        return
    
    print(f"Start of the conversion for {solidity_file_with_path}.")
    print()  # New line for clarity

    # If all requirements are satisfied, initialize file names
    solidity_file = os.path.basename(solidity_file_with_path)
    filename_without_extension = os.path.splitext(solidity_file)[0]  # Extract filename without extension

    output_file = f"{filename_without_extension}.txt" 
    smtParsed = f"{filename_without_extension}.smt2"
    outputProlog = f"{filename_without_extension}.pl"
    prologParsed = f"{filename_without_extension}_parsed.pl"
    prolog_without_extension_prolog = os.path.splitext(prologParsed)[0]  # Extract filename without extension
    dotFile = f"{prolog_without_extension_prolog}_object_xref_diagram.dot"
    
    # Convert from sol to Smt
    myenv.SolToSmt.SolToSmt(solidity_file_with_path, output_file)
    
    # Parse smt for eldarica use
    myenv.SmtParser.smt_parser(output_file, smtParsed)
   
    # Convert from Smt to Pl
    myenv.SmtToPl.SmtToPl(smtParsed, outputProlog)
   
    # Parse pl for logtalk use
    myenv.PlParser.pl_parser(outputProlog, prologParsed)

   # print("back to toolchain readdy to plToDot")

    # Convert from Pl to Dot
    myenv.PlToDot_swi.PlToDot_swi(prologParsed)

    #print("back to toolchain ready to dot_toSvg")
    # Convert from Dot to Svg
    myenv.DotToSvg.dot_to_svg(dotFile)
    
    print()  # New line for clarity
    print(f"Conversion completed for {solidity_file_with_path}.")
    print()  # New line for clarity


def toolchain_for_folder(folder_path, recursive=False):
    # If recursive=True, apply toolchain to all .sol files in the folder and its subfolders
    if recursive:
        # Walk through all subdirectories and get all .sol files
        found_sol_files = False
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                if file.endswith(".sol"):
                    found_sol_files = True
                    solidity_file_with_path = os.path.join(root, file)
                    try:
                        toolchain_for_file(solidity_file_with_path)
                    except Exception as e:
                        print(f"Error processing {solidity_file_with_path}: {str(e)}")
        
        if not found_sol_files:
            print("No .sol files found in the specified folder.")
            
    else:
        # List all .sol files in the folder
        solidity_files = glob.glob(os.path.join(folder_path, '*.sol'))
        if solidity_files:
            for solidity_file_with_path in solidity_files:
                try:
                    toolchain_for_file(solidity_file_with_path)
                except Exception as e:
                    print(f"Error processing {solidity_file_with_path}: {str(e)}")
        else:
            print("No .sol files found in the specified folder.")

# Check if the script is being run as the main program
if __name__ == "__main__":
    # If a single .sol file is provided as command line argument, apply toolchain to that file
    if len(sys.argv) == 2 and os.path.isfile(sys.argv[1]) and sys.argv[1].endswith(".sol"):
        solidity_file_with_path = sys.argv[1]
        toolchain_for_file(solidity_file_with_path)
    # If a folder path is provided as command line argument without recursion
    elif len(sys.argv) == 3 and sys.argv[1] == "-f" and os.path.isdir(sys.argv[2]):
        folder_path = sys.argv[2]
        toolchain_for_folder(folder_path, recursive=False)
    # If a folder path is provided as command line argument with recursion
    elif len(sys.argv) == 3 and sys.argv[1] == "-r" and os.path.isdir(sys.argv[2]):
        folder_path = sys.argv[2]
        toolchain_for_folder(folder_path, recursive=True)
    else:
        print("Usage:")
        print("For a single .sol file:")
        print("python3 ToolChain.py <solidity_file_path>")
        print()  # New line for clarity
        print("For processing a folder without recursion:")
        print("python3 ToolChain.py -f <folder_path>")
        print()  # New line for clarity
        print("For processing a folder with recursion:")
        print("python3 ToolChain.py -r <folder_path>")
