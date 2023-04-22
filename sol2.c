#include <stdio.h>

int if_road(char* str1) {
    char* tmp = "road";
    int j = 0; 
    while (str1[j] != '\0') {
        if (str1[j] != tmp[j])
            return 0;
        j++;
    }
    if (tmp[j] == '\0')
        return 1;
    else
        return 0;
}

int if_city(char* str1) {
    char* tmp = "city";
    int j = 0;
    while (str1[j] != '\0') {
        if (str1[j] != tmp[j])
            return 0;
        j++;
    }
    if (tmp[j] == '\0')
        return 1;
    else
        return 0;
}

int if_settlement(char* str1) {
    char* tmp = "settlement";
    int j = 0;
    while (str1[j] != '\0') {
        if (str1[j] != tmp[j])
            return 0;
        j++;
    }
    if (tmp[j] == '\0')
        return 1;
    else
        return 0;
}

int if_development(char* str1) {
    char* tmp = "development";
    int j = 0;
    while (str1[j] != '\0') {
        if (str1[j] != tmp[j])
            return 0;
        j++;
    }
    if (tmp[j] == '\0')
        return 1;
    else
        return 0;;
}

int main() {
    char user_input[13];
    int get_proc_addr_ptr = 0;
    int strcspn_ptr = 0;
    int fgets_ptr = 0;
    int strcmp_ptr = 0;
    int printf_ptr = 0;
    int putchar_ptr = 0;
    int resourses[5] = { 0 };
    int flag;
    flag = scanf("%s", user_input);
    while (flag != -1 && flag != 0) {
        if (user_input[0] == '\n' || user_input[0] == '\0')
            break;
        if (if_road(user_input)) {
            resourses[0]++;
            resourses[1]++;
        }
        if (if_settlement(user_input)) {
            resourses[0]++;
            resourses[1]++;
            resourses[2]++;
            resourses[3]++;
        }
        if (if_city(user_input)) {
            resourses[3] += 2;
            resourses[4] += 3;
        }
        if (if_development(user_input)) {
            resourses[2]++;
            resourses[3]++;
            resourses[4]++;
        }
        flag = scanf("%s", user_input);
    }
    for (int i = 0; i < 5; i++) 
        printf("%02d ", resourses[i]);
    printf("\n");

    return 0;
}