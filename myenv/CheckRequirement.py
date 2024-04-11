import subprocess

# Lista delle dipendenze
required_packages = [
    "solc",
    "scala",
  #  "logtalk",
  # "graphviz"
  "gprolog",
]

# Funzione per controllare se una dipendenza è installata
def check_package(package):
    try:
        subprocess.run([package, "--version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
        return True
    except subprocess.CalledProcessError:
        try:
            subprocess.run([package, "-version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
            return True
        except subprocess.CalledProcessError:
            return False

# Funzione per controllare tutte le dipendenze
def check_requirements():
    missing_packages = []
    for package in required_packages:
        if not check_package(package):
            missing_packages.append(package)
    return missing_packages

# Esegui il controllo delle dipendenze
if __name__ == "__main__":
    missing_packages = check_requirements()
    if missing_packages:
        print("Le seguenti dipendenze sono mancanti:")
        for package in missing_packages:
            print(f"- {package}")
    else:
        print("Tutte le dipendenze sono soddisfatte.")
