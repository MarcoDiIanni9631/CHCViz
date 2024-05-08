import os
import subprocess

def dot_to_svg(contract_file):
    try:
        # Execute the command to convert the Dot file to SVG format
        command = f"dot -Tsvg {contract_file} -o {contract_file}.svg"
        subprocess.run(command, shell=True, check=True)
        
        # Check if the SVG file is generated successfully
        svg_file = f"{contract_file}.svg"
        if os.path.exists(svg_file):
            print(f"SVG saved successfully: {svg_file}")
        else:
            print(f"Error: SVG file {svg_file} not generated.")
            
    except subprocess.CalledProcessError as e:
        # Handle any errors that occur during the command execution
        print("Error executing command:", e)

def main():
    # Set contract_file to "Bank_parsed.dot"
    contract_file = "Bank_parsed.dot"
    
    # Call the function to convert Dot to SVG
    dot_to_svg(contract_file)

# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function
    main()
