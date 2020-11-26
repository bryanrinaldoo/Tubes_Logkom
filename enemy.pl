ogre(X) :-
    asserta(class(X,monster)),
    asserta(health(X,100)),
    asserta(attack(X,20)),
    asserta(defense(X,20)),
    asserta(speed(X,9)),
    asserta(specialattack(X,minibash,45)),
    asserta(level(X,5)),
    asserta(killExp(X,20)),
    asserta(killGold(X,150)).

wolf(X) :-
    asserta(class(X,monster)),
    asserta(health(X,350)),
    asserta(attack(X,45)),
    asserta(defense(X,25)),
    asserta(speed(X,14)),
    asserta(specialattack(X,sharpbite,85)),
    asserta(level(X,10)),
    asserta(killExp(X,50)),
    asserta(killGold(X,250)).

golem(X) :-
    asserta(class(X,monster)),
    asserta(health(X,700)),
    asserta(attack(X,90)),
    asserta(defense(X,45)),
    asserta(speed(X,19)),
    asserta(specialattack(X,avalanche,135)),
    asserta(level(X,10)),
    asserta(killExp(X,150)),
    asserta(killGold(X,500)).

viper(X) :-
    asserta(class(X,monster)),
    asserta(health(X,1050)),
    asserta(attack(X,105)),
    asserta(defense(X,70)),
    asserta(speed(X,24)),
    asserta(specialattack(X,poisonbreak,195)),
    asserta(level(X,15)),
    asserta(killExp(X,450)),
    asserta(killGold(X,750)).

sorrowling(X) :-
    asserta(class(X,miniboss)),
    asserta(health(X,1650)),
    asserta(attack(X,200)),
    asserta(defense(X,125)),
    asserta(speed(X,34)),
    asserta(specialattack(X,phantomslash,300)),
    asserta(level(X,20)),
    asserta(killExp(X,750)),
    asserta(killGold(X,1000)).

aghanim(X) :-
    asserta(class(X,boss)),
    asserta(health(X,3000)),
    asserta(attack(X,400)),
    asserta(defense(X,250)),
    asserta(speed(X,50)),
    asserta(specialattack(X,prismaticbolt,600)),
    asserta(level(X,25)),
    asserta(killExp(X,1500)),
    asserta(killGold(X,2000)).
