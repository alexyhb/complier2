#include <stdio.h>
#include "calc3.h"
#include "y.tab.h"

static int lbl;

/* Pop stack operation */
void popStack(char r1[], char r2[])
{
    printf("\tpopq\t%%%s\n", r1);
    printf("\tpopq\t%%%s\n", r2);
}

int ex(nodeType *p) {
    int lbl1, lbl2;

    if (!p) return 0;
    switch(p->type) {
    case typeCon:  
        printf("\tpushq\t$%d\n", p->con.value); 
        break;
    case typeId:    
        printf("\tpushq\t%c\n", p->id.i + 'a'); 
        break;
    case typeOpr:
        switch(p->opr.oper) {
        case WHILE:
            printf("\nL%03d:\n", lbl1 = lbl++);
            ex(p->opr.op[0]);
            printf("\tL%03d\n", lbl2 = lbl++);
            ex(p->opr.op[1]);
            printf("\tjmp\tL%03d\n", lbl1);
            printf("\nL%03d:\n", lbl2);
            break;
        case IF:
            ex(p->opr.op[0]);
            if (p->opr.nops > 2) {
                /* if else */
                printf("\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("\tjmp\tL%03d\n", lbl2 = lbl++);
                printf("\nL%03d:\n", lbl1);
                ex(p->opr.op[2]);
                printf("\nL%03d:\n", lbl2);
            } else {
                /* if */
                printf("\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("\nL%03d:\n", lbl1);
            }
            break;
        case PRINT:     
            ex(p->opr.op[0]);
            // Call 'printf'
            printf("\tmovq\t$print_int, %%rdi\n");
            printf("\tpopq\t%%rax\n");
            printf("\tmovq\t%%rax, %%rsi\n");
            printf("\tcall\tprintf\n");
            break;
        case '=':       
            ex(p->opr.op[1]);
            printf("\tpopq\t%c\n", p->opr.op[0]->id.i + 'a');
            break;
        case UMINUS:    
            ex(p->opr.op[0]);
            printf("\tpopq\t%%rax\n");
            printf("\tneg\t%%rax\n");
            printf("\tpushq\t%%rax\n");
            break;
    case FACT:
        ex(p->opr.op[0]);
        printf("\tpopq\t%%rdi\n");
        printf("\tcall\tfact\n");
        printf("\tpushq\t%%rax\n");
        break;
    case LNTWO:
        ex(p->opr.op[0]);
        printf("\tpopq\t%%rdi\n");
        printf("\tcall\tlntwo\n");                
        printf("\tpushq\t%%rax\n");
        break;
        default:
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);
            switch(p->opr.oper) {
            case GCD:
                popStack("rsi", "rdi"); 
                printf("\tcall\tgcd\n"); 
                printf("\tpushq\t%%rax\n");
            break;
            case '+':   
                popStack("rbx", "rax");
                printf("\taddq\t%%rbx, %%rax\n"); 
                printf("\tpushq\t%%rax\n");
            break;
            case '-':   
                popStack("rbx", "rax");
                printf("\tsubq\t%%rbx, %%rax\n");
                printf("\tpushq\t%%rax\n");
            break; 
            case '*': 
                popStack("rbx", "rax");
                printf("\timulq\t%%rbx\n");
                printf("\tpushq\t%%rax\n");
            break;
            case '/':   
                popStack("rbx", "rax");
                printf("\tcdq\n");
                printf("\tidivq\t%%rbx\n");
                printf("\tpushq\t%%rax\n");
            break;
            case '<':
                popStack("rbx", "rax");
                printf("\tcmp\t%%rbx, %%rax\n");
                printf("\tjge");
            break;
            case '>':
                popStack("rbx", "rax");
                printf("\tcmp\t%%rbx, %%rax\n");
                printf("\tjle");               
            break;
            case GE:
                popStack("rbx", "rax");
                printf("\tcmp\t%%rbx, %%rax\n");
                printf("\tjl");
            break;
            case LE:
                popStack("rbx", "rax");
                printf("\tcmp\t%%rbx, %%rax\n");
                printf("\tjg");
            break;
            case NE:
                popStack("rbx", "rax");
                printf("\tcmp\t%%rbx, %%rax\n");
                printf("\tje");
            break;
            case EQ:
                popStack("rbx", "rax");
                printf("\tcmp\t%%rbx, %%rax\n");
                printf("\tjne");
            break;
            }
        }
    }
    return 0;
}
