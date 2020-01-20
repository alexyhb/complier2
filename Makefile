makCC = gcc
LD = gcc

COM_DIR = lexyacc-code
BIN_DIR = bin
SRC_DIR = src
LIB_DIR = lib

RM = /bin/rm
MV = /bin/mv

all: build

build: flex_bison
	@echo "Build: gcc ./lexyacc-code/y.tab.o ./lexyacc-code/lex.yy.o ./lexyacc-code/calc3i.c -o calc3i"
	@$(LD) $(COM_DIR)/y.tab.o $(COM_DIR)/lex.yy.o $(COM_DIR)/calc3i.c -o calc3i
	@$(MV) calc3i $(BIN_DIR)/

flex_bison: flex
	@echo "Flex_bison: gcc -c ./lexyacc-code/y.tab.c ./lexyacc-code/lex.yy.c"
	@$(CC) -c $(COM_DIR)/y.tab.c $(COM_DIR)/lex.yy.c
	@$(MV) lex.yy.o $(COM_DIR)/
	@$(MV) y.tab.o $(COM_DIR)/

flex: bison
	@echo "Flex: flex ./lexyacc-code/calc3.l"
	@flex $(COM_DIR)/calc3.l
	@$(MV) lex.yy.c $(COM_DIR)/

bison: exlib
	@echo "Bison: bison -y -d ./lexyacc-code/calc3.y"
	@bison -y -d $(COM_DIR)/calc3.y
	@$(MV) y.tab.c $(COM_DIR)/
	@$(MV) y.tab.h $(COM_DIR)/

exlib:
	@$(CC) -c -o $(SRC_DIR)/fact.o $(SRC_DIR)/fact.s
	@$(CC) -c -o $(SRC_DIR)/lntwo.o $(SRC_DIR)/lntwo.s
	@$(CC) -c -o $(SRC_DIR)/gcd.o $(SRC_DIR)/gcd.s
	@ar rcs $(LIB_DIR)/lib.a $(SRC_DIR)/fact.o $(SRC_DIR)/lntwo.o $(SRC_DIR)/gcd.o

clean:
	@echo "Clean up all stuff!!!"
	$(RM) $(COM_DIR)/lex.yy.o
	$(RM) $(COM_DIR)/y.tab.o
	$(RM) $(COM_DIR)/lex.yy.c
	$(RM) $(COM_DIR)/y.tab.c
	$(RM) $(COM_DIR)/y.tab.h
	$(RM) $(LIB_DIR)/lib.a
	$(RM) $(SRC_DIR)/fact.o
	$(RM) $(SRC_DIR)/lntwo.o
	$(RM) $(SRC_DIR)/gcd.o
	$(RM) $(BIN_DIR)/calc3i



