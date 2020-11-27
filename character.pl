isClass(swordsman).
isClass(archer).
isClass(sorcerer).

:- dynamic(createswordsman/1).
createswordsman(X) :-   asserta(class(X,swordsman)),
                        asserta(health(X,10,10)),        /* parameter kedua currHealth, ketiga MaxHealth */
                        asserta(attack(X,5)),
                        asserta(defense(X,7)),
                        asserta(speed(X,4)),
                        asserta(specialattack(X,7)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)),
                        asserta(positionPlayer(X,1,1)),    /* inisiasi posisi awal di map */
                        asserta(gold(X,100)),
                        asserta(ketemuMusuh(0)),
                        inventorysword.
                    
:- dynamic(createarcher/1).
createarcher(X) :-      asserta(class(X,archer)),
                        asserta(health(X,10,10)),
                        asserta(attack(X,5)),
                        asserta(defense(X,6)),
                        asserta(speed(X,5)),
                        asserta(specialattack(X,8)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)),
                        asserta(positionPlayer(X,1,1)),    /* inisiasi posisi awal di map */
                        asserta(gold(X,100)),
                        asserta(ketemuMusuh(0)),
                        inventoryarcher.
                    
:- dynamic(createsorcerer/1).
createsorcerer(X) :-    asserta(class(X,sorcerer)),
                        asserta(health(X,9,9)),
                        asserta(attack(X,5)),
                        asserta(defense(X,5)),
                        asserta(speed(X,4)),
                        asserta(specialattack(X,9)),
                        asserta(exp(X,0)),
                        asserta(level(X,1)),
                        asserta(positionPlayer(X,1,1)),    /* inisiasi posisi awal di map */
                        asserta(gold(X,100)),
                        asserta(ketemuMusuh(0)),
                        inventorysorcerer.

checkstats(Username) :- write('     _        _       '),nl,
                        write('    | |      | |      '),nl,
                        write(' ___| |_ __ _| |_ ___ '),nl,
                        write('/ __| __/ _  | __/ __|'),nl,
                        write('\\__ \\ || (_| | |_\\__ \\'),nl,
                        write('|___/\\__\\__,_|\\__|___/'),nl,nl,
                        write('Username     : '), write(Username), nl,
                        write('Class        : '), class(Username, Class), write(Class), nl,
                        write('Level        : '), level(Username, Level), write(Level), nl,
                        write('Health       : '), health(Username, Health, MaxHealth), write(Health),write('/'),write(MaxHealth),nl,
                        write('Attack       : '), attack(Username, Attack), write(Attack), nl,
                        write('Spc. Attack  : '), specialattack(Username, Spcattack), write(Spcattack), nl,
                        write('Defense      : '), defense(Username, Defense), write(Defense), nl,
                        write('Speed        : '), speed(Username, Speed), write(Speed), nl,
                        write('EXP          : '), exp(Username, Exp), write(Exp), nl,
                        write('Gold         : '), gold(Username, Gold), write(Gold), nl,nl.


%%============================ Leveling ==================== (R. B. Wishnumurti / 13519203)


leveling(X) :-                                  /* X nama player */
              exp(X,ExpPlayer), level(X, LvlPlayer), class(X,ClassPlayer),
              Explevelup is LvlPlayer*10 + 70,
              Explevelup =< ExpPlayer,
              write('LEVEL UP !!!!!!!!!!!!'),nl,nl,
              ExpNew is ExpPlayer - Explevelup,
              LevelUp is LvlPlayer + 1,

                (ClassPlayer == swordsman ->
                HealthGain is 10,
                AttackGain is 10,
                DefenseGain is 10,
                SpeedGain is 10,
                SpecialattackGain is 5,!;

                ClassPlayer == archer ->
                HealthGain is 8,
                AttackGain is 13,
                DefenseGain is 5,
                SpeedGain is 10,
                SpecialattackGain is 10,!;

                ClassPlayer == sorcerer ->
                HealthGain is 6,
                AttackGain is 8,
                DefenseGain is 5,
                SpeedGain is 8,
                SpecialattackGain is 13,!),
                  
                  health(X,_,MaxHealth), attack(X,Attack), defense(X,Defense),
                  speed(X,Speed), specialattack(X,SpcAttack),

                  NewHealth is HealthGain + MaxHealth,
                  NewAttack is AttackGain + Attack,
                  NewDefense is DefenseGain + Defense,
                  NewSpeed is SpeedGain + Speed,
                  NewSpcAttack is SpecialattackGain + SpcAttack,

                  retract(exp(X,_)),
                  asserta(exp(X,ExpNew)),
                  
                  retract(level(X,_)),
                  asserta(level(X,LevelUp)),

                  retract(health(X,_,_)),      
                  asserta(health(X,NewHealth,NewHealth)),    /* karena naik level darahnya penuh lagi */

                  retract(attack(X,_)),
                  asserta(attack(X,NewAttack)),

                  retract(defense(X,_)),
                  asserta(defense(X,NewDefense)),

                  retract(speed(X,_)),
                  asserta(speed(X,NewSpeed)),

                  retract(specialattack(X,_)),
                  asserta(specialattack(X,NewSpcAttack)),
                  
                  write('Your stats have upgrade and ur health full again, take a look to see what just changed'),nl,!.

leveling(X) :-exp(X,ExpPlayer), level(X, LvlPlayer),
              Explevelup is LvlPlayer*10 + 70,
              Explevelup > ExpPlayer,!.
              

