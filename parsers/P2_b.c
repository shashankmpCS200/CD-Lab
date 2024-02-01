#include <stdio.h>
#include <string.h>

int S();
char input[100];
int currentIndex = 0;

int match(char symbol) {
    if (input[currentIndex] == symbol) {
        currentIndex++;
        return 1;
    } else {
        return 0;
    }
}

int S() {
    int tempIndex = currentIndex;

    if (match('a') && match('a')) {
        if (S() && match('a') && match('a')) {
            return 1;
        }
    }

    currentIndex = tempIndex;
    if (match('a') && match('a')) {
        return 1;
    }
    return 0;
}

int main() {
    printf("Enter the input string: ");
    scanf("%s", input);

    currentIndex = 0;

    if (S() && currentIndex == strlen(input)) {
        printf("Parsing successful! Input belongs to the given grammar.\n");
    } else {
        printf("Parsing failed! Input does not belong to the given grammar.\n");
    }

    return 0;
}
