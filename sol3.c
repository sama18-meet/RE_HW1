#include <stdio.h>

int main() {
	int resources[5] = { 0 };
	char line[12];
	// {road, settlement, city, development}
	while (scanf(" %[^\n]", line) != -1) {
		printf(line);
		if (line[0] == 'r') {
			resources[0]++;
			resources[1]++;
		}
		else if (line[0] == 's') {
			resources[0]++;
			resources[1]++;
			resources[2]++;
			resources[3]++;
		}
		else if (line[0] == 'c') {
			resources[3] += 2;
			resources[4] += 3;
		}
		else if (line[0] == 'd') {
			resources[2]++;
			resources[3]++;
			resources[4]++;
		}
	}
	printf("%02d %02d %02d %02d %02d\n", resources[0], resources[1], resources[2], resources[3], resources[4]);


}