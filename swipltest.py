from pyswip import Prolog

def main():
    prolog = Prolog()
    prolog.consult("console.pl")
    result = prolog.query("go")
    disease = "unknow"
    for f in result:
        disease = f
    
    print(disease)

if __name__ == "__main__":
    main()