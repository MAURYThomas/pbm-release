#include "math.h"

int ajouteDeux(int nombreRecu)
{
	int valeur(nombreRecu + 2);

	return valeur;
}

int nombreDeSecondes(int heures, int minutes, int secondes) {

	int total = 0;

	total = heures * 60 * 60;
	total += minutes * 60;
	total += secondes;

	return total;
}