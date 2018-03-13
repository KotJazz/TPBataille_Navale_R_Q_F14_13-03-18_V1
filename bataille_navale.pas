program bataille_navale;

uses crt;

//SUJET : BATAILLE NAVALE : Au lieu d'utiliser un tableau à deux dimensions, pour représenter la grille du jeu, on utilisera un TYPE CASE pour décrire les cases occupées par les bâtôs
//un bâteau sera décrit par un ensemble de cases et la flotte à couler sera représentée par un ensemble de bâtôs
//écrire la structure case composée de deux champs : ligne et colonne : entiers
//écrire la structure bâtô composée d'un ensemble de n cases
//écrire la structure flotte composée d'un ensemble de bâtôs
//-
//écrire une fonction de création d'une case. Elle prend en param. la ligne et la colonne associée à la case. done
//écrire une fonction de comparaison de 2 cases. Elle renverra TRUE ou FALSE. tirs, case occupée...<_________________________________
//écrire une fonction de création de bâtôs. Elle renverra une variable bâtô bien remplie avec la peau du ventre bien tendue.		 | done
//écrire une fonction qui vérifie qu'une case appartient à un bâtô : T/F attention : devra utiliser la fonc de comparaison de case __|
//écrire une fonction qui vérifie qu'une case appartient à une flotte : devra utiliser la fonc de comparaison de case aussi._________|
//écrire la bataille navale complète
//à rendre le lundi 12 mars
{
	
}

CONST
	minpos=1;
	maxpos=10;

TYPE
	pos=RECORD
		l,c:minpos..maxpos;
	end;
	bato=RECORD
		tile1,tile2,tile3,tile4,tile5:pos;
	end;
	flotte=RECORD
		ptavion,croiseur,ssmarin1,ssmarin2,torpilleur:bato;
	end;

