/* variabel player dan enemy pada fungsi health bisa diganti */
/* Penyesuaian HP,attack,dll */


battle(A,B) :-
	repeat,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,
	write('Choose what you want to do:'),nl,
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

counterattack(NamaMonster) :- positionPlayer(NamaPlayer,_,_),
							  turn(X), attack(NamaMonster, AtkMonster), specialattack(NamaMonster,_,SpcAtkMonster),
							  health(NamaPlayer,CurrHealthPlayer,MaxHealthPlayer), defense(NamaPlayer,DefPlayer),
		(X = 0 -> Dmg is AtkMonster-DefPlayer, NewX is X+1, retract(turn(_)), asserta(turn(NewX)),!;
		X = 1 -> Dmg is AtkMonster-DefPlayer, NewX is X+1, retract(turn(_)), asserta(turn(NewX)),!;
		X = 2 -> Dmg is AtkMonster-DefPlayer, NewX is X+1, retract(turn(_)), asserta(turn(NewX)),!;
		X = 3 -> Dmg is SpcAtkMonster-DefPlayer, NewX is 0, retract(turn(_)), asserta(turn(NewX)),!),

		(Dmg < 0 -> NewHealth is CurrHealthPlayer, NewDmg is 0,!; NewHealth is CurrHealthPlayer-Dmg, NewDmg is Dmg,!),
							  retract(health(NamaPlayer,_,_)), asserta(health(NamaPlayer,NewHealth,MaxHealthPlayer)),
							  write('Ouch! You got '), write(NewDmg), write(' damage from '), write(NamaMonster),nl,
							  write('Your health now is '), write(NewHealth),nl,nl.

/* fight lawan monster biasa */
fight :-  class(NamaMonster,monster), positionPlayer(NamaPlayer,_,_),
	nl,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,nl,
	write('Choose ur action: '),read_integer(X), nl,
	(X=1 ->  attack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), NewHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,NewHealthMnstr)),
			 write('U have dealt '), write(Dmg), write(' damage to enemy, good job!'),nl,
			 write('The enemy health now is '), write(NewHealthMnstr),nl,nl,!;
	X=2 -> specialattack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), 
			Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), NewHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,NewHealthMnstr)),
			 write('U have dealt '), write(Dmg), write(' damage to enemy, good job!'),nl,
			 write('The enemy health now is '), write(NewHealthMnstr),nl,nl,!;
	X=3 ->  usePotion(health_potion),!;
	X=4 ->  run_qmark, run,!),

	counterattack(NamaMonster), health(NamaPlayer,HealthPlayer,_),
	(HealthPlayer > 0, NewHealthMnstr =< 0 -> 
					write('Wow, you have killed '), write(NamaMonster),nl,
					write('You got '), killGold(NamaMonster,GValue), write(GValue), write(' gold'),nl,
					write('You got '), killExp(NamaMonster,EValue), write(EValue), write(' exp'),nl,
					gold(NamaPlayer,CurrGold), NewGold is CurrGold + GValue, retract(gold(_,_)), asserta(gold(NamaPlayer,NewGold)), 
					exp(NamaPlayer,CurrExp), NewExp is CurrExp + EValue, retract(exp(_,_)), asserta(exp(NamaPlayer,NewExp)), deletemonster(NamaMonster), 
					leveling(NamaPlayer),!;
	HealthPlayer > 0, NewHealthMnstr > 0 -> fight,!;
	HealthPlayer =< 0 ->
					write('Oh no, U got killed by '), write(NamaMonster), write(', U Lost!'), halt,!).

