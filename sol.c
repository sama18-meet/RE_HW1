#include <stdio.h>
#include <string.h>
#define MAX_INPUT_LENGTH 50

int main() {
    char s[MAX_INPUT_LENGTH];
    int get_proc_addr_ptr = 0;
    int strcspn_ptr = 0;
    int fgets_ptr = 0;
    int strcmp_ptr = 0;
    int printf_ptr = 0;
    int putchar_ptr = 0;
    int resourses[5] = { 0 };

    while (fgets(s, MAX_INPUT_LENGTH, stdin)) {
        s[strcspn(s, "\n")] = '\0'; // remove newline character
        if (strcmp(s, "road") == 0) {
            resourses[0]++;
            resourses[1]++;
        }
        if (strcmp(s, "settlement") == 0) {
            resourses[0]++;
            resourses[1]++;
            resourses[2]++;
            resourses[3]++;
        }
        if (strcmp(s, "city") == 0) {
            resourses[3] += 2;
            resourses[4] += 3;
        }
        if (strcmp(s, "development") == 0) {
            resourses[2]++;
            resourses[3]++;
            resourses[4]++;
        }
    }

    for (int i = 0; i < 5; i++) {
        printf("%02d ", resourses[i]);
    }
    printf("\n");

    return 0;
}