#include <iostream>
#include <string>
#include "math.h"
#include "array.h"

using namespace std;


class Personnage
{
	//Attributs
	int m_vie;
	int m_mana;
	string m_monArme;
	int m_degatsArme;

	void recevoirDegats(int nbDegats)
	{

	}

	void attaquer(Personnage &cible)
	{

	}

	void boirePotionDeVie(int quantitePotion)
	{

	}

	void changerArme(string nouvelleArme, int degatsNouvellearme)
	{

	}

	bool estVivant()
	{

	}

};


// Main
int main()
{
	Personnage David, Goliath;	
	system("PAUSE");
	return 0;
}






/*string reponseA, reponseB, reponseC;
	reponseA = "La peur des jeux de loterie";
	reponseB = "La peur du noir";
	reponseC = "La peur des vendredis treize";

	cout << "Qu'est-ce que la 'kenophobie' ? " << endl; //On pose la question
	cout << "A) " << reponseA << endl; //Et on affiche les trois propositions
	cout << "B) " << reponseB << endl;
	cout << "C) " << reponseC << endl;

	char reponse;
	cout << "Votre reponse (A,B ou C) : ";
	cin >> reponse; //On récupère la réponse de l'utilisateur

	string *reponseUtilisateur(0); //Un pointeur qui pointera sur la réponse choisie
	switch (reponse)
	{
	case 'A':
		reponseUtilisateur = &reponseA; //On déplace le pointeur sur la réponse choisie
		break;
	case 'B':
		reponseUtilisateur = &reponseB;
		break;
	case 'C':
		reponseUtilisateur = &reponseC;
		break;
	}
	//On peut alors utiliser le pointeur pour afficher la réponse choisie
	cout << "Vous avez choisi la reponse : " << *reponseUtilisateur << endl;*/


// Un pointeur est une variable qui contient l'adresse d'une autre variable




	/*// int const tailleTableau(5);
	vector <int> notes;
	notes.push_back(11.5);
	notes.push_back(12);
	notes.push_back(18);
	notes.push_back(16.5);
	notes.push_back(13);
	notes.push_back(12);
	
	double moyenne(0);
	for (size_t i = 0; i < notes.size(); i++)
	{
		cout << notes[i] << endl;
		moyenne += notes[i];
	}

	moyenne /= notes.size();

	cout << "votre moyenne est de " << moyenne << endl;

	###########

	int const dixMeilleursScores(9);
	int tabDixMeilleursScores[dixMeilleursScores];

	tabDixMeilleursScores[0] = 48224;
	tabDixMeilleursScores[1] = 45621;
	tabDixMeilleursScores[2] = 32448;
	tabDixMeilleursScores[3] = 31479;
	tabDixMeilleursScores[4] = 29211;
	tabDixMeilleursScores[5] = 28945;
	tabDixMeilleursScores[6] = 28865;
	tabDixMeilleursScores[7] = 26854;
	tabDixMeilleursScores[8] = 24975;
	tabDixMeilleursScores[9] = 23452;

	for (size_t i = 0; i < sizeof(tabDixMeilleursScores) / sizeof(tabDixMeilleursScores[0]); i++)
	{
		cout << tabDixMeilleursScores[i] << endl;
		//sleep_for(1s);
	}
	*/