/* fight lawan boss */
fight :-  class(NamaMonster,boss), positionPlayer(NamaPlayer,_,_),
	nl,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,nl,
	write('Choose ur action: '),read_integer(X), nl,
	(X=1 ->  attack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), NewHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,NewHealthMnstr)),
			 write('U have dealt '), write(Dmg), write(' damage to enemy, good job!'),nl,
			 write('The enemy health now is '), write(NewHealthMnstr),nl,nl,!;
	X=2 -> specialattack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), 
			Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), NewHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,NewHealthMnstr)),
			 write('U have dealt '), write(Dmg), write(' damage to enemy, good job!'),nl,
			 write('The enemy health now is '), write(NewHealthMnstr),nl,nl,!;
	X=3 ->  usePotion(health_potion),!;
	X==4 ->  write('U cant run in front of boss/miniboss :) gluck!'),nl,!),

	counterattack(NamaMonster), health(NamaPlayer,HealthPlayer,_),
	(HealthPlayer > 0, NewHealthMnstr =< 0 -> 
					write('Wow, you have killed '), write(NamaMonster),nl,
					write('You got '), killGold(NamaMonster,GValue), write(GValue), write(' gold'),nl,
					write('You got '), killExp(NamaMonster,EValue), write(EValue), write(' exp'),nl,
					gold(NamaPlayer,CurrGold), NewGold is CurrGold + GValue, retract(gold(_,_)), asserta(gold(NamaPlayer,NewGold)), 
					exp(NamaPlayer,CurrExp), NewExp is CurrExp + EValue, retract(exp(_,_)), asserta(exp(NamaPlayer,NewExp)), deletemonster(NamaMonster), 
					leveling(NamaPlayer),
					write('======================================================================='),nl,nl,
    write('    __     ______  _    _   __          _______ __  __                    '),nl,
    write('    \\ \\   / / __ \\| |  | |  \\ \\        / /_   _| \\ | |                    '),nl,
    write('     \\ \\_/ / |  | | |  | |   \\ \\  /\\  / /  | | |  \\| |                   '),nl,                   
    write('      \\   /| |  | | |  | |    \\ \\/  \\/ /   | | | .   |                    '),nl,
    write('       | | | |__| | |__| |     \\  /\\  /   _| |_| |\\  |                    '),nl,
    write('       |_|  \\____/ \\____/       \\/  \\/   |_____|_| \\_|                    '),nl,                
    write('               // ! C O N G R A T U L A T I O N S ! \\\\                    '),nl,nl,
    write('======================================================================'),nl,!;
	HealthPlayer > 0, NewHealthMnstr > 0 -> fight,!;
	HealthPlayer =< 0 ->
					write('Oh no, U got killed by '), write(NamaMonster), write(', U Lost!'), halt,!).

/* fight melawan miniboss */

fight :-  class(NamaMonster,miniboss), positionPlayer(NamaPlayer,_,_),
	nl,
	write('1. Basic Attack'),nl,
	write('2. Special Attack'),nl,
	write('3. Use Potion'),nl,
	write('4. Run'),nl,nl,
	write('Choose ur action: '),read_integer(X), nl,
	(X=1 ->  attack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), NewHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,NewHealthMnstr)),
			 write('U have dealt '), write(Dmg), write(' damage to enemy, good job!'),nl,
			 write('The enemy health now is '), write(NewHealthMnstr),nl,nl,!;
	X=2 -> specialattack(NamaPlayer,AtkPlayer), defense(NamaMonster, DefMonster), 
			Dmg is AtkPlayer-DefMonster,
			 health(NamaMonster,HealthMnstr), NewHealthMnstr is HealthMnstr-Dmg, 
			 retract(health(NamaMonster,_)), asserta(health(NamaMonster,NewHealthMnstr)),
			 write('U have dealt '), write(Dmg), write(' damage to enemy, good job!'),nl,
			 write('The enemy health now is '), write(NewHealthMnstr),nl,nl,!;
	X=3 ->  usePotion(health_potion),!;
	X==4 ->  write('U cant run in front of boss/miniboss :) gluck!'),nl,!),

	counterattack(NamaMonster), health(NamaPlayer,HealthPlayer,_),
	(HealthPlayer > 0, NewHealthMnstr =< 0 -> 
					write('Wow, you have killed '), write(NamaMonster),nl,
					write('You got '), killGold(NamaMonster,GValue), write(GValue), write(' gold'),nl,
					write('You got '), killExp(NamaMonster,EValue), write(EValue), write(' exp'),nl,
					gold(NamaPlayer,CurrGold), NewGold is CurrGold + GValue, retract(gold(_,_)), asserta(gold(NamaPlayer,NewGold)), 
					exp(NamaPlayer,CurrExp), NewExp is CurrExp + EValue, retract(exp(_,_)), asserta(exp(NamaPlayer,NewExp)), deletemonster(NamaMonster), 
					leveling(NamaPlayer),!;
	HealthPlayer > 0, NewHealthMnstr > 0 -> fight,!;
	HealthPlayer =< 0 ->
					write('Oh no, U got killed by '), write(NamaMonster), write(', U Lost!'), halt,!).



	

fight :- \+class(_,monster), \+class(_,miniboss), \+class(_,boss),
		 write('Easy fighter, there is no monster yet'),nl,!.

run :- class(NamaMonster,monster), level(NamaMonster,LVLMonster),
	   positionPlayer(NamaPlayer,_,_), level(NamaPlayer,LVLPlayer),
	   (LVLPlayer=<LVLMonster -> write('Oops, u cant run fighter!'),nl,!;
	   LVLPlayer>LVLMonster -> write('U run safely!'),nl,deletemonster(NamaMonster),!),!.

run :- \+class(_,monster), write('Even u not face monster yet, why so scared?'),nl,!.