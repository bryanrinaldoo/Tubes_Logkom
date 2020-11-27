/* Quest Level Up */

level5(X) :-
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

level10(X) :-
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 250,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

level15(X) :-
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 500,
    NewG is PrevG + 500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

level20(X) :-
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1000,
    NewG is PrevG + 1000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

level25(X) :-
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1500,
    NewG is PrevG + 1500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

level28(X) :-
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 3000,
    NewG is PrevG + 3000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

/* Quest Kill Monster */

newbiemission(Goblin) :-
    asserta(kill(Goblin,15)),
    asserta(level(Goblin,1)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

newbiemission(Slime) :-
    asserta(kill(Slime,15)),
    asserta(level(Slime,1)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killogre1(X) :-
    asserta(kill(X,5)),
    asserta(level(X,3)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 250,
    NewG is PrevG + 300,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killogre2(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,5)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 450,
    NewG is PrevG + 550,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killwolf1(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,8)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 350,
    NewG is PrevG + 450,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killwolf2(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 600,
    NewG is PrevG + 650,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killgolem1(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,14)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 600,
    NewG is PrevG + 600,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killgolem2(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,16)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 600,
    NewG is PrevG + 600,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killviper1(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,17)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 720,
    NewG is PrevG + 800,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killviper2(X) :-
    asserta(kill(User,X,10)),
    asserta(level(X,19)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 720,
    NewG is PrevG + 800,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killsorrowling1(X) :-
    asserta(kill(User,X,3)),
    asserta(level(X,19)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1060,
    NewG is PrevG + 1320,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killsorrowling2(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,21)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1640,
    NewG is PrevG + 1880,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killaghanim1(X) :-
    asserta(kill(User,X,1)),
    asserta(level(X,22)),    
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1800,
    NewG is PrevG + 2400,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killaghanim2(X) :-
    asserta(kill(User,X,3)),
    asserta(level(X,25)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 2500,
    NewG is PrevG + 3000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

killaghanim3(X) :-
    asserta(kill(User,X,5)),
    asserta(level(X,28)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 4000,
    NewG is PrevG + 5900,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

/* Quest Upgrade Item */

upgradewp1(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 250,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradewp2(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 500,
    NewG is PrevG + 500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradewp3(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1000,
    NewG is PrevG + 1000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradewp4(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1650,
    NewG is PrevG + 1650,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradear1(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 250,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradear2(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 500,
    NewG is PrevG + 500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradear3(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1000,
    NewG is PrevG + 1000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradear4(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1650,
    NewG is PrevG + 1650,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradeacc1(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 250,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradeacc2(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 500,
    NewG is PrevG + 500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradeacc3(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1000,
    NewG is PrevG + 1000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

upgradeacc4(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1650,
    NewG is PrevG + 1650,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

/* Quest Shop */

buyhppotion(Item) :-
    asserta(buy(Item,20)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 150,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

buybighppotion(Item) :-
    asserta(buy(Item,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 150,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

buyattpotion(Item) :-
    asserta(buy(Item,15)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 150,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

buydefpotion(Item) :-
    asserta(buy(Item,15)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 150,
    NewG is PrevG + 250,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)).

spend100(Gold) :-
    asserta(spend(Gold,100)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    write('Not so poor!').

spend500(Gold) :-
    asserta(spend(Gold,100)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    write('Small Spender').

spend1000(Gold) :-
    asserta(spend(Gold,100)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    write('Medium Spender').

spend3000(Gold) :-
    asserta(spend(Gold,100)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    write('Big Spender').

spend10000(Gold) :-
    asserta(spend(Gold,100)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    write('MEGA Spender').

spend25000(Gold) :-
    asserta(spend(Gold,100)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 100,
    NewG is PrevG + 100,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    write('SPEND KING').

/* Quest Gacha */

gacha5(X) :-
    asserta(gacha(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 500,
    NewG is PrevG + 500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    keepitem(health_potion,10),
    keepitem(big_health_potion,5),
    keepitem(attack_potion,5),
    keepitem(defense_potion,5).

gacha10(X) :-
    asserta(gacha(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 500,
    NewG is PrevG + 500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    randomwood.

gacha15(X) :-
    asserta(gacha(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 600,
    NewG is PrevG + 600,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    randomiron.

gacha20(X) :-
    asserta(gacha(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 700,
    NewG is PrevG + 700,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    randomdiamond.

gacha25(X) :-
    asserta(gacha(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 800,
    NewG is PrevG + 800,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    randomlegendary.

gacha100(X) :-
    asserta(gacha(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 1500,
    NewG is PrevG + 1500,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    randomwood,
    randomiron,
    randomdiamond,
    randomlegendary,
    write('You are insane!').

gacha1000(X) :-
    asserta(gacha(X,10)),
    retract(xp(User,PrevX)),
    retract(gold(User,PrevG)),
    NewX is PrevX + 5000,
    NewG is PrevG + 5000,
    asserta(xp(User,NewX)),
    asserta(gold(User,NewG)),
    randomlegendary,
    randomlegendary,
    randomlegendary,
    randomlegendary,
    write('You must have been a MEGA Spender!'),nl,
    write('You are GACHA KING now!').
