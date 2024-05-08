import signal
import subprocess
import shutil
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
    if not timeout_wrapper(myenv.SolToSmt.SolToSmt, (solidity_file_with_path, output_file)):
        return False
    
    # Parse smt for eldarica use
    if not timeout_wrapper(myenv.SmtParser.smt_parser, (output_file, smtParsed)):
        return False
    
    # Convert from Smt to Pl
    if not timeout_wrapper(myenv.SmtToPl.SmtToPl, (smtParsed, outputProlog)):
        return False
    
    # Parse pl for logtalk use
    if not timeout_wrapper(myenv.PlParser.pl_parser, (outputProlog, prologParsed)):
        return False

    # Convert from Pl to Dot
    if not myenv.PlToDot_swi.PlToDot_swi(prologParsed):
        return False

    # Convert from Dot to Svg
    if not timeout_wrapper(myenv.DotToSvg.dot_to_svg, (dotFile,)):
        return False

    rename_files(filename_without_extension)

    # Move the generated files to a folder with the same name as filename_without_extension
    move_files_to_folder(folder_path, filename_without_extension)

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


def timeout_wrapper(func, args, timeout=10):
    def handler(signum, frame):
        raise TimeoutError(f"{func.__name__} timed out")

    signal.signal(signal.SIGALRM, handler)
    signal.alarm(timeout)

    try:
        func(*args)
    except TimeoutError as e:
        print(f"Timeout error: {e}")
        return False
    finally:
        signal.alarm(0)

    return True


def rename_files(filename_without_extension):
    # Define the list of files to rename
    files_to_rename = [
        f"{filename_without_extension}_parsed_object_xref_diagram.dot",
        f"{filename_without_extension}_parsed_object_xref_diagram.dot.svg"
    ]

    # Rename each file
    for file_to_rename in files_to_rename:
        _, extension = os.path.splitext(file_to_rename)
        new_file_name = f"{filename_without_extension}{extension}"
        if os.path.exists(file_to_rename):
            os.rename(file_to_rename, new_file_name)
    #        print(f"Renamed {file_to_rename} to {new_file_name}")
        else:
            print(f"File {file_to_rename} does not exist, skipping rename operation")


def move_files_to_folder(folder_path, filename_without_extension):
    # Create the directory if it does not exist
    folder_name = f"{filename_without_extension}_files"
    full_folder_path = os.path.join(folder_path, folder_name)
   
    if not os.path.exists(full_folder_path):
        os.makedirs(full_folder_path)

    # Define the list of files to move
    files_to_move = [
        f"{filename_without_extension}.txt",
        f"{filename_without_extension}.smt2",
        f"{filename_without_extension}.pl",
        f"{filename_without_extension}_parsed.pl",
        f"{filename_without_extension}.dot",
        f"{filename_without_extension}.svg"
    ]

    # Move each file to the folder
    for file_to_move in files_to_move:
        full_file_path = os.path.join(os.getcwd(), file_to_move)
        if os.path.exists(full_file_path):
            # Replace existing files if necessary
            destination_file = os.path.join(full_folder_path, os.path.basename(file_to_move))
            os.replace(full_file_path, destination_file)
        #    print(f"Moved {file_to_move} to {folder_name}")
        else:
            print(f"File {file_to_move} does not exist, skipping move operation")

# Check if the script is being run as the main program
if __name__ == "__main__":
    # If a single .sol file is provided as command line argument, apply toolchain to that file
    if len(sys.argv) == 2 and os.path.isfile(sys.argv[1]) and sys.argv[1].endswith(".sol"):
        solidity_file_with_path = sys.argv[1]
        folder_path = os.path.dirname(solidity_file_with_path)
        toolchain_for_file(solidity_file_with_path)
    # If a folder path is provided as command line argument without recursion
    elif len(sys.argv) == 3 and sys.argv[1] == "-d" and os.path.isdir(sys.argv[2]):
        folder_path = sys.argv[2]
        toolchain_for_folder(folder_path, recursive=False)
    # If a folder path is provided as command line argument with recursion
    elif len(sys.argv) == 3 and sys.argv[1] == "-r" and os.path.isdir(sys.argv[2]):
        folder_path = sys.argv[2]
        toolchain_for_folder(folder_path, recursive=True)
    else:
        print("Usage:")
        print("For a single .sol file:")
        print("python3 chcviz.py <solidity_file_path>")
        print()  # New line for clarity
        print("For processing a folder without recursion:")
        print("python3 chcviz.py -d <directory_path>")
        print()  # New line for clarity
        print("For processing a folder with recursion:")
        print("python3 chcviz.py -r <folder_path>")
