import csv
import sys
import os

def main():  
    total_per_col={}

    filename=''
    try:
        filename=sys.argv[1]
    except:         
        return "provide a valid file"

    if os.path.isfile(filename):
        _,ext=os.path.splitext(filename)
        if ext!=".csv":             
            return "provide a valid file"
    try:
        fin=open(filename,"r",encoding="utf8")
    except:
        
        return ("provide a valid file")

    headerline=csv.reader(fin).__next__()
      
    for title in headerline:
        total_per_col[title]=0
    # print(total_per_col)
    for row in csv.reader(fin):
        sum_per_row(row,total_per_col,headerline)
    return total_per_col
            
def sum_per_row(row,total_per_col,headerline):
 
    for i in range(len(row)): 
        try:        
            total_per_col[headerline[i]]+=float(row[i])  
        except:
            continue  

if __name__=="__main__":
    print(main())



     
