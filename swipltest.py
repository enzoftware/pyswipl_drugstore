from pyswip import Prolog

def main():
    prolog = Prolog()
    prolog.consult("console.pl")
    result = prolog.query("hypothesis(cold).")
    disease = "unknow"
    for f in result:
        print(f)
        disease = f
    
    print(disease)
    print(result)

if __name__ == "__main__":
    main()