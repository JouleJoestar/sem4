#include <iostream>
int main() {
    int a, b;
    std::cout << "enter (a): ";
    std::cin >> a;
    std::cout << "enter (b): ";
    std::cin >> b;
    if (b < 0) {
        std::cout << "b must be >= 0" << std::endl;
        return 1;
    }
    int result;
    unsigned char carryFlag = 0; 
    __asm {
        mov eax, a
        mov ecx, b

        shr eax, cl
        setc cl
        mov carryFlag, cl
        mov result, eax
    }
    std::cout << "res: " << result << std::endl;
    std::cout << "CF: " << (carryFlag ? "1" : "0") << std::endl;
    return 0;
}
