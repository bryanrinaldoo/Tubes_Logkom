isClass(swordsman).
isClass(archer).
isClass(sorcerer).

:- dynamic(class/2).
:- dynamic(health/2).
:- dynamic(attack/2).
:- dynamic(defense/2).
:- dynamic(speed/2).
:- dynamic(specialattack/2).
:- dynamic(exp/2).
:- dynamic(level/2).
:- dynamic(positionPlayer/2).
:- dynamic(gold/2).

createswordsman(X) :-   asserta(class(X,swordsman)),
                        asserta(health(X,10)),
                        asserta(attack(X,5)),
                        asserta(defense(X,7)),
                        asserta(speed(X,4)),
                        asserta(specialattack(X,7)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)),
                        asserta(positionPlayer(X,1,1)),    /* inisiasi posisi awal di map */
                        asserta(gold(X,100)),
                        inventorysword.
                    
createarcher(X) :-      asserta(class(X,archer)),
                        asserta(health(X,10)),
                        asserta(attack(X,5)),
                        asserta(defense(X,6)),
                        asserta(speed(X,5)),
                        asserta(specialattack(X,8)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)),
                        asserta(positionPlayer(X,1,1)),    /* inisiasi posisi awal di map */
                        asserta(gold(X,100)),
                        inventoryarcher.
                    
createsorcerer(X) :-    asserta(class(X,sorcerer)),
                        asserta(health(X,9)),
                        asserta(attack(X,5)),
                        asserta(defense(X,5)),
                        asserta(speed(X,4)),
                        asserta(specialattack(X,9)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)),
                        asserta(positionPlayer(X,1,1)),    /* inisiasi posisi awal di map */
                        asserta(gold(X,100)),
                        inventorysorcerer.

checkstats(Username) :- write('Username : '), write(Username), nl,
                        write('Class    : '), class(Username, Class), write(Class), nl,
                        write('Level    : '), level(Username, Level), write(Level), nl,
                        write('Health   : '), health(Username, Health), write(Health), nl,
                        write('Attack   : '), attack(Username, Attack), write(Attack), nl,
                        write('Defense  : '), defense(Username, Defense), write(Defense), nl,
                        write('Speed    : '), speed(Username, Speed), write(Speed), nl,
                        write('EXP      : '), exp(Username, Exp), write(Exp), nl,
                        write('Gold     : '), gold(Username, Gold), write(Gold), nl,nl.
