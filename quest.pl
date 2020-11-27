quest :-
    positionPlayer(_,BarisPlayer,KolomPlayer), position(quest,BarisPlayer,KolomPlayer),
    write('       /\          /\          /\       '),nl,
    write('    /\//\\/\    /\//\\/\    /\//\\/\    '),nl,
    write(' /\//\\\///\\/\//\\\///\\/\//\\\///\\/\ '),nl,
    write('//\\\//\/\\///\\\//\/\\///\\\//\/\\///\\'),nl,
    write('\\//\/    WELCOME TO THE QUEST!   \/\\//'),nl,
    write(' \/                                  \/ '),nl,
    write(' /\     Quest Category List:         /\ '),nl,
    write('//\\    1. Killing Monster Quest    //\\'),nl,
    write('\\//    2. Upgrading Quest          \\//'),nl,
    write(' \/     3. Shopping Quest            \/ '),nl,
    write(' /\     4. Gacha Quest               /\ '),nl,
    write('//\\/\ 5. Exit                      //\\'),nl,
    write('\\///\\/\//\\\///\\/\//\\\///\\/\//\\\//'),nl,
    write(' \/\\///\\\//\/\\///\\\//\/\\///\\\//\/ '),nl,
    write('    \/\\//\/    \/\\//\/    \/\\//\/    '),nl,
    write('       \/          \/          \/       '),nl,nl,

    write('Which quest category do you want to choose?'), nl,
    write('Or are you just looking around? '),nl,
    read_integer(Pickquest),nl,nl,

    (Pickquest = 1 -> killquest,!;
    Pickquest = 2 -> upgradingquest,!;
    Pickquest = 3 -> shoppingquest,!;
    Pickquest = 4 -> gachaquest,!;
    Pickquest = 5 -> write('See ya!'),nl,!).

quest :-    
    positionPlayer(_,BarisPlayer,KolomPlayer), \+position(quest,BarisPlayer,KolomPlayer),
    write('Oops, You are not in the quest. Move to the symbol \'Q\' on the map to access quest!'),!.

