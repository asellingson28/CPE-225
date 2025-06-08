#include <stdio.h>
#include <string.h>
int main() {
    char str1[100];
    char str2[100];
    char result[200];  
    int i=0;
    int j = 0;  
    printf("Enter the first string:     ");
    fgets(str1, sizeof str1, stdin);
    str1[strcspn(str1, "\n")] = '\0';       


    printf("Enter the second string:    ");
    fgets(str2, sizeof str2, stdin);
    str2[strcspn(str2, "\n")] = '\0';      

    while (str1[i] != '\0') {
        result[i] = str1[i];
        i++;
    }
    result[i] = ' ';  
    i++;
    while (str2[j] != '\0') {
        result[i] = str2[j];
        i++;
        j++;
    }

    result[i] = '\0';


    printf("First string: %s\n", str1);
    printf("Second string: %s\n", str2);
    printf("Concatenated string: %s\n", result);

    return 0;
}