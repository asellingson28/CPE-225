#include <stdio.h>

int main() {
    char str[100];
    int length = 0;
    
    printf("Enter the first string:     ");
    scanf("%99[^\n]", str);  // prevent more than 99 chars, or when new line is encountered
    while (str[length] != '\0') {
        length++;
    }
    printf("Length of the string is: %d\n", length);

    return 0;
}