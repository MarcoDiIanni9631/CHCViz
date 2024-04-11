import re

def leggi_file(nome_file):
    with open(nome_file, 'r') as f:
        return f.read()

def scrivi_file(nome_file, contenuto):
    with open(nome_file, 'w') as f:
        f.write(contenuto)

def elabora_contenuto(contenuto):
    # Sostituzione " =>" con "_to_"
    contenuto = contenuto.replace("mapping(address => uint256)", "mapping__address_to_uint256__")    
    contenuto = contenuto.replace(" => ", "_to_")
    contenuto = contenuto.replace(".", "_")
    contenuto = contenuto.replace("-18446744073709551616", "0")
    contenuto = contenuto.replace("115792089237316195423570985008687907853269984665640564039457584007913129639935", "1158")
    contenuto = contenuto.replace("1461501637330902918203684832716283019655932542975", "146")
    contenuto = contenuto.replace("3504541104", "35")
    contenuto = contenuto.replace("773487949", "77")
    contenuto = contenuto.replace("3732496093", "37")
    contenuto = contenuto.replace("false", "ff")
    #contenuto = contenuto.replace("tuple(bool,bytes)", "tuple__bool,bytes__")



    
    # Sostituzione dei punti
    righe = contenuto.split('\n')
    for i in range(len(righe)):
        if righe[i].endswith('_'):
            righe[i] = righe[i][:-1] + '.' # Rimuovi l'ultimo carattere e aggiungi il punto

    return '\n'.join(righe)



def main():
    #nome_file_input = 'c:\\Users\\giuli\\OneDrive\\Desktop\\logtalk\\no_query_assert\\no_qa.pl'
    #nome_file_output = 'c:\\Users\\giuli\\OneDrive\\Desktop\\logtalk\\no_query_assert\\no_qa_2.pl'

    nome_file_input = input("Inserisci il nome del file di input: ")
    nome_file_output = input("Inserisci il nome del file di output: ")

    # Leggi il contenuto del file di input
    contenuto = leggi_file(nome_file_input)

    # Esegui le operazioni sul contenuto
    contenuto_elaborato = elabora_contenuto(contenuto)

    # Scrivi il risultato nel file di output
    scrivi_file(nome_file_output, contenuto_elaborato)

    print("Operazioni completate. Contenuto elaborato scritto in", nome_file_output)

if __name__ == "__main__":
    main()