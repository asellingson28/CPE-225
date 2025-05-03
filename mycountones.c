
#include <stdio.h>
/* Arjan Ellingson, Greta Gamble */

int main(void) {
	int input;
	int result;
	char entry = 'y';
	int counter = 0;
	
	printf("Welcome to the CountOnes Program.\n");
	while (entry != 'n') {
		printf("\nPlease enter a number: ");
		scanf("%d", &input);
		counter = 0;
		unsigned int mask = 1;			
		
		while (mask != 0) {		
			
			result = ((unsigned int)input) & mask;
			if (result > 0) counter++;
			mask = mask << 1;
	
		}
 
		if (input < 0) counter++; // extra for counting the sign indicator
	

		printf("The number of bits set is: %d\n", counter);
		printf("Continue (y, n)?: ");
		scanf(" %c", &entry);

	}			
	printf("Exiting\n");
	return 0;


}


