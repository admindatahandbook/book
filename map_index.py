import csv
import sys, getopt

def print_help(text):
    print ("")
    print ('map_index.py -i <inputfile> -o <outputfile>')
    print (text,"\n")

def parseargs(argv):
   inputfile = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
      #print("opts = " , opts, " args=",args)
   except getopt.GetoptError:
      print_help()
      sys.exit(2)
   for opt, arg in opts:
      if opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
      else:
         print_help()
         sys.exit(2)
   print ('Input file is ', inputfile)
   print ('Output file is ', outputfile)
   if outputfile == "":
       print_help("Incomplete output file. Please try again.")
       sys.exit(2)
   if inputfile == "":
       print_help("Incomplete input file. Please try again.")
       sys.exit(2)
   return inputfile, outputfile

def replace(infile, outfile, lookup):

    matches = 0
    with open(lookup,mode='r') as lookupfile:
        reader = csv.reader(lookupfile)
        headers = next(reader, None)
        mydict = {rows[0]:rows[1] for rows in reader}
        #print(mydict)

    with open(infile,mode='rt') as texfile:
        with open(outfile,mode='wt') as outf:
            for line in texfile:
                for key in mydict.keys():
                    search_key = "\index{" + key + "}"
                    replace_text = "\index{" + mydict[key] + "}"
                    if search_key in line:
                        matches = matches + 1
                        #print(key,mydict[key],sep='=')
                        line = line.replace(search_key,replace_text)
                        #print(line)
                outf.write(line)
    return matches

if __name__ == "__main__":
    inputfile, outputfile = parseargs(sys.argv[1:])
    matches = replace(inputfile,outputfile,lookup='index_term_mapping.csv')
    print(matches," matches found")




