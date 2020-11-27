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

/* Print Map */

/* Jika game belum dimulai map tidak ditampilkan */
map :- \+alreadystart(_),
        write('You have not started the game fighter!'),nl,!.

/* Game sudah dimulai maka map bisa ditampilkan */
map :-  alreadystart(_), 
        write(' _ __ ___   __ _ _ __  '),nl,
        write('|  _   _ \\ / _  |  _ \\ '),nl,
        write('| | | | | | (_| | |_) |'),nl,
        write('|_| |_| |_|\\__,_| .__/ '),nl,
        write('                | |    '),nl,
        write('                |_|    '),nl,nl,
        printLine(0,0),!.

/* Basis dalam menampilkan map */
printLine(19,19) :- map(19,19),nl.

/* Rekurens dalam menampilkan map */
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

map(Baris,Kolom) :- \+position(_,Baris,Kolom), \+positionPlayer(_,Baris,Kolom), write('-').

/* Pertarungan */

/* TODO sesuain battle(X) dengan bagian Battle Mech */
/* TODO sesuain showStats(X) dengan bagian Enemy  */

/* Kondisi posisi player berada di zona monster */
condition :- positionPlayer(_,BarisPlayer,KolomPlayer), position(Monster,BarisPlayer,KolomPlayer), 
                (Monster = ogre -> createogre(ogre), showStat(ogre), battle(ogre),!;
                Monster = wolf -> createwolf(wolf), showStat(wolf), battle(wolf),!;
                Monster = viper -> createviper(viper), showStat(viper), battle(viper),!;
                Monster = golem -> creategolem(golem), showStat(golem), battle(golem),!;
                Monster = miniboss -> createsorrowling(sorrowling), showStat(sorrowling), battle(sorrowling),!;
                Monster = boss -> createaghanim(aghanim), showStat(aghanim), battle(aghanim),!).

/* Kondisi posisi player memasuki Quest atau Store */
/* TODO Akses Quest */
condition :- positionPlayer(_,BarisPlayer,KolomPlayer), position(Tempat, BarisPlayer, KolomPlayer),
        (Tempat = store -> write('Fiuhh, you are inside the store. Monster will not chase you.');
        Tempat = quest -> write('Fiuhh, you are inside the quest. Monster will not chase you.')).

/* Kondisi posisi player tidak berada di zona monster */
condition :- ketemuMusuh(Value),  
        (Value = 0 -> NewValue is Value+1, retract(ketemuMusuh(_)), asserta(ketemuMusuh(NewValue)),!;
        Value = 1 -> write('A Goblin found you!'),nl,nl, creategoblin(goblin), showStat(goblin), nl, nl, battle(goblin), NewValue is Value+1, retract(ketemuMusuh(_)), asserta(ketemuMusuh(NewValue)),!;
        Value = 2 -> NewValue is Value+1, retract(ketemuMusuh(_)), asserta(ketemuMusuh(NewValue)),!;
        Value = 3 -> write('A Slime found you!'),nl,nl, createslime(slime), showStat(slime), nl, nl, battle(slime), NewValue is 0, retract(ketemuMusuh(_)), asserta(ketemuMusuh(NewValue)),!).


/* Jalan-jalan */
w :-    positionPlayer(Nama,Baris,Kolom), NextBaris is Baris-1,
        (NextBaris > 0 -> retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,NextBaris,Kolom)), 
        write('You succeded to move up.'),nl,nl, condition,!;
        write('Ouch!! You hit the wall'),nl,!).

s :-    positionPlayer(Nama,Baris,Kolom), NextBaris is Baris+1,
        (NextBaris < 19 -> retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,NextBaris,Kolom)), 
        write('You succeded to move down.'),nl,nl, condition,!;
        write('Ouch!! You hit the wall'),nl,!).

a :-    positionPlayer(Nama,Baris,Kolom), NextKolom is Kolom-1,
        (NextKolom > 0 -> retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,NextKolom)), 
        write('You succeded to move left.'),nl,nl, condition,!;
        write('Ouch!! You hit the wall'),nl,!).

d :-    positionPlayer(Nama,Baris,Kolom), NextKolom is Kolom+1,
        (NextKolom < 19 -> retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,NextKolom)), 
        write('You succeded to move right.'),nl,nl, condition,!;
        write('Ouch!! You hit the wall'),nl,!).

/* Teleport */
teleport(Lokasi) :- position(Lokasi,_,_),
                    (Lokasi = store -> position(store,Baris,Kolom), TargetBaris is Baris-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,TargetBaris,Kolom)),!;
                    Lokasi = quest -> position(quest,Baris,Kolom), TargetBaris is Baris-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,TargetBaris,Kolom)),!;
                    Lokasi = ogre -> position(ogre,Baris,Kolom), TargetKolom is Kolom-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,TargetKolom)),!;
                    Lokasi = wolf -> position(wolf,Baris,Kolom), TargetKolom is Kolom-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,TargetKolom)),!; 
                    Lokasi = golem -> position(golem,Baris,Kolom), TargetKolom is Kolom-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,TargetKolom)),!;
                    Lokasi = viper -> position(viper,Baris,Kolom), TargetKolom is Kolom-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,TargetKolom)),!;
                    Lokasi = miniboss -> position(miniboss,Baris,Kolom), TargetKolom is Kolom-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,TargetKolom)),!;
                    Lokasi = boss -> position(boss,Baris,Kolom), TargetKolom is Kolom-1, positionPlayer(Nama,_,_), retract(positionPlayer(_,_,_)), asserta(positionPlayer(Nama,Baris,TargetKolom)),!),
                    write(' _       _                       _           _ '),nl,
                    write('| |     | |                     | |         | |'),nl,
                    write('| |_ ___| | ___ _ __   ___  _ __| |_ ___  __| |'),nl,
                    write('| __/ _ \\ |/ _ \\  _ \\ / _ \\|  __| __/ _ \\/ _  |'),nl,
                    write('| ||  __/ |  __/ |_) | (_) | |  | ||  __/ (_| |'),nl,
                    write(' \\__\\___|_|\\___| .__/ \\___/|_|   \\__\\___|\\__,_|'),nl,
                    write('               | |                             '),nl,
                    write('               |_|                             '),nl,nl,
                    write('Yay! you have been teleported!'),nl, 
                    condition.    

teleport(Lokasi) :- \+position(Lokasi,_,_), 
                    write('Oops, There\'s no such place!').

                    