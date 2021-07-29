// Fibonacci Series and Prime Check


// Header File(s)
#include <iostream>

using namespace std;

// Function Prototypes
void display_fibonacci_series(int);
void prime_check(int);


// Function definitions

void prime_check(int x) {
    int i, s = 0;
    for (i = 1; i <= x; i++) 
        if(x % i == 0)
            s++;
    if(s < 2)
        cout << "\t\t\tNeither Prime Nor Composite";
    else if(s == 2)
        cout << "\t\t\t\tPrime Number";
    else if (s > 2)
        cout << "\t\t\t\tComposite Number";
    
    cout << endl;
}

void display_fibonacci_series(int n) {
    int i, f = -1, s = 1, t, k;

    for(i = 1; i <= n; i++) {
        t = f + s;
        f = s;
        s = t;
        cout << "\t" << t;
        prime_check(t);
    }
}

int main() {
    int n;
    char ch;

    do{
        cout << "\n\n\t\t\tFIBONACCI SERIES AND PRIME CHECK";
        cout << "\n\t\t\t--------- ------ --- ----- -----\n";

        cout << "\n\n\n\tEnter number of Terms : ";
        cin >> n;  // Accepting number of items

        cout << "\n   Fibonacci Series \t\t\tPrime check";
        cout << "\n   --------- ------ \t\t\t----- -----\n\n";
        
        display_fibonacci_series(n);

        cout << "\n\nWant to continue ? Press (1) then. ";
        cin >> ch;
    } while(ch == '1');

    return 0;
}
