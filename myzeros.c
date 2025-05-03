#include <stdio.h>
/* Arjan Ellingson, Greta Gamble */

int main(void) {
        printf("Welcome to the Zeros Program.\n");
        int input;
        // int result;
        char entry = 'y';
        int counter = 0;
	unsigned int mask = 32;
	while(entry != 'n') {
        printf("\nPlease enter a number: ");
        scanf("%d", &input);
        counter = 0;
		int i;
	    for (i = 31; i>=0; i--) { 
			if ((input >> i)  & 1) {
				break;
			}
			counter++;

		}
		printf("The number of leading zeros is: %d\n", counter);
                printf("Continue (y, n)?: ");
                scanf(" %c", &entry);	

	}
	printf("Exiting\n");
	return 0;
}


