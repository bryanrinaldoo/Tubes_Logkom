/* Map yang ingin dibentuk berukuran 20x20 */

position(pagar,0,Kolom) :-  Kolom >= 0, Kolom < 20.
position(pagar,19,Kolom) :- Kolom >= 0, Kolom < 20. 
position(pagar,Baris,0) :- Baris >= 0, Baris < 20.
position(pagar,Baris,19) :- Baris >= 0, Baris < 20.

/* Posisi Store dan Quest */
position(store,2,3).
position(quest,4,5).

/* Zona Ogre */
position(ogre,1,13).
position(ogre,2,12).
position(ogre,2,13).
position(ogre,2,14).
position(ogre,3,13).

/* Zona Wolf */
position(wolf,6,9).
position(wolf,7,9).
position(wolf,7,10).
position(wolf,7,11).
position(wolf,8,11).

/* Zona Golem */
position(golem,13,4).
position(golem,13,5).
position(golem,14,4).
position(golem,14,5).

/* Zona Viper */
position(viper,11,14).
position(viper,11,15).
position(viper,12,14).
position(viper,12,15).
position(viper,13,14).
position(viper,13,15).

/* Mini-Boss */
position(miniboss,16,9).

/* Boss */
position(boss,18,18).

map :-printLine(0,0).

printLine(19,19) :- map(19,19),nl.

printLine(Baris,19) :- map(Baris,19), nl, NextBaris is Baris+1, NextBaris < 20, printLine(NextBaris,0). /* setelah mentok 19 mengulang */

printLine(Baris,Kolom) :- map(Baris,Kolom), NextKolom is Kolom+1, printLine(Baris,NextKolom).

map(Baris,Kolom) :- position(X,Baris,Kolom),
                    ( X = store -> write('S');
                    X = quest -> write('Q');
                    X = ogre -> write('O');
                    X = wolf -> write('W');
                    X = golem -> write('G');
                    X = viper -> write('V');
                    X = miniboss -> write('M');
                    X = boss -> write('B');
                    X = pagar -> write('#')).

map(Baris,Kolom) :- positionPlayer(_,Baris,Kolom), write('P').

map(Baris,Kolom) :- \+position(_,Baris,Kolom), write('-').

/* TODO Pergerakan Player */
/* test commit */
                    