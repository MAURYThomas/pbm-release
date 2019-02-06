#include <iostream>

using namespace std;

int main()
{
    int nbre1(0);
    int nbre2(0);

    cout << "Choississez un premier nombre :" << endl;
    cin >> nbre1;

    cout << "Choississez-en un second :" << endl;
    cin >> nbre2;

    int resultat = nbre1 * nbre2;

    cout << "La multiplication donne : " << resultat;

    return 0;
}
