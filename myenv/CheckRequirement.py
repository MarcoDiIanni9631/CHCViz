import subprocess

# List of dependencies
required_packages = [
    "solc",
    "java",
    "dot",
    "swipl",
]

# Function to check if a package is installed
def check_package(package):
    try:
        subprocess.run([package, "--version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
        return True
    except FileNotFoundError:
        return False

# Function to check all dependencies
def check_requirements():
    missing_packages = []
    for package in required_packages:
        if not check_package(package):
            missing_packages.append(package)

    if missing_packages:
        print("The following dependencies are missing:")
        for package in missing_packages:
            print(f"- {package}")
            return False
    else:
        print("All dependencies are satisfied.")
        return True
    
# Perform dependency check
if __name__ == "__main__":
    check_requirements()