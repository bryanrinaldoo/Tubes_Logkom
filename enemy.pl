/* Ketika bertemu musuh maka predicate ini akan dipanggil */
:- dynamic(creategoblin/1).
creategoblin(X) :-
    asserta(class(X,monster)),
    asserta(health(X,15)),
    asserta(attack(X,7)),
    asserta(defense(X,1)),
    asserta(speed(X,1)),
    asserta(specialattack(X,stealbiatch,8)),
    asserta(level(X,1)),
    asserta(killExp(X,10)),
    asserta(killGold(X,50)),
    asserta(turn(0)).

:- dynamic(createslime/1).
createslime(X) :-
    asserta(class(X,monster)),
    asserta(health(X,10)),
    asserta(attack(X,5)),
    asserta(defense(X,1)),
    asserta(speed(X,1)),
    asserta(specialattack(X,boink,5)),
    asserta(level(X,1)),
    asserta(killExp(X,7)),
    asserta(killGold(X,45)),
    asserta(turn(0)).

:- dynamic(createogre/1).
createogre(X) :-
    asserta(class(X,monster)),
    asserta(health(X,100)),
    asserta(attack(X,20)),
    asserta(defense(X,20)),
    asserta(speed(X,9)),
    asserta(specialattack(X,minibash,45)),
    asserta(level(X,5)),
    asserta(killExp(X,20)),
    asserta(killGold(X,150)),
    asserta(turn(0)).

:- dynamic(createwolf/1).
createwolf(X) :-
    asserta(class(X,monster)),
    asserta(health(X,350)),
    asserta(attack(X,45)),
    asserta(defense(X,25)),
    asserta(speed(X,14)),
    asserta(specialattack(X,sharpbite,85)),
    asserta(level(X,10)),
    asserta(killExp(X,50)),
    asserta(killGold(X,250)),
    asserta(turn(0)).

:- dynamic(creategolem/1).
creategolem(X) :-
    asserta(class(X,monster)),
    asserta(health(X,700)),
    asserta(attack(X,90)),
    asserta(defense(X,45)),
    asserta(speed(X,19)),
    asserta(specialattack(X,avalanche,135)),
    asserta(level(X,10)),
    asserta(killExp(X,150)),
    asserta(killGold(X,500)),
    asserta(turn(0)).

:- dynamic(createviper/1).
createviper(X) :-
    asserta(class(X,monster)),
    asserta(health(X,1050)),
    asserta(attack(X,105)),
    asserta(defense(X,70)),
    asserta(speed(X,24)),
    asserta(specialattack(X,poisonbreak,195)),
    asserta(level(X,15)),
    asserta(killExp(X,450)),
    asserta(killGold(X,750)),
    asserta(turn(0)).

:- dynamic(createsorrowling/1).
createsorrowling(X) :-
    asserta(class(X,miniboss)),
    asserta(health(X,1650)),
    asserta(attack(X,200)),
    asserta(defense(X,125)),
    asserta(speed(X,34)),
    asserta(specialattack(X,phantomslash,300)),
    asserta(level(X,20)),
    asserta(killExp(X,750)),
    asserta(killGold(X,1000)),
    asserta(turn(0)).

:- dynamic(createaghanim/1).
createaghanim(X) :-
    asserta(class(X,boss)),
    asserta(health(X,3000)),
    asserta(attack(X,400)),
    asserta(defense(X,250)),
    asserta(speed(X,50)),
    asserta(specialattack(X,prismaticbolt,600)),
    asserta(level(X,25)),
    asserta(killExp(X,1500)),
    asserta(killGold(X,2000)),
    asserta(turn(0)).

deletemonster(X) :-
    retract(class(X,_)),
    retract(health(X,_)),
    retract(attack(X,_)),
    retract(defense(X,_)),
    retract(speed(X,_)),
    retract(specialattack(X,_,_)),
    retract(level(X,_)),
    retract(killExp(X,_)),
    retract(killGold(X,_)),
    retract(turn(_)).

showStat(X) :-
    write('Nama         : '), write(X), nl,
    write('Class        : '), class(X, Class), write(Class), nl,
    write('Level        : '), level(X, Level), write(Level), nl,
    write('Health       : '), health(X, Health), write(Health), nl,
    write('Attack       : '), attack(X, Attack), write(Attack), nl,
    write('Spc. Attack  : '), specialattack(X, NamaSpcAtk, DmgSpcAtk), write(NamaSpcAtk), write(' '), write(DmgSpcAtk), nl,
    write('Defense      : '), defense(X, Defense), write(Defense), nl,
    write('Speed        : '), speed(X, Speed), write(Speed), nl,
    write('Kill EXP     : '), killExp(X, Exp), write(Exp), nl,
    write('Kill Gold    : '), killGold(X, Gold), write(Gold), nl.
