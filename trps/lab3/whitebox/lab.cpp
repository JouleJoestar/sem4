#include <iostream>

using namespace std;

int main() {
    int a, b, Q, S;
    cin >> a >> b >> Q;

    if (a > Q * Q) {
        if (abs(Q) > 0) {
            S = a / Q;
        } else {
            cout << "S не присвоено значение!" << endl;
        }
    } else {
        if (a > b && Q > 0) {
            if (b == 0 && Q < 9) {
                cout << "S не присвоено значение!" << endl;
            } else {
                S = 25;
            }
        } else {
            S = a * Q;
        }
    }
    cout << "a = " << a << " b = "<< b<<" Q = "<<Q<<endl;
    cout << "S = " << S << endl;

    return 0;
}
