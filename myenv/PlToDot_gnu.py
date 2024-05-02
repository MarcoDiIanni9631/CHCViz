import subprocess
import time
import os

def PlToDot(contract_file):
    try:


        # Open Gprolog/logtalk
        gprolog_process = subprocess.Popen(["gplgt"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        
        # Waitin for Gprolog to start
        time.sleep(1)
        
        #initialize contract name without extension
        contract_without_extension = os.path.splitext(contract_file)[0]  # Extract filename without extension

        # Send commands directly to Gprolog interface 
        gprolog_process.stdin.write(f"consult('{contract_file}').\n")
        gprolog_process.stdin.write("{diagrams(loader), hook_objects(loader)}.\n")
        gprolog_process.stdin.write(f"logtalk_load('{contract_without_extension}', [hook(object_wrapper_hook)]), xref_diagram::entity('{contract_without_extension}').\n")
        
        # Close the input
        gprolog_process.stdin.close()

        # Gprolog Output optional
       # output, errors = gprolog_process.communicate()

        # Print Output Gprolog
      #  print(output)

        # Wait for Gprolog to terminate the process
        gprolog_process.wait()

        print(f"Dot file generated successfully")
            

    except subprocess.CalledProcessError as e:
        # Gestisci eventuali errori durante l'esecuzione del processo Gprolog
        print("Error during the execution of Gprolog/lgt :", e)

def main():
   contract_file = "Bank_parsed.pl"
   PlToDot(contract_file)

if __name__ == "__main__":
    main()
