import shutil
import signal
import subprocess
import time
import os

def PlToDot_swi(contract_file):
    try:

        print(f"{contract_file}")
       # time.sleep(100)
        # Execute the command to convert the Solidity contract to SMT-LIB format
        command = f"swilgt swilgt_pl2dot.pl {contract_file}"
        
        # Execute the command and capture the output
        output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, text=True)

        # Ottieni il percorso della directory in cui hai lanciato lo script
        destination_directory = os.path.join(os.getcwd(), "dot_dias")
       
        contract_without_extension = os.path.splitext(contract_file)[0]  # Extract filename without extension

        # Ottieni il percorso completo del file .dot
        dot_file_path = os.path.join(destination_directory, f"{contract_without_extension}_object_xref_diagram.dot")
        
        # Sposta il file .dot alla directory di destinazione
        if os.path.exists(dot_file_path):
                print("Dot file generated successfully")
                shutil.move(dot_file_path, os.getcwd())
                return True
        else:
                print(f"Dot file '{dot_file_path}' not generated. Unable to proceed with conversion.")
                return False
            



    except subprocess.CalledProcessError as e:
        # Handle any errors that occur during the command execution
        print("Error executing command:", e)

def main():
   contract_file = "Vault_wd-fin-revert_v2_parsed"
   PlToDot_swi(contract_file)

if __name__ == "__main__":
    main()