procedure cases(VAR j:flotte); //création de case
	BEGIN
		writeln('-Porte-avion-');
		writeln('Saisissez les coordonnees de la premiere case de votre porte-avion.'); //à partir de cette saisie, seules les cases situées à 4 cases de distance sur la même ligne ou colonne devraient être sélectionnables (nb positifs uniquement)
		writeln('Coordonnes x (longitude) :');
		readln(j.ptavion.tile1.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.ptavion.tile1.c);
		writeln('Saisissez les coordonnees de la derniere case de votre porte-avion.');
		writeln('Coordonnes x (longitude) :');
		readln(j.ptavion.tile5.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.ptavion.tile5.c);
		//
		writeln('-Croiseur-');
		writeln('Saisissez les coordonnees de la premiere case de votre croiseur.');
		writeln('Coordonnes x (longitude) :');
		readln(j.croiseur.tile1.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.croiseur.tile1.c);
		writeln('Saisissez les coordonnees de la derniere case de votre croiseur.');
		writeln('Coordonnes x (longitude) :');
		readln(j.croiseur.tile4.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.croiseur.tile4.c);
		//
		writeln('-Sous-marin 1-');
		writeln('Saisissez les coordonnees de la premiere case de votre premier sous-marin.');
		writeln('Coordonnes x (longitude) :');
		readln(j.ssmarin1.tile1.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.ssmarin1.tile1.c);
		writeln('Saisissez les coordonnees de la derniere case de votre premier sous-marin.');
		writeln('Coordonnes x (longitude) :');
		readln(j.ssmarin1.tile3.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.ssmarin1.tile3.c);
		//
		writeln('-Sous-marin 2-');
		writeln('Saisissez les coordonnees de la premiere case de votre second sous-marin.');
		writeln('Coordonnes x (longitude) :');
		readln(j.ssmarin2.tile1.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.ssmarin2.tile1.c);
		writeln('Saisissez les coordonnees de la derniere case de votre second sous-marin.');
		writeln('Coordonnes x (longitude) :');
		readln(j.ssmarin2.tile3.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.ssmarin2.tile3.c);
		//
		writeln('-Torpilleur-');
		writeln('Saisissez les coordonnees de la premiere case de votre second torpilleur.');
		writeln('Coordonnes x (longitude) :');
		readln(j.torpilleur.tile1.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.torpilleur.tile1.c);
		writeln('Saisissez les coordonnees de la derniere case de votre second torpilleur.');
		writeln('Coordonnes x (longitude) :');
		readln(j.torpilleur.tile3.l);
		writeln('Coordonnees y (latitude) :');
		readln(j.torpilleur.tile3.c);
	END;
{
procedure comparasion(); //
	VAR
	BEGIN
	END;
}
procedure initbato(VAR j:flotte); //d'abord le ptavion. 5 pos. ensuite le croiseur, 4pos. Les sous marins, 3. Le torpilleur 2.
		BEGIN
		//remplissage du reste des cases
		cases(j);
			if ((j.ptavion.tile1.l)=(j.ptavion.tile5.l)) then //si les deux cases spécifiées sont sur la même ligne, alors
				begin
					(j.ptavion.tile2.l):=(j.ptavion.tile1.l);
					(j.ptavion.tile3.l):=(j.ptavion.tile1.l);
					(j.ptavion.tile4.l):=(j.ptavion.tile1.l);
					if ((j.ptavion.tile1.c)>(j.ptavion.tile5.c)) then //si la colonne de la première case > la colonne de la dernière case
						begin
							(j.ptavion.tile2.c):=(j.ptavion.tile1.c - 1);
							(j.ptavion.tile3.c):=(j.ptavion.tile1.c - 2);
							(j.ptavion.tile4.c):=(j.ptavion.tile1.c - 3);
						end
					else
						begin
							if ((j.ptavion.tile1.c)<(j.ptavion.tile5.c)) then
								begin
									(j.ptavion.tile2.c):=(j.ptavion.tile1.c + 1);
									(j.ptavion.tile3.c):=(j.ptavion.tile1.c + 2);
									(j.ptavion.tile4.c):=(j.ptavion.tile1.c + 3);
								end;
						end;

				end;

			if ((j.ptavion.tile1.c)=(j.ptavion.tile5.c)) then //Si les deux cases spécifiées sont dans la même colonne, alors
				begin
					(j.ptavion.tile2.c):=(j.ptavion.tile1.c);
					(j.ptavion.tile3.c):=(j.ptavion.tile1.c);
					(j.ptavion.tile4.c):=(j.ptavion.tile1.c);
					if ((j.ptavion.tile1.l)>(j.ptavion.tile5.l)) then //si la colonne de la première case > la colonne de la dernière case
						begin
							(j.ptavion.tile2.l):=(j.ptavion.tile1.l - 1);
							(j.ptavion.tile3.l):=(j.ptavion.tile1.l - 2);
							(j.ptavion.tile4.l):=(j.ptavion.tile1.l - 3);
						end
					else
						begin
							if ((j.ptavion.tile1.l)<(j.ptavion.tile5.l)) then
								begin
									(j.ptavion.tile2.l):=(j.ptavion.tile1.l + 1);
									(j.ptavion.tile3.l):=(j.ptavion.tile1.l + 2);
									(j.ptavion.tile4.l):=(j.ptavion.tile1.l + 3);
								end;
						end;

				end;
					{writeln(j.ptavion.tile2.l,',',j.ptavion.tile2.c); //TEST
					writeln(j.ptavion.tile3.l,',',j.ptavion.tile3.c);
					writeln(j.ptavion.tile4.l,',',j.ptavion.tile4.c);}
		//
		//remplissage du reste des cases
			if ((j.croiseur.tile1.l)=(j.croiseur.tile4.l)) then
				begin
					(j.croiseur.tile2.l):=(j.croiseur.tile1.l);
					(j.croiseur.tile3.l):=(j.croiseur.tile1.l);
					if ((j.croiseur.tile1.c)>(j.croiseur.tile4.c)) then
						begin
							(j.croiseur.tile2.c):=(j.croiseur.tile1.c - 1);
							(j.croiseur.tile3.c):=(j.croiseur.tile1.c - 2);
						end
					else
						begin
							if ((j.croiseur.tile1.c)<(j.croiseur.tile4.c)) then
								begin
									(j.croiseur.tile2.c):=(j.croiseur.tile1.c + 1);
									(j.croiseur.tile3.c):=(j.croiseur.tile1.c + 2);
								end;
						end;

				end;

			if ((j.croiseur.tile1.c)=(j.croiseur.tile4.c)) then
				begin
					(j.croiseur.tile2.c):=(j.croiseur.tile1.c);
					(j.croiseur.tile3.c):=(j.croiseur.tile1.c);
					if ((j.croiseur.tile1.l)>(j.croiseur.tile4.l)) then
						begin
							(j.croiseur.tile2.l):=(j.croiseur.tile1.l - 1);
							(j.croiseur.tile3.l):=(j.croiseur.tile1.l - 2);
						end
					else
						begin
							if ((j.croiseur.tile1.l)<(j.croiseur.tile4.l)) then
								begin
									(j.croiseur.tile2.l):=(j.croiseur.tile1.l + 1);
									(j.croiseur.tile3.l):=(j.croiseur.tile1.l + 2);
								end;
						end;

				end;
		//
		//remplissage du reste des cases
			if ((j.ssmarin1.tile1.l)=(j.ssmarin1.tile3.l)) then
				begin
					(j.ssmarin1.tile2.l):=(j.ssmarin1.tile1.l);
					if ((j.ssmarin1.tile1.c)>(j.ssmarin1.tile3.c)) then
						begin
							(j.ssmarin1.tile2.c):=(j.ssmarin1.tile1.c - 1);
						end
					else
						begin
							if ((j.ssmarin1.tile1.c)<(j.ssmarin1.tile3.c)) then
								begin
									(j.ssmarin1.tile2.c):=(j.ssmarin1.tile1.c + 1);
								end;
						end;

				end;

			if ((j.ssmarin1.tile1.c)=(j.ssmarin1.tile3.c)) then
				begin
					(j.ssmarin1.tile2.c):=(j.ssmarin1.tile1.c);
					if ((j.ssmarin1.tile1.l)>(j.ssmarin1.tile3.l)) then
						begin
							(j.ssmarin1.tile2.l):=(j.ssmarin1.tile1.l - 1);
						end
					else
						begin
							if ((j.ssmarin1.tile1.l)<(j.ssmarin1.tile3.l)) then
								begin
									(j.ssmarin1.tile2.l):=(j.ssmarin1.tile1.l + 1);
								end;
						end;

				end;
		//
		//remplissage du reste des cases
			if ((j.ssmarin2.tile1.l)=(j.ssmarin2.tile3.l)) then
				begin
					(j.ssmarin2.tile2.l):=(j.ssmarin2.tile1.l);
					if ((j.ssmarin2.tile1.c)>(j.ssmarin2.tile3.c)) then
						begin
							(j.ssmarin2.tile2.c):=(j.ssmarin2.tile1.c - 1);
						end
					else
						begin
							if ((j.ssmarin2.tile1.c)<(j.ssmarin2.tile3.c)) then
								begin
									(j.ssmarin2.tile2.c):=(j.ssmarin2.tile1.c + 1);
								end;
						end;

				end;

			if ((j.ssmarin2.tile1.c)=(j.ssmarin2.tile3.c)) then
				begin
					(j.ssmarin2.tile2.c):=(j.ssmarin2.tile1.c);
					if ((j.ssmarin2.tile1.l)>(j.ssmarin2.tile3.l)) then
						begin
							(j.ssmarin2.tile2.l):=(j.ssmarin2.tile1.l - 1);
						end
					else
						begin
							if ((j.ssmarin2.tile1.l)<(j.ssmarin2.tile3.l)) then
								begin
									(j.ssmarin2.tile2.l):=(j.ssmarin2.tile1.l + 1);
								end;
						end;

				end;
		//Le torpilleur n'a pas besoin d'être initialisé puisque la totalité des cases qui le composent ont déjà été saisies.
		//
		END;
{
j.ptavion.tile1.l-1,j.ptavion.tile1.c-1
j.ptavion.tile1.l-1,j.ptavion.tile1.c
j.ptavion.tile1.l-1,j.ptavion.tile1.c+1
j.ptavion.tile1.l,j.ptavion.tile1.c-1
j.ptavion.tile1.l,j.ptavion.tile1.c
j.ptavion.tile1.l,j.ptavion.tile1.c+1
j.ptavion.tile1.l+1,j.ptavion.tile1.c-1
j.ptavion.tile1.l+1,j.ptavion.tile1.c
j.ptavion.tile1.l+1,j.ptavion.tile1.c+1

function verifbato(); //vérif que la case est occupée par un bateau, qu'un bateau n'est pas placé trop près d'un autre. Si placé à côté ou en diagonale, rediriger vers une procédure qui fait resaisir les coord.
	VAR

	BEGIN
	END;

function veriflotte(); //
	VAR
	BEGIN
	END;
}
//MAIN
VAR
	j1,j2:flotte;

BEGIN
	writeln('Au tour du joueur 1 de placer ses bateaux.');
	initbato(j1);
	clrscr;
	writeln('Au tour du joueur 2 de placer ses bateaux.');
	initbato(j2);
	clrscr;
	readkey;
END.

{
	Les problèmes posés par la contrainte de ne pas utiliser de tableau :
	Les énumérations sont trop nombreuses. Pour vérifier qu'un bateau n'est pas trop près d'un autre par exemple.
	L'intérêt d'un tableau aurait été que l'on puisse créer des boucles avec des compteurs pour vérifier les cases une par une sans devoir écrire chaque cas. (Un compteur ligne, un compteur colonne)
	En bref : Ne pas utiliser de tableau empêche d'utiliser des boucles.
}