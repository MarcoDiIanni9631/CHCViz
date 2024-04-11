import subprocess
#import parser
#import CheckRequirement

def solidity_to_smtlib(commandSoltoSmtlib):

    # Your code here to convert Solidity contract to SMT-LIB format
  
    # Open solidity file to save the output
    with open("Contract.smtLib2", "w") as f:
        # Execute the command and paste the result on the file
        subprocess.run(commandSoltoSmtlib, shell=True, stdout=f)
        
        output_variable = subprocess.run(commandSoltoSmtlib, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
    return output_variable.stdout.decode('utf-8')


"""def smtlib_to_prolog(smtlib_file):
    # Your code here to convert SMT-LIB query to Prolog via Eldarica
      
      commandSmtLibToProlog= commandSmtLibToProlog+smtlib_file

    # Open prolog file to save the output
    with open("Contract.pl", "w") as f:
        # Esegui il comando e redirigi l'output sul file
        subprocess.run(commandSmtLibToProlog, shell=True, stdout=f)
        
        output_variable = subprocess.run(commandSmtLibToProlog, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
    return output_variable.stdout.decode('utf-8')

"""
"""
def prolog_to_prologParsed(prolog_raw):
    # Call to the parser
    pass

def prolog_to_dot(prolog_parsed):
    # Your code here to convert Prolog query to .dot format
    pass

def dot_to_svg(dot_file):
    # Your code here to convert .dot file to .svg format
    pass
    
"""

def run_automation(contract_file):
    # Convert Solidity contract to SMT-LIB format
    smtlib_query = solidity_to_smtlib(contract_file)
    
    # Convert SMT-LIB query to Prolog
    prolog_raw = smtlib_to_prolog(smtlib_query)
    

    # Parse Prolog query raw to generate a parsed prolog file
    #prolog_parsed = prolog_to_prologParsed(prolog_raw)

    # Parse Prolog query and generate .dot file
    #dot_file = prolog_to_dot(prolog_parsed)
    
    # Convert .dot file to .svg format
   # svg_file = dot_to_svg(dot_file)
    
  #  return svg_file


def main():
    # Start the automation
    commandSoltoSmtlib = "solc --model-checker-engine chc --model-checker-targets assert --model-checker-print-query --model-checker-solvers smtlib2 --model-checker-timeout 1000 --model-checker-show-unproved /home/marco/Desktop/Bank.sol "
    #commandSmtLibToProlog = "./eld -p "
   # contract_file = ""
    solidity_to_smtlib(commandSoltoSmtlib)
   # smtlib_to_prolog(smtlib_file)
   # svg_output = run_automation(contract_file)
   # print("SVG file generated:", svg_output)



# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()