killquest :-
    write('----------------------Killing Monster Quest---------------------'),nl,
    write('|No.|      Quest      |      Description      | Required Level |'),nl,
    write('|---|-----------------|-----------------------|----------------|'),nl,
    write('|1. | Newbie Quest 1  |  Kill 15 Goblin       |        1       |'),nl,
    write('|2. | Newbie Quest 2  |  Kill 15 Slime        |        1       |'),nl,
    write('|3. | Kill Monster 1  |  Kill 5 Ogre          |        3       |'),nl,
    write('|4. | Kill Monster 2  |  Kill 10 Ogre         |        5       |'),nl,
    write('|5. | Kill Monster 3  |  Kill 5 Wolf          |        8       |'),nl,
    write('|6. | Kill Monster 4  |  Kill 10 Wolf         |       10       |'),nl,
    write('|7. | Kill Monster 5  |  Kill 5 Golem         |       14       |'),nl,
    write('|8. | Kill Monster 6  |  Kill 10 Golem        |       16       |'),nl,
    write('|9. | Kill Monster 7  |  Kill 5 Viper         |       17       |'),nl,
    write('|10.| Kill Monster 8  |  Kill 10 Viper        |       19       |'),nl,
    write('|11.| Kill Miniboss 1 |  Kill 3 Sorrowling    |       19       |'),nl,
    write('|12.| Kill Miniboss 2 |  Kill 5 Sorrowling    |       21       |'),nl,
    write('|13.| Kill Boss 1     |  Kill 1 Aghanim       |       22       |'),nl,
    write('|14.| Kill Boss 2     |  Kill 3 Aghanim       |       25       |'),nl,
    write('|15.| Kill Boss 3     |  Kill 5 Aghanim       |       28       |'),nl,
    write('|___|_________________|_______________________|________________|'),nl,nl,

    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,nl,

    (Pickquest = 1 ->
    (Level >= 1 ->
    asserta(quest(User,newbiemission1)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 2 ->
    (Level >= 1 ->
    asserta(quest(User,newbiemission2)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 3 ->
    (Level >= 3 ->
    asserta(quest(User,killogre1)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 4 ->
    (Level >= 5 ->
    asserta(quest(User,killogre2)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 5 ->
    (Level >= 8 ->
    asserta(quest(User,killwolf1)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 6 ->
    (Level >= 10 ->
    asserta(quest(User,killwolf2)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 7 ->
    (Level >= 14 ->
    asserta(quest(User,killgolem1)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 8 ->
    (Level >= 16 ->
    asserta(quest(User,killgolem2)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 9 ->
    (Level >= 17 ->
    asserta(quest(User,killviper1)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 10 ->
    (Level >= 19 ->
    asserta(quest(User,killviper2)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 11 ->
    (Level >= 19 ->
    asserta(quest(User,killsorrowling1)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 12 ->
    (Level >= 21 ->
    asserta(quest(User,killsorrowling2)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 13 ->
    (Level >= 22 ->
    asserta(quest(User,killaghanim1)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 14 ->
    (Level >= 25 ->
    asserta(quest(User,killaghanim2)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 15 ->
    (Level >= 28 ->
    asserta(quest(User,killaghanim3)),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!)).

upgradingquest :-
    write('----------------------------Upgrading Quest-----------------------------'),nl,
    write('|No.|      Quest      |          Description          | Required Level |'),nl,
    write('|---|-----------------|-------------------------------|----------------|'),nl,
    write('|1. |Upgrade Weapon 1 |  Upgrade Weapon to Wood       |        1       |'),nl,
    write('|2. |Upgrade Weapon 2 |  Upgrade Weapon to Iron       |        1       |'),nl,
    write('|3. |Upgrade Weapon 3 |  Upgrade Weapon to Diamond    |        1       |'),nl,
    write('|4. |Upgrade Weapon 4 |  Upgrade Weapon to Legendary  |        1       |'),nl,
    write('|5. |Upgrade Armor 1  |  Upgrade Armor to Wood        |        1       |'),nl,
    write('|6. |Upgrade Armor 2  |  Upgrade Armor to Iron        |        1       |'),nl,
    write('|7. |Upgrade Armor 3  |  Upgrade Armor to Diamond     |        1       |'),nl,
    write('|8. |Upgrade Armor 4  |  Upgrade Armor to Legendary   |        1       |'),nl,
    write('|9. |Upgrade Acc 1    |  Upgrade Acc to Wood          |        1       |'),nl,
    write('|10.|Upgrade Acc 2    |  Upgrade Acc to Iron          |        1       |'),nl,
    write('|11.|Upgrade Acc 3    |  Upgrade Acc to Diamond       |        1       |'),nl,
    write('|12.|Upgrade Acc 4    |  Upgrade Acc to Legendary     |        1       |'),nl,
    write('|___|_________________|_______________________________|________________|'),nl,nl,

    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,nl,

    (Pickquest = 1 ->
    (asserta(quest(User,upgradewp1)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 2 ->
    (asserta(quest(User,upgradewp2)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 3 ->
    (asserta(quest(User,upgradewp3)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 4 ->
    (asserta(quest(User,upgradewp4)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 5 ->
    (asserta(quest(User,upgradear1)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 6 ->
    (asserta(quest(User,upgradear2)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 7 ->
    (asserta(quest(User,upgradear3)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 8 ->
    (asserta(quest(User,upgradear4)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 9 ->
    (asserta(quest(User,upgradeacc1)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 10 ->
    (asserta(quest(User,upgradeacc2)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 11 ->
    (asserta(quest(User,upgradeacc3)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 12 ->
    (asserta(quest(User,upgradeacc4)),
    write('You\'ve chosen this quest!'),nl,!)).

shoppingquest :-
    write('--------------------------Shopping Quest-------------------------'),nl,
    write('|No.|      Quest      |        Description       | Required Level |'),nl,
    write('|---|-----------------|--------------------------|----------------|'),nl,
    write('|1. |  Healing        |  Buy 20 HP Potion        |        1       |'),nl,
    write('|2. |  Big Healing    |  Buy 10 Big HP Potion    |        1       |'),nl,
    write('|3. |  Attack++       |  Buy 15 Attack Potion    |        1       |'),nl,
    write('|4. |  Defense++      |  Buy 15 Defense Potion   |        1       |'),nl,
    write('|___|_________________|__________________________|________________|'),nl,
    
    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,nl,

    (Pickquest = 1 ->
    (asserta(quest(User,buyhppotion)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 2 ->
    (asserta(quest(User,buybighppotion)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 3 ->
    (asserta(quest(User,buyattpotion)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 4 ->
    (asserta(quest(User,buydefpotion)),
    write('You\'ve chosen this quest!'),nl,!)).

gachaquest :-
    write('---------------------------Gacha Quest--------------------------'),nl,
    write('|No.|        Quest        |    Description    | Required Level |'),nl,
    write('|---|---------------------|-------------------|----------------|'),nl,
    write('|1. |  Newbie Gacha       |  Gacha 5 times    |        1       |'),nl,
    write('|2. |  Intermediate Gacha |  Gacha 10 times   |        1       |'),nl,
    write('|3. |  Advanced Gacha     |  Gacha 15 times   |        1       |'),nl,
    write('|4. |  Gacha Pro          |  Gacha 25 times   |        1       |'),nl,
    write('|5. |  Super Gacha        |  Gacha 50 times   |        1       |'),nl,
    write('|6. |  MEGA Gacha         |  Gacha 100 times  |        1       |'),nl,
    write('|7. |  GACHA KING         |  Gacha 1000 times |        1       |'),nl,
    write('|___|_____________________|___________________|________________|'),nl,nl,

    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,nl,

    (Pickquest = 1 ->
    (asserta(quest(User,gacha5)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 2 ->
    (asserta(quest(User,gacha10)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 3 ->
    (asserta(quest(User,gacha15)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 4 ->
    (asserta(quest(User,gacha25)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 5 ->
    (asserta(quest(User,gacha50)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 6 ->
    (asserta(quest(User,gacha100)),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 7 ->
    (asserta(quest(User,gacha1000)),
    write('You\'ve chosen this quest!'),nl,!)).

questdone(Quest) :-
    rewardExp(Xp),
    rewardGold(Gold),
    retract(exp(X,Prev)),
    retract(gold(X,Prev)),
    New is Prev + Xp,
    New is Prev + Gold,
    asserta(exp(X,New)),
    asserta(gold(X,New)).

/* Quest Kill Monster */

newbiemission1 :-
    asserta(kill(goblin,15)),
    asserta(rewardExp(100)),
    asserta(rewardGold(100)).

newbiemission2 :-
    asserta(kill(slime,15)),
    asserta(rewardExp(100)),
    asserta(rewardGold(100)).

killogre1 :-
    asserta(kill(ogre,5)),
    asserta(rewardExp(250)),
    asserta(rewardGold(300)).

killogre2 :-
    asserta(kill(ogre,10)),
    asserta(rewardExp(450)),
    asserta(rewardGold(550)).

killwolf1 :-
    asserta(kill(wolf,5)),
    asserta(rewardExp(350)),
    asserta(rewardGold(450)).

killwolf2 :-
    asserta(kill(wolf,10)),
    asserta(rewardExp(600)),
    asserta(rewardGold(650)).

killgolem1 :-
    asserta(kill(golem,5)),
    asserta(rewardExp(600)),
    asserta(rewardGold(600)).

killgolem2 :-
    asserta(kill(golem,10)),
    asserta(rewardExp(800)),
    asserta(rewardGold(850)).

killviper1 :-
    asserta(kill(viper,5)),
    asserta(rewardExp(720)),
    asserta(rewardGold(800)).

killviper2 :-
    asserta(kill(viper,10)),
    asserta(rewardExp(920)),
    asserta(rewardGold(1000)).

killsorrowling1 :-
    asserta(kill(sorrowling,3)),
    asserta(rewardExp(1060)),
    asserta(rewardGold(1320)).

killsorrowling2 :-
    asserta(kill(sorrowling,5)),
    asserta(rewardExp(1640)),
    asserta(rewardGold(1880)).

killaghanim1 :-
    asserta(kill(aghanim,1)),
    asserta(rewardExp(1800)),
    asserta(rewardGold(2400)).

killaghanim2 :-
    asserta(kill(aghanim,3)),
    asserta(rewardExp(2500)),
    asserta(rewardGold(3000)).

killaghanim3 :-
    asserta(kill(aghanim,5)),
    asserta(rewardExp(4000)),
    asserta(rewardGold(5900)).

/* Quest Upgrade Item */

upgradewp1 :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    (asserta(rewardExp(250))),
    (asserta(rewardGold(250))).

upgradewp2 :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    (asserta(rewardExp(500))),
    (asserta(rewardGold(500))).

upgradewp3 :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    (asserta(rewardExp(1000))),
    (asserta(rewardGold(1000))).

upgradewp4 :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    (asserta(rewardExp(1650))),
    (asserta(rewardGold(1650))).

upgradear1 :-
    class(User,Class), armorcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    (asserta(rewardExp(250))),
    (asserta(rewardGold(250))).

upgradear2 :-
    class(User,Class), armorcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    (asserta(rewardExp(500))),
    (asserta(rewardGold(500))).

upgradear3 :-
    class(User,Class), armorcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    (asserta(rewardExp(1000))),
    (asserta(rewardGold(1000))).

upgradear4 :-
    class(User,Class), armorcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    (asserta(rewardExp(1650))),
    (asserta(rewardGold(1650))).

upgradeacc1 :-
    class(User,Class), accessorycheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    (asserta(rewardExp(250))),
    (asserta(rewardGold(250))).

upgradeacc2 :-
    class(User,Class), accessorycheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    (asserta(rewardExp(500))),
    (asserta(rewardGold(500))).

upgradeacc3 :-
    class(User,Class), accessorycheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    (asserta(rewardExp(1000))),
    (asserta(rewardGold(1000))).

upgradeacc4 :-
    class(User,Class), accessorycheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    (asserta(rewardExp(1650))),
    (asserta(rewardGold(1650))).

/* Quest Shop */

buyhppotion :-
    asserta(buy(health_potion,20)),
    asserta(rewardExp(150)),
    asserta(rewardGold(250)).

buybighppotion :-
    asserta(buy(big_health_potion,10)),
    asserta(rewardExp(150)),
    asserta(rewardGold(250)).

buyattpotion :-
    asserta(buy(attack_potion,15)),
    asserta(rewardExp(300)),
    asserta(rewardGold(300)).

buydefpotion :-
    asserta(buy(defense_potion,15)),
    asserta(rewardExp(300)),
    asserta(rewardGold(300)).

/* Quest Gacha */

gacha5 :-
    asserta(gacha(10)),
    asserta(rewardExp(500)),
    asserta(rewardGold(500)),
    keepitem(health_potion,10),
    keepitem(big_health_potion,5),
    keepitem(attack_potion,5),
    keepitem(defense_potion,5).

gacha10 :-
    asserta(gacha(10)),
    asserta(rewardExp(500)),
    asserta(rewardGold(500)),
    randomwood.

gacha15 :-
    asserta(gacha(10)),
    asserta(rewardExp(600)),
    asserta(rewardGold(600)),
    randomiron.

gacha25 :-
    asserta(gacha(10)),
    asserta(rewardExp(800)),
    asserta(rewardGold(800)),
    randomdiamond.

gacha50 :-
    asserta(gacha(10)),
    asserta(rewardExp(1200)),
    asserta(rewardGold(1200)),
    randomlegendary.

gacha100 :-
    asserta(gacha(10)),
    asserta(rewardExp(2500)),
    asserta(rewardGold(2500)),
    randomwood,
    randomiron,
    randomdiamond,
    randomlegendary,
    write('You are insane!').

gacha1000 :-
    asserta(gacha(10)),
    asserta(rewardExp(10000)),
    asserta(rewardGold(10000)),
    randomlegendary,
    randomlegendary,
    randomlegendary,
    randomlegendary,
    write('You must have been a MEGA Spender!'),nl,
    write('You are GACHA KING now!').
