def cat_said(phrase):
    sample = """            
                                   {0}
                                 < {1} >
                                   {2}                
                 
                                /  
                    /\_/\      /    
                   ( ○.○ )  
                   >  ^  <  """.format('_'*len(phrase),phrase,'-'*len(phrase))
    return sample



def salary_list_2_1():
    prod_list=[]
    while True:
        prod = input('Enter a product:\n')
        if prod.strip()=='':
            break
        else:
            prod_list.append(prod)
    return prod_list

def salary_list_2_2():
    prod_dict={}
    while True:
        prod = input('Enter a product:\n')
        if prod.strip()=='':
            break
        else:
            if prod not in prod_dict.keys():
                prod_dict[prod]=1
            else:
                prod_dict[prod]+=1
    prod_dict=sorted(prod_dict.items(), key=lambda prod: prod[1], reverse=True)

print(cat_said('Hello world'))
