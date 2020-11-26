ogre(X) :-
    asserta(class(X,monster)),
    asserta(health(X,100)),
    asserta(attack(X,20)),
    asserta(defense(X,20)),
    asserta(speed(X,9)),
    asserta(specialattack(X,minibash,45)),
    asserta(level(X,3)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 20,
    NewG is PrevG + 150,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

wolf(X) :-
    asserta(class(X,monster)),
    asserta(health(X,350)),
    asserta(attack(X,45)),
    asserta(defense(X,25)),
    asserta(speed(X,14)),
    asserta(specialattack(X,sharpbite,85)),
    asserta(level(X,8)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 50,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

golem(X) :-
    asserta(class(X,monster)),
    asserta(health(X,700)),
    asserta(attack(X,90)),
    asserta(defense(X,45)),
    asserta(speed(X,19)),
    asserta(specialattack(X,avalanche,135)),
    asserta(level(X,14)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 150,
    NewG is PrevG + 500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

viper(X) :-
    asserta(class(X,monster)),
    asserta(health(X,1050)),
    asserta(attack(X,105)),
    asserta(defense(X,70)),
    asserta(speed(X,24)),
    asserta(specialattack(X,poisonbreak,195)),
    asserta(level(X,17)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 450,
    NewG is PrevG + 750,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

sorrowling(X) :-
    asserta(class(X,miniboss)),
    asserta(health(X,1650)),
    asserta(attack(X,200)),
    asserta(defense(X,125)),
    asserta(speed(X,34)),
    asserta(specialattack(X,phantomslash,300)),
    asserta(level(X,20)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 750,
    NewG is PrevG + 1000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

aghanim(X) :-
    asserta(class(X,boss)),
    asserta(health(X,3000)),
    asserta(attack(X,400)),
    asserta(defense(X,250)),
    asserta(speed(X,50)),
    asserta(specialattack(X,prismaticbolt,600)),
    asserta(level(X,22)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1500,
    NewG is PrevG + 2000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).
