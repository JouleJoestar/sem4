#include <iostream>
#include <cstring>

extern "C" void processStrings(char* str1, char* str2, int len);

int main() {
    const int MAX_LEN = 125;
    char str1[MAX_LEN + 1];
    char str2[MAX_LEN + 1];

    std::cout << "enter string1: ";
    std::cin.getline(str1, MAX_LEN);

    std::cout << "enter string2: ";
    std::cin.getline(str2, MAX_LEN);

    if (strlen(str1) != strlen(str2)) {
        std::cout << "Error: string1 must equal string2" << std::endl;
        return 1;
    }

    int len = strlen(str1);
    processStrings(str1, str2, len);

    std::cout << "new str1: " << str1 << std::endl;
    std::cout << "new str2: " << str2 << std::endl;

    return 0;
}
