import shutil
import subprocess
import time
import os

def PlToDot_swi(contract_file):
    try:

        #os.chdir("/home/marco/")
        # Open SwiProlog/logtalk
        gprolog_process = subprocess.Popen(["swilgt"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        
        # Waitin for Swiprolog to start
        time.sleep(2)
        
        #initialize contract name without extension
        contract_without_extension = os.path.splitext(contract_file)[0]  # Extract filename without extension

        # Send commands directly to Gprolog interface 
        #gprolog_process.stdin.write(f"chdir('GITHUB/SmartContractToGraph').\n")
        gprolog_process.stdin.write(f"consult('{contract_file}').\n")
        gprolog_process.stdin.write("{diagrams(loader), hook_objects(loader)}.\n")
        gprolog_process.stdin.write(f"logtalk_load('{contract_without_extension}', [hook(object_wrapper_hook)]), xref_diagram::entity('{contract_without_extension}').\n")
        
        # Close the input
        gprolog_process.stdin.close()

        # Gprolog Output optional
       # output, errors = gprolog_process.communicate()

        # Print Output Gprolog
      #  print(output)

        # Wait for Swiprolog to terminate the process
        gprolog_process.wait()
        

        print(f"Dot file generated successfully")
        
        # Ottieni il percorso della directory in cui hai lanciato lo script
        destination_directory = os.path.join(os.getcwd(), "dot_dias")
        
        # Ottieni il percorso completo del file .dot
        dot_file_path = os.path.join(destination_directory, f"{contract_without_extension}_object_xref_diagram.dot")
        
        # Sposta il file .dot alla directory di destinazione
        shutil.move(dot_file_path, os.getcwd())
        
        print("File moved successfully!")

    except subprocess.CalledProcessError as e:
        # Gestisci eventuali errori durante l'esecuzione del processo Gprolog
        print("Error during the execution of SwiProlog/lgt:", e)

def main():
   contract_file = "Bank_parsed.pl"
   PlToDot_swi(contract_file)

if __name__ == "__main__":
    main()