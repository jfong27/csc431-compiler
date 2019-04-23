#include <stdio.h>
void printf_int(int x) {
   printf("%d", x);
}

void printf_newline(int x) {
   printf("%d\n", x);
}

int read() {
   int x;
   scanf(" %d", &x);
   return x;
}
