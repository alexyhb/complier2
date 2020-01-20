#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: x86-64-driver.sh <filename>"
	exit 1
fi

echo $1 | grep -q  ".calc$" > /dev/null 
if [[ $? != 0 ]]; then
	echo "Usage: x86-64-driver.sh <filename>"
	echo "The file should be named with the ’.calc’ ending!!!"
	exit 1
fi

FILE_DIR=$1
FILE_NAME=$(echo $1 | sed -e 's/.*\/\([a-zA-Z0-9]*\).*/\1/g')
ASM_FILE_NAME=${FILE_NAME}.s

ASM_CODE=$(./bin/calc3i < $FILE_DIR)
EXLIB=".global fact\n.global gcd\n.global lntwo"
SECTION=".section"
DATA=${SECTION}" .data"
TEXT=${SECTION}" .text"
BSS=".bss"
GLOBAL_MAIN=".global main\n"
MAIN="main:"
PRINT_INT="print_int:\n\t.asciz\t\"%d\\\n\""

PRE="\tmovq\t\$0, %rbp\n\tpushq\t%rbp\n\tmovq\t%rsp, %rbp\n\tmovq\t%rax, %rdi\n"
SUF="\txor\t%rax, %rax\n\tpopq\t%rbp\n\tcall\texit\n"

echo "$DATA" 			>  $ASM_FILE_NAME
echo -e "$PRINT_INT\n" 	>> $ASM_FILE_NAME
echo "$TEXT" 			>> $ASM_FILE_NAME
echo -e "$EXLIB\n"		>> $ASM_FILE_NAME
echo -e "$GLOBAL_MAIN"	>> $ASM_FILE_NAME
echo "$MAIN"			>> $ASM_FILE_NAME
echo -e "$PRE"			>> $ASM_FILE_NAME
echo "$ASM_CODE"		>> $ASM_FILE_NAME
echo -e "$SUF"			>> $ASM_FILE_NAME
echo -e "$BSS\n"		>> $ASM_FILE_NAME
for var in {a..z}; 
do
	echo ".global $var"	 >> $ASM_FILE_NAME
	echo "$var: .quad 0" >> $ASM_FILE_NAME
done

gcc -g $ASM_FILE_NAME -o $FILE_NAME lib/lib.a