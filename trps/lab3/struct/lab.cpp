#include <iostream>

using namespace std;

struct el {
    int value;
    el* next;
};

int main() {
    el *First, *pass, *q;
    int pov, k, g, i, n;
    int mas[100];

    First = nullptr;
    cout << "Enter numbers (1000 to end): " << endl;
    cin >> i; 
    First = new el; 
    First->value = i; 
    First->next = nullptr;
    pass = first;
    k = 1; 
    cin >> i;

    do {
        q = new el;
        q->value = i; 
        q->next = nullptr; 
        pass->next = q; 
        pass = q; 
        k++;
        cin >> i;
    } while (i == 1000);

    q = first;
    while (q != nullptr) { 
        cout << q->value << " "; 
        q = q->next; 
    }
    cout << endl;

    g = k; 
    k = k / 2;

    q = first;
    for (i = 0; i < k; i++) { 
        q = q->next; 
        pass = q; 
    }

    for (i = 0; i < k; i++) {
        pov = 0;
        if (q->value == pass->value) {
            pov++;
            q = q->next; 
            pass = pass->next; 
        } else {
            q = q->next; 
            pass = pass->next; 
        }
    }

    if (pov == i) 
        cout << "Matches" << endl;
    else 
        cout << "Not matches" << endl;

    return 0;
}
