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
    read_integer(Pickquest),nl,
    (Pickquest = 1 -> killquest,!;
    Pickquest = 2 -> upgradingquest,!;
    Pickquest = 3 -> shoppingquest,!;
    Pickquest = 4 -> gachaquest,!;
    Pickquest = 5 -> write('See ya!'),nl,!).

quest :-    
    positionPlayer(_,BarisPlayer,KolomPlayer), \+position(quest,BarisPlayer,KolomPlayer),
    write('Oops, kamu tidak berada di quest. Masuk ke dalam tempat berlambang \'Q\' untuk akses fitur quest!'),!.

killquest :-
    write('---------------------------Kill Quest--------------------------'),nl,
    write('|No.|      Quest      |      Description     | Required Level |'),nl,
    write('|---|-----------------|----------------------|----------------|'),nl,
    write('|1. | Newbie Quest 1  |    Kill 15 Goblin    |        1       |'),nl,
    write('|2. | Newbie Quest 2  |    Kill 15 Slime     |        1       |'),nl,
    write('|3. | Kill Monster 1  |    Kill 5 Ogre       |        3       |'),nl,
    write('|4. | Kill Monster 2  |    Kill 10 Ogre      |        5       |'),nl,
    write('|5. | Kill Monster 3  |    Kill 5 Wolf       |        8       |'),nl,
    write('|6. | Kill Monster 4  |    Kill 10 Wolf      |        10      |'),nl,
    write('|7. | Kill Monster 5  |    Kill 5 Golem      |        14      |'),nl,
    write('|8. | Kill Monster 6  |    Kill 10 Golem     |        16      |'),nl,
    write('|9. | Kill Monster 7  |    Kill 5 Viper      |        17      |'),nl,
    write('|10.| Kill Monster 8  |    Kill 10 Viper     |        19      |'),nl,
    write('|11.| Kill Miniboss 1 |    Kill 3 Sorrowling |        19      |'),nl,
    write('|12.| Kill Miniboss 2 |    Kill 5 Sorrowling |        21      |'),nl,
    write('|13.| Kill Boss 1     |    Kill 1 Aghanim    |        22      |'),nl,
    write('|14.| Kill Boss 2     |    Kill 3 Aghanim    |        25      |'),nl,
    write('|15.| Kill Boss 3     |    Kill 5 Aghanim    |        28      |'),nl,
    write('|___|_________________|______________________|________________|'),nl,nl,

    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,

    (Pickquest = 1 ->
    (Level >= 1 ->
    asserta(quest(User,newbiemission1(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 2 ->
    (Level >= 1 ->
    asserta(quest(User,newbiemission2(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 3 ->
    (Level >= 3 ->
    asserta(quest(User,killogre1(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 4 ->
    (Level >= 5 ->
    asserta(quest(User,killogre2(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 5 ->
    (Level >= 8 ->
    asserta(quest(User,killwolf1(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 6 ->
    (Level >= 10 ->
    asserta(quest(User,killwolf2(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 7 ->
    (Level >= 14 ->
    asserta(quest(User,killgolem1(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 8 ->
    (Level >= 16 ->
    asserta(quest(User,killgolem2(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 9 ->
    (Level >= 17 ->
    asserta(quest(User,killviper1(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 10 ->
    (Level >= 19 ->
    asserta(quest(User,killviper2(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 11 ->
    (Level >= 19 ->
    asserta(quest(User,killsorrowling1(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 12 ->
    (Level >= 21 ->
    asserta(quest(User,killsorrowling2(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 13 ->
    (Level >= 22 ->
    asserta(quest(User,killaghanim1(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 14 ->
    (Level >= 25 ->
    asserta(quest(User,killaghanim2(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

    Pickquest = 15 ->
    (Level >= 28 ->
    asserta(quest(User,killaghanim3(X))),
    write('You\'ve chosen this quest!'),nl,!;
    write('You haven\'t met the required level!'),!);

upgradingquest :-
    write('----------------------------Upgrading Quest----------------------------'),nl,
    write('|No.|      Quest      |         Description          | Required Level |'),nl,
    write('|---|-----------------|------------------------------|----------------|'),nl,
    write('|1. |Upgrade Weapon 1 |  Upgrade Weapon to Wood      |        1       |'),nl,
    write('|2. |Upgrade Weapon 2 |  Upgrade Weapon to Iron      |        1       |'),nl,
    write('|3. |Upgrade Weapon 3 |  Upgrade Weapon to Diamond   |        1       |'),nl,
    write('|4. |Upgrade Weapon 4 |  Upgrade Weapon to Legendary |        1       |'),nl,
    write('|5. |Upgrade Armor 1  |  Upgrade Armor to Wood       |        1       |'),nl,
    write('|6. |Upgrade Armor 2  |  Upgrade Armor to Iron       |        1       |'),nl,
    write('|7. |Upgrade Armor 3  |  Upgrade Armor to Diamond    |        1       |'),nl,
    write('|8. |Upgrade Armor 4  |  Upgrade Armor to Legendary  |        1       |'),nl,
    write('|9. |Upgrade Acc 1    |  Upgrade Acc to Wood         |        1       |'),nl,
    write('|10.|Upgrade Acc 2    |  Upgrade Acc to Iron         |        1       |'),nl,
    write('|11.|Upgrade Acc 3    |  Upgrade Acc to Diamond      |        1       |'),nl,
    write('|12.|Upgrade Acc 4    |  Upgrade Acc to Legendary    |        1       |'),nl,
    write('|___|_________________|______________________________|________________|'),nl,nl,

    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,

    (Pickquest = 1 ->
    (asserta(quest(User,upgradewp1(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 2 ->
    (asserta(quest(User,upgradewp2(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 3 ->
    (asserta(quest(User,upgradewp3(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 4 ->
    (asserta(quest(User,upgradewp4(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 5 ->
    (asserta(quest(User,upgradear1(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 6 ->
    (asserta(quest(User,upgradear2(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 7 ->
    (asserta(quest(User,upgradear3(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 8 ->
    (asserta(quest(User,upgradear4(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 9 ->
    (asserta(quest(User,upgradeacc1(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 10 ->
    (asserta(quest(User,upgradeacc2(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 11 ->
    (asserta(quest(User,upgradeacc3(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 12 ->
    (asserta(quest(User,upgradeacc4(X))),
    write('You\'ve chosen this quest!'),nl,!);

shoppingquest :-
    write('----------------------------Shopping Quest----------------------------'),nl,
    write('|No.|      Quest      |         Description          | Required Level |'),nl,
    write('|---|-----------------|------------------------------|----------------|'),nl,
    write('|1. |  Healing        |  Buy 20 HP Potion            |        1       |'),nl,
    write('|2. |  Big Healing    |  Buy 10 Big HP Potion        |        1       |'),nl,
    write('|3. |  Attack++       |  Buy 15 Attack Potion        |        1       |'),nl,
    write('|4. |  Defense++      |  Buy 15 Defense Potion       |        1       |'),nl,
    write('|5. |  Not so poor    |  Spend 100 Gold              |        1       |'),nl,
    write('|6. |  Small Spender  |  Spend 500 Gold              |        1       |'),nl,
    write('|7. |  Medium Spender |  Spend 1000 Gold             |        1       |'),nl,
    write('|8. |  Big Spender    |  Spend 3000 Gold             |        1       |'),nl,
    write('|9. |  MEGA Spender   |  Spend 10000 Gold            |        1       |'),nl,
    write('|10.|  SPENDER KING   |  Spend 25000 Gold            |        1       |'),nl,
    write('|___|_________________|______________________________|________________|'),nl,
    
    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,

    (Pickquest = 1 ->
    (asserta(quest(User,buyhppotion(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 2 ->
    (asserta(quest(User,buybighppotion(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 3 ->
    (asserta(quest(User,buyattpotion(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 4 ->
    (asserta(quest(User,buydefpotion(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 5 ->
    (asserta(quest(User,spend100(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 6 ->
    (asserta(quest(User,spend500(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 7 ->
    (asserta(quest(User,spend1000(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 8 ->
    (asserta(quest(User,spend3000(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 9 ->
    (asserta(quest(User,spend10000(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 10 ->
    (asserta(quest(User,spend25000(X))),
    write('You\'ve chosen this quest!'),nl,!);

gachaquest :-
    write('-------------------------------Gacha Quest---------------------------------'),nl,
    write('|No.|      Quest          |         Description          | Required Level |'),nl,
    write('|---|---------------------|------------------------------|----------------|'),nl,
    write('|1. |  Newbie Gacha       |  Buy 20 HP Potion            |        1       |'),nl,
    write('|2. |  Intermediate Gacha |  Buy 10 Big HP Potion        |        1       |'),nl,
    write('|3. |  Advanced Gacha     |  Buy 15 Attack Potion        |        1       |'),nl,
    write('|4. |  Gacha Pro          |  Buy 15 Defense Potion       |        1       |'),nl,
    write('|5. |  Super Gacha        |  Spend 100 Gold              |        1       |'),nl,
    write('|6. |  Mega Gacha         |  Spend 500 Gold              |        1       |'),nl,
    write('|7. |  GACHA KING         |  Spend 1000 Gold             |        1       |'),nl,
    write('|___|_____________________|______________________________|________________|'),nl,nl,

    write('Which quest do you want to choose?'),nl,
    read_integer(Pickquest),nl,

    (Pickquest = 1 ->
    (asserta(quest(User,gacha5(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 2 ->
    (asserta(quest(User,gacha10(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 3 ->
    (asserta(quest(User,gacha15(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 4 ->
    (asserta(quest(User,gacha20(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 5 ->
    (asserta(quest(User,gacha25(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 6 ->
    (asserta(quest(User,gacha100(X))),
    write('You\'ve chosen this quest!'),nl,!);

    Pickquest = 7 ->
    (asserta(quest(User,gacha1000(X))),
    write('You\'ve chosen this quest!'),nl,!);

/* Quest Kill Monster */

newbiemission1(X) :-
    asserta(kill(goblin,15)),
    asserta(level(X,1)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)).

newbiemission2(X) :-
    asserta(kill(slime,15)),
    asserta(level(X,1)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)).

killogre1(X) :-
    asserta(kill(ogre,5)),
    asserta(level(X,3)),
    asserta(rewardExp(X,250)),
    asserta(rewardGold(X,300)).

killogre2(X) :-
    asserta(kill(ogre,10)),
    asserta(level(X,5)),
    asserta(rewardExp(X,450)),
    asserta(rewardGold(X,550)).

killwolf1(X) :-
    asserta(kill(wolf,5)),
    asserta(level(X,8)),
    asserta(rewardExp(X,350)),
    asserta(rewardGold(X,450)).

killwolf2(X) :-
    asserta(kill(wolf,10)),
    asserta(level(X,10)),
    asserta(rewardExp(X,600)),
    asserta(rewardGold(X,650)).

killgolem1(X) :-
    asserta(kill(golem,5)),
    asserta(level(X,14)),
    asserta(rewardExp(X,600)),
    asserta(rewardGold(X,600)).

killgolem2(X) :-
    asserta(kill(golem,10)),
    asserta(level(X,16)),
    asserta(rewardExp(X,800)),
    asserta(rewardGold(X,850)).

killviper1(X) :-
    asserta(kill(viper,5)),
    asserta(level(X,17)),
    asserta(rewardExp(X,720)),
    asserta(rewardGold(X,800)).

killviper2(X) :-
    asserta(kill(viper,10)),
    asserta(level(X,19)),
    asserta(rewardExp(X,920)),
    asserta(rewardGold(X,1000)).

killsorrowling1(X) :-
    asserta(kill(sorrowling,3)),
    asserta(level(X,19)),
    asserta(rewardExp(X,1060)),
    asserta(rewardGold(X,1320)).

killsorrowling2(X) :-
    asserta(kill(sorrowling,5)),
    asserta(level(X,21)),
    asserta(rewardExp(X,1640)),
    asserta(rewardGold(X,1880)).

killaghanim1(X) :-
    asserta(kill(aghanim,1)),
    asserta(level(X,22)),    
    asserta(rewardExp(X,1800)),
    asserta(rewardGold(X,2400)).

killaghanim2(X) :-
    asserta(kill(aghanim,3)),
    asserta(level(X,25)),
    asserta(rewardExp(X,2500)),
    asserta(rewardGold(X,3000)).

killaghanim3(X) :-
    asserta(kill(aghanim,5)),
    asserta(level(X,28)),
    asserta(rewardExp(X,4000)),
    asserta(rewardGold(X,5900)).

/* Quest Upgrade Item */

upgradewp1(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    (asserta(rewardExp(X,250))),
    (asserta(rewardGold(X,250))).

upgradewp2(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    (asserta(rewardExp(X,500))),
    (asserta(rewardGold(X,500))).

upgradewp3(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    (asserta(rewardExp(X,1000))),
    (asserta(rewardGold(X,1000))).

upgradewp4(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    (asserta(rewardExp(X,1650))),
    (asserta(rewardGold(X,1650))).

upgradear1(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    (asserta(rewardExp(X,250))),
    (asserta(rewardGold(X,250))).

upgradear2(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    (asserta(rewardExp(X,500))),
    (asserta(rewardGold(X,500))).

upgradear3(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    (asserta(rewardExp(X,1000))),
    (asserta(rewardGold(X,1000))).

upgradear4(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    (asserta(rewardExp(X,1650))),
    (asserta(rewardGold(X,1650))).

upgradeacc1(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == wood ->
    (asserta(rewardExp(X,250))),
    (asserta(rewardGold(X,250))).

upgradeacc2(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == iron ->
    (asserta(rewardExp(X,500))),
    (asserta(rewardGold(X,500))).

upgradeacc3(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == diamond ->
    (asserta(rewardExp(X,1000))),
    (asserta(rewardGold(X,1000))).

upgradeacc4(Item) :-
    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
    Level == legendary ->
    (asserta(rewardExp(X,1650))),
    (asserta(rewardGold(X,1650))).

/* Quest Shop */

buyhppotion(Item) :-
    asserta(buy(Item,20)),
    asserta(rewardExp(X,150)),
    asserta(rewardGold(X,250)).

buybighppotion(Item) :-
    asserta(buy(Item,10)),
    asserta(rewardExp(X,150)),
    asserta(rewardGold(X,250)).

buyattpotion(Item) :-
    asserta(buy(Item,15)),
    asserta(rewardExp(X,300)),
    asserta(rewardGold(X,300)).

buydefpotion(Item) :-
    asserta(buy(Item,15)),
    asserta(rewardExp(X,300)),
    asserta(rewardGold(X,300)).

spend100(Gold) :-
    asserta(spend(Gold,100)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)),
    write('Not so poor!').

spend500(Gold) :-
    asserta(spend(Gold,100)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)),
    write('Small Spender').

spend1000(Gold) :-
    asserta(spend(Gold,100)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)),
    write('Medium Spender').

spend3000(Gold) :-
    asserta(spend(Gold,100)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)),
    write('Big Spender').

spend10000(Gold) :-
    asserta(spend(Gold,100)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)),
    write('MEGA Spender').

spend25000(Gold) :-
    asserta(spend(Gold,100)),
    asserta(rewardExp(X,100)),
    asserta(rewardGold(X,100)),
    write('SPENDER KING').

/* Quest Gacha */

gacha5(X) :-
    asserta(gacha(X,10)),
    asserta(rewardExp(X,500)),
    asserta(rewardGold(X,500)),
    keepitem(health_potion,10),
    keepitem(big_health_potion,5),
    keepitem(attack_potion,5),
    keepitem(defense_potion,5).

gacha10(X) :-
    asserta(gacha(X,10)),
    asserta(rewardExp(X,500)),
    asserta(rewardGold(X,500)),
    randomwood.

gacha15(X) :-
    asserta(gacha(X,10)),
    asserta(rewardExp(X,600)),
    asserta(rewardGold(X,600)),
    randomiron.

gacha20(X) :-
    asserta(gacha(X,10)),
    asserta(rewardExp(X,700)),
    asserta(rewardGold(X,700)),
    randomdiamond.

gacha25(X) :-
    asserta(gacha(X,10)),
    asserta(rewardExp(X,800)),
    asserta(rewardGold(X,800)),
    randomlegendary.

gacha100(X) :-
    asserta(gacha(X,10)),
    asserta(rewardExp(X,2000)),
    asserta(rewardGold(X,2000)),
    randomwood,
    randomiron,
    randomdiamond,
    randomlegendary,
    write('You are insane!').

gacha1000(X) :-
    asserta(gacha(X,10)),
    asserta(rewardExp(X,10000)),
    asserta(rewardGold(X,10000)),
    randomlegendary,
    randomlegendary,
    randomlegendary,
    randomlegendary,
    write('You must have been a MEGA Spender!'),nl,
    write('You are GACHA KING now!').
