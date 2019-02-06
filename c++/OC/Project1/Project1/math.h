#pragma once
#ifndef MATH_H_INCLUDED
#define MATH_H_INCLUDED
//Ajoute 2 a l'argument
// nombreRecu = nombre a additionné
// Return : nombreRecu + 2
int ajouteDeux(int nombreRecu);

//Convertie les arguments en secondes
// heures minutes et secondes
//return : temps en seconde
int nombreDeSecondes(int heures, int minutes = 0, int secondes = 0); // l'ajout des " = 0 " permet de donner des valeurs par default aux arguments et donc de les rendres facultatifs

#endif // MATH_H_INCLUDED#pragma once
