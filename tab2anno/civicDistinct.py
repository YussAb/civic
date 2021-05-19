#! usr/bin/env python


import argparse
import sys


if __name__=="__main__":
    parser=argparse.ArgumentParser(description="Get gene from vcf")
    parser.add_argument('-v','--vcf',action='store',type=str,help="Path of the VCF file", required=True, default=None) #potrebbe esserci un'opzione type=file
    args=parser.parse_args()

    vcf_file_path = args.vcf

    try:
        vcf_file=open(vcf_file_path, "r" )
    except:
        sys.exit("The file {} doesn't exist".format(vcf_file_path))
    
    header=[]
    line=vcf_file.readline()
    while line != "":
        if line[0] == '#':
            print(line.rstrip("\n"))
        else: 
            vcf_fields=line.split()
            CHROM=vcf_fields[0]
            POS=vcf_fields[1]
            ID=vcf_fields[2]
            REF=vcf_fields[3]
            ALT=vcf_fields[4]
            QUAL=vcf_fields[5]
            FILTER=vcf_fields[6]
            INFO=vcf_fields[7]
            split_info=INFO.split(";")
            #gn=split_info[0]
            #vt=split_info[1]
            csq=split_info[2]
            csq_split = csq.split(",")
            for transcripts in csq_split:
                    if transcripts.startswith("CSQ="):
                        print(CHROM + "\t" + POS + "\t" + ID + "\t" + REF +  "\t" + ALT + "\t" + QUAL + "\t" + FILTER + "\t" + transcripts)
                    else:
                        transcripts=( "CSQ=" + transcripts)
                        print(CHROM + "\t" + POS + "\t" + ID + "\t" + REF +  "\t" + ALT + "\t" + QUAL + "\t" + FILTER + "\t" + transcripts)
        line=vcf_file.readline()
    vcf_file.close()
 
