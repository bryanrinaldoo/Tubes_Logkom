isClass(swordsman).
isClass(archer).
isClass(mage).

:- dynamic(creatswordsman/1).
createswordsman(X) :-   assert(class(X,swordsman)),
                        assert(health(X,10)),
                        assert(attack(X,5)),
                        assert(defense(X,7)),
                        assert(speed(X,4)),
                        assert(specialattack(X,7)),
                        assert(exp(X,0)),
                        assert(level(X,1)).
                    
:- dynamic(createarcher/1).
createarcher(X) :-      assert(class(X,archer)),
                        assert(health(X,10)),
                        assert(attack(X,5)),
                        assert(defense(X,6)),
                        assert(speed(X,5)),
                        assert(specialattack(X,8)),
                        assert(exp(X,0)),
                        assert(level(X,1)).
                    
:- dynamic(createmage/1).
createmage(X) :-        assert(class(X,mage)),
                        assert(health(X,9)),
                        assert(attack(X,5)),
                        assert(defense(X,5)),
                        assert(speed(X,4)),
                        assert(specialattack(X,9)),
                        assert(exp(X,0)),
                        assert(level(X,1)).

checkStats(Username) :- write('Username : '), write(Username), nl,
                        write('Class    : '), class(Username, Class), write(Class), nl,
                        write('Level    : '), level(Username, Level), write(Level), nl,
                        write('Health   : '), health(Username, Health), write(Health), nl,
                        write('Attack   : '), attack(Username, Attack), write(Attack), nl,
                        write('Defense        : '), defense(Username, Defense), write(Defense), nl,
                        write('Speed          : '), speed(Username, Speed), write(Speed), nl, nl.