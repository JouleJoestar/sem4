#include <cstring>

extern "C" void markDuplicates(char* target, const char* source, int len) {
    for (int i = 0; i < len; i++) {
        if (target[i] == source[i] && target[i] != ' ') {
            target[i] = ' ';
            const_cast<char*>(source)[i] = ' ';
        }
    }
}


