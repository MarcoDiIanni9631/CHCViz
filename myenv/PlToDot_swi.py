import shutil
import signal
import subprocess
import time
import os

def PlToDot_swi(contract_file):
    try:

        #os.chdir("/home/marco/")
        # Open SwiProlog/logtalk
        swi_lgt_process = subprocess.Popen(["swilgt"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        
        # Waitin for Swiprolog to start
        time.sleep(2)
        
        #initialize contract name without extension
        contract_without_extension = os.path.splitext(contract_file)[0]  # Extract filename without extension

        # Send commands directly to Gprolog interface 
        #swi_lgt_process.stdin.write(f"chdir('GITHUB/SmartContractToGraph').\n")
        swi_lgt_process.stdin.write(f"consult('{contract_file}').\n")
        swi_lgt_process.stdin.write("{diagrams(loader), hook_objects(loader)}.\n")
        swi_lgt_process.stdin.write(f"logtalk_load('{contract_without_extension}', [hook(object_wrapper_hook)]), xref_diagram::entity('{contract_without_extension}').\n")
        
        # Close the input
        swi_lgt_process.stdin.close()

        # Set a timeout of 10 seconds
        timeout = 10
        start_time = time.time()
        
        while time.time() - start_time < timeout:
            if swi_lgt_process.poll() is not None:
                # Process has terminated before the timeout
                break
            time.sleep(0.1)  # Check every 0.1 second
        
        # Check if the process is still running
        if swi_lgt_process.poll() is None:
            # If the process is still running, send SIGTERM signal
            os.kill(swi_lgt_process.pid, signal.SIGTERM)
            print("Timeout reached. Process terminated.")
            print()
            return False

        else:
            # Wait for Swiprolog to terminate the process
         #   swi_lgt_process.wait()
            #print(f"Dot file generated successfully")    
        # Gprolog Output optional
       # output, errors = swi_lgt_process.communicate()

        # Print Output Gprolog
      #  print(output)

        # Wait for Swiprolog to terminate the process
        #swi_lgt_process.wait()
        

       # print(f"Dot file generated successfully")
        
        # Ottieni il percorso della directory in cui hai lanciato lo script
            destination_directory = os.path.join(os.getcwd(), "dot_dias")
        
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
        # Gestisci eventuali errori durante l'esecuzione del processo Gprolog
        print("Error during the execution of SwiProlog/lgt:", e)

def main():
   contract_file = "Bank_parsed.pl"
   PlToDot_swi(contract_file)

if __name__ == "__main__":
    main()
