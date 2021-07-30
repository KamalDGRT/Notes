# L dvision generator for conversions.
#  Author: github.com/KamalDGRT

def give_me_L_division(num, obase):
    '''
    Utitly function to display L division tree for a given conversion.

    Arguments:
    num   -> The number to be converted
    obase -> The output base

    Returns: None
    '''

    spaces = " "

    first = True
    while(num > 0):
        quotient = int(num / obase)
        if first: 
            print(obase, spaces, "│  ", num)
            print(spaces, spaces, "├──────")
            first = False
            continue
        else:
            print(obase,  spaces, "│  ", quotient, "    ----- ", num % obase)
        num = quotient
        if (quotient == 1):
            print(spaces, spaces, "└───────")
            break
        else:
            print( spaces, spaces, "├──────")

if __name__ == "__main__":
    give_me_L_division(15, 2)
