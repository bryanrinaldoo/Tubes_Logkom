isClass(swordsman).
isClass(archer).
isClass(mage).

:- dynamic(creatswordsman/1).
createswordsman(X) :-   asserta(class(X,swordsman)),
                        asserta(health(X,10)),
                        asserta(attack(X,5)),
                        asserta(defense(X,7)),
                        asserta(speed(X,4)),
                        asserta(specialattack(X,7)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)).
                    
:- dynamic(createarcher/1).
createarcher(X) :-      asserta(class(X,archer)),
                        asserta(health(X,10)),
                        asserta(attack(X,5)),
                        asserta(defense(X,6)),
                        asserta(speed(X,5)),
                        asserta(specialattack(X,8)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)).
                    
:- dynamic(createmage/1).
createmage(X) :-        asserta(class(X,mage)),
                        asserta(health(X,9)),
                        asserta(attack(X,5)),
                        asserta(defense(X,5)),
                        asserta(speed(X,4)),
                        asserta(specialattack(X,9)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)).

checkstats(Username) :- write('Username : '), write(Username), nl,
                        write('Class    : '), class(Username, Class), write(Class), nl,
                        write('Level    : '), level(Username, Level), write(Level), nl,
                        write('Health   : '), health(Username, Health), write(Health), nl,
                        write('Attack   : '), attack(Username, Attack), write(Attack), nl,
                        write('Defense  : '), defense(Username, Defense), write(Defense), nl,
                        write('Speed    : '), speed(Username, Speed), write(Speed), nl, nl.