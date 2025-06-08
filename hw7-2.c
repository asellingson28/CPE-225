#include <stdio.h>

int main() {
    char str1[100];
    char str2[100];
    int i = 0;
    
    printf("Enter the first string:     ");
    fgets(str1, sizeof str1, stdin);


    printf("Enter the second string:    ");
    fgets(str2, sizeof str2, stdin);

    while (str1[i] && str2[i] && str1[i] == str2[i]) {
        i++;
    }
    if (str1[i] == str2[i] && str1[i] == '\0' && str2[i] == '\0') { 
        printf("They are the same.\n");
    } else {
        printf("They are different.\n");
    }
    return 0;
}