ALTER VIEW BIM_360_SC_PBM AS (
SELECT A.N_AFFAIRE as PBM_NAffaire,
AR.ID_Affaire as PBM_NLigneCommande,
LignePropal as PBM_NLignepropal,
AR.Repere as PBM_Repere,
P.Produit as PBM_LibelleEscalier,
P.Usine as PBM_ID_Usine,
C.Nom as PBM_NomClient,
CH.Nom as PBM_NomChantier,
A.Revision as PBM_Indice,
P.PoidsTotal as Poids,
CASE /* Traduction de intérieur en True et Exterieur en FALSE */
  WHEN
	P.Localisation = 'Intérieur'
  THEN
	'True'
  WHEN
    P.Localisation = 'Extérieur'
  THEN
    'False'
  ELSE
	NULL
END as Localisation,
(P.HtMarche*(P.NbMarche-1)+P.MarcheDebut) as HAM, /* hauteur à monter */
P.NbMarche,P.HtMarche,
P.LargeurMax as LargeurPassage,
P.CageJoint as Larg_joint_pos,
P.Giron, P.Fruit,
P.Levage as TypeLevage,
P.Nez as DebordNez,
CASE /* Accessibilité Handicap */
	WHEN
	  Cast(P.Giron as FLOAT) < 24 /* P.Giron est de type nvarchar, conversion necessaire */ /******* Certaines valeurs de 'Giron' ne sont pas convertibles en FLOAT puisqu'elles ont été renseignés sur CAP3D avec des virgules et non des points [23.5] [23,5] *******/
	THEN
	  'False'
	ELSE
	  'True'
END as AccHandicap

FROM dbo.AFF_REL AR 
INNER JOIN dbo.PRODUIT P ON P.IDU_Prod = AR.ID_Produit
INNER JOIN dbo.AFFAIRE A ON A.ID_AFFAIRE = AR.ID_Affaire 
INNER JOIN dbo.CLIENT C ON C.ID_Client = A.ID_CLIENT 
INNER JOIN dbo.CHANTIER CH ON CH.ID_Chantier = A.ID_CHANTIER

WHERE AR.Obsolete = 'False' AND P.LastRev = 'True')