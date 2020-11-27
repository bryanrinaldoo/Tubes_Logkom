/* variabel player dan enemy pada fungsi health bisa diganti */
/* Penyesuaian HP,attack,dll */


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

/* tito */
:- dynamic(run_qmark/0).
battle(NamaMonster) :- NamaMonster \= aghanim, NamaMonster \= sorrowling, 
					   write('Fight? or Run like a baby fighter?'), asserta(run_qmark), !.

battle(aghanim) :- fight.

battle(sorrowling) :- fight.

/* fight lawan monster biasa */
fight :-  class(NamaMonster,monster), positionPlayer(NamaPlayer,_),
	repeat,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,
	write('Silahkan pilih aksi: '),read_integer(X),
	(X==1 -> attack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), newHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,newHealthMnstr)),
			 write('U have done '), write(Dmg), write(' damage to enemy, good job!'),nl,!;
	X==2 -> specialattack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), 
			Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), newHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,newHealthMnstr)),
			 write('U have done '), write(Dmg), write(' damage to enemy, good job!'),nl,!;
	X==3 ->  /* Masukin Use Potion */ ;
	X==4 ->  run_qmark, run,!;
	X==4 -> \+run_qmark, write('U cant run in front boss/miniboss :) gluck!'),nl,!),

	(health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer>0, HealthMnstr =< 0 -> 
					write('Wow, you have killed '), write(NamaMonster),
					write('You got '), killGold(NamaMonster,GValue), write(GValue), write(' gold'),nl,
					write('You got '), killExp(NamaMonster,EValue), write(EValue), write(' exp'),nl,
					gold(NamaPlayer,CurrGold), NewGold is CurrGold + GValue, retract(gold(_,_)), asserta(gold(NamaPlayer,NewGold)), 
					exp(NamaPlayer,CurrExp), NewExp is CurrExp + EValue, retract(exp(_,_)), asserta(exp(NamaPlayer,NewExp)), leveling(NamaPlayer),
					leveling(NamaPlayer),!;
	health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer>0, HealthMnstr > 0 -> 
					fail;
	health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer=<0 ->
					write('Oh no, U got killed by '), write(NamaMonster), write(', U Lost!'), halt,!).

/* fight melawan boss */
fight :-  class(NamaMonster,boss), positionPlayer(NamaPlayer,_),
	repeat,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,
	write('Silahkan pilih aksi: '),read_integer(X),
	(X==1 -> attack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), newHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,newHealthMnstr)),
			 write('U have done '), write(Dmg), write(' damage to enemy, good job!'),nl,!;
	X==2 -> specialattack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), 
			Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), newHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,newHealthMnstr)),
			 write('U have done '), write(Dmg), write(' damage to enemy, good job!'),nl,!;
	X==3 ->  /* Masukin Use Potion */ ;
	X==4 -> write('U cant run in front boss/miniboss :) gluck!'),nl,!),

	(health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer>0, HealthMnstr =< 0 -> 
					write('Wow, you have killed '), write(NamaMonster),
					write('You got '), killGold(NamaMonster,GValue), write(GValue), write(' gold'),nl,
					write('You got '), killExp(NamaMonster,EValue), write(EValue), write(' exp'),nl,
					gold(NamaPlayer,CurrGold), NewGold is CurrGold + GValue, retract(gold(_,_)), asserta(gold(NamaPlayer,NewGold)), 
					exp(NamaPlayer,CurrExp), NewExp is CurrExp + EValue, retract(exp(_,_)), asserta(exp(NamaPlayer,NewExp)), leveling(NamaPlayer),
					leveling(NamaPlayer),!;
	health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer>0, HealthMnstr > 0 -> 
					fail;
	health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer=<0 ->
					write('Oh no, U got killed by '), write(NamaMonster), write(', U Lost!'), halt,!).

/* fight melawan miniboss */

fight :-  class(NamaMonster,miniboss), positionPlayer(NamaPlayer,_),
	repeat,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,
	write('Silahkan pilih aksi: '),read_integer(X),
	(X==1 -> attack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), newHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,newHealthMnstr)),
			 write('U have done '), write(Dmg), write(' damage to enemy, good job!'),nl,!;
	X==2 -> specialattack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), 
			Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), newHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,newHealthMnstr)),
			 write('U have done '), write(Dmg), write(' damage to enemy, good job!'),nl,!;
	X==3 ->  /* Masukin Use Potion */ ;
	X==4 ->  write('U cant run in front boss/miniboss :) gluck!'),nl,!),

	(health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer>0, HealthMnstr =< 0 -> 
					write('Wow, you have killed '), write(NamaMonster),
					write('You got '), killGold(NamaMonster,GValue), write(GValue), write(' gold'),nl,
					write('You got '), killExp(NamaMonster,EValue), write(EValue), write(' exp'),nl,
					gold(NamaPlayer,CurrGold), NewGold is CurrGold + GValue, retract(gold(_,_)), asserta(gold(NamaPlayer,NewGold)), 
					exp(NamaPlayer,CurrExp), NewExp is CurrExp + EValue, retract(exp(_,_)), asserta(exp(NamaPlayer,NewExp)), leveling(NamaPlayer),
					leveling(NamaPlayer),!;
	health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer>0, HealthMnstr > 0 -> 
					fail;
	health(NamaMonster,HealthMnstr), health(NamaPlayer,HealthPlayer,_), HealthPlayer=<0 ->
					write('Oh no, U got killed by '), write(NamaMonster), write(', U Lost!'), halt,!).



	

fight :- \+class(_,monster), \+class(_,miniboss), \+class(_,boss),
		 write('Easy fighter, there is no monster yet'),nl,!.

run :- class(NamaMonster,monster), level(NamaMonster,LVLMonster),
	   positionPlayer(NamaPlayer,_,_), level(NamaPlayer,LVLPlayer),
	   (LVLPlayer=<LVLMonster -> write('Oops, u cant run fighter!'),nl,!;
	   LVLPlayer>LVLMonster -> write('U run safely!'),nl,deletemonster(NamaMonster),!),!.

run :- \+class(_,monster), write('Even u not face monster yet, why so scared?'),nl,!.