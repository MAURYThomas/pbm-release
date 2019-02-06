#include "array.h"
#include <iostream>

using namespace std;

/*
 *  Fonction qui calcule la moyenne des éléments d'un tableau
 *  - tableau : Le tableau dont on veut la moyenne
 *  - tailleTableau : La taille du tableau
 */
double moyenne(double tableau[], int tailleTableau)
{
	double moyenne(0);
	for (int i(0); i < tailleTableau; ++i)
	{
		moyenne += tableau[i];   //On additionne toutes les valeurs
	}
	moyenne /= tailleTableau;

	return moyenne;
}