/* variabel player dan enemy pada fungsi health bisa diganti */
/* Penyesuaian HP,attack,dll */
darah(mob,15).
darah(ghally,20).
attack(ghally,3).
attack(mob,2).
skill(ghally,5).


battle(A,B) :-
	repeat,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,
	write('Silahkan pilih aksi:'),nl,
	read(X),
	tulis(X,A,B),nl,
	diserang(A,B,Z),write('Kamu telah terkena serangan musuh,HP tersisa: '),write(Z),nl.


tulis(X,A,B):-
	X=1,diserang(B,A,Z),write('Kamu telah melakukan basic attack kepada musuh, HP musuh berkurang menjadi: '),write(Z);
	X=2,ss(B,A,Z),write('Musuh terkena special attack,HP tersisa: '),write(Z);
	X=3,write('Kamu telah menggunakan potion,HP menjadi: '),potion(A,C),write(C);
	X=4,write('Kamu memilih untuk lari dari pertarungan').

diserang(B,A,Z):-
	darah(B,C),
	attack(A,M),
	Z is C-M.
	
ss(B,A,Z):-
	darah(B,C),
	skill(A,M),
	Z is C-M.
	
potion(A,C):-
	darah(A,M),
	C is M+3.
	