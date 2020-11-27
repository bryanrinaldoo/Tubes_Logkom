/* weapon*/
weaponcheck(wooden_sword, swordsman).
weaponcheck(iron_sword, swordsman).
weaponcheck(diamond_sword, swordsman).
weaponcheck(legendary_sword, swordsman).

weaponcheck(wooden_bow, archer).
weaponcheck(iron_bow, archer).
weaponcheck(diamond_bow, archer).
weaponcheck(legendary_bow, archer).

weaponcheck(wooden_staff, sorcerer).
weaponcheck(iron_staff, sorcerer).
weaponcheck(diamond_staff, sorcerer).
weaponcheck(legendary_staff, sorcerer).

/*armor*/
armorcheck(wooden_armor,swordsman).
armorcheck(wooden_armor,archer).
armorcheck(wooden_armor,sorcerer).

armorcheck(iron_armor,swordsman).
armorcheck(iron_armor,archer).
armorcheck(iron_armor,sorcerer).

armorcheck(diamond_armor,swordsman).
armorcheck(diamond_armor,archer).
armorcheck(diamond_armor,sorcerer).

armorcheck(legendary_armor,swordsman).
armorcheck(legendary_armor,archer).
armorcheck(legendary_armor,sorcerer).

/*accessory*/
accessorycheck(wooden_ring,swordsman).
accessorycheck(wooden_ring,archer).
accessorycheck(wooden_ring,sorcerer).

accessorycheck(iron_ring,swordsman).
accessorycheck(iron_ring,archer).
accessorycheck(iron_ring,sorcerer).

accessorycheck(diamond_ring,swordsman).
accessorycheck(diamond_ring,archer).
accessorycheck(diamond_ring,sorcerer).

accessorycheck(legendary_ring,swordsman).
accessorycheck(legendary_ring,archer).
accessorycheck(legendary_ring,sorcerer).

/*potion*/
potioncheck(health_potion, Class) :- isClass(Class).
potioncheck(big_health_potion,Class):- isClass(Class).
potioncheck(attack_potion,Class) :- isClass(Class).
potioncheck(defense_potion,Class) :- isClass(Class).

spcpotioncheck(revival_potion,Class) :- isClass(Class).

/*level*/
itemlevel(wooden_sword,wood).
itemlevel(wooden_bow,wood).
itemlevel(wooden_staff,wood).
itemlevel(wooden_armor,wood).
itemlevel(wooden_ring,wood).

itemlevel(iron_sword,iron).
itemlevel(iron_bow,iron).
itemlevel(iron_staff,iron).
itemlevel(iron_armor,iron).
itemlevel(iron_ring,iron).

itemlevel(diamond_sword,diamond).
itemlevel(diamond_bow,diamond).
itemlevel(diamond_staff,diamond).
itemlevel(diamond_armor,diamond).
itemlevel(diamond_ring,diamond).

itemlevel(legendary_sword,legendary).
itemlevel(legendary_bow,legendary).
itemlevel(legendary_staff,legendary).
itemlevel(legendary_armor,legendary).
itemlevel(legendary_ring,legendary).

itemlevel(health_potion,potion).
itemlevel(attack_potion,potion).
itemlevel(defense_potion,potion).
itemlevel(big_health_potion,bigpotion).
itemlevel(revival_potion,spcpotion).

/*Harga*/
hargaitem25(Item) :- itemlevel(Item,wood).
hargaitem50(Item) :- itemlevel(Item,iron).
hargaitem100(Item) :- itemlevel(Item,diamond).
hargaitem200(Item) :- itemlevel(Item,legendary).
hargaitem20(Item) :- itemlevel(Item,potion).
hargaitem40(Item) :- itemlevel(Item,bigpotion).
hargaitem1000(Item) :- itemlevel(Item,spcpotion).

:- dynamic(equipWpn/1).
:- dynamic(equipArm/1).
:- dynamic(equipAcc/1).

useWeapon(Item) :-  (cekBag(Item), weaponcheck(Item,Class),
                    class(_,Class) -> 
                    (equipWpn(Used), Used\== none -> unuseWeapon(_);
                    retract(equipWpn(none))),
                    asserta(equipWpn(Item)),
                    
                    retract(stored(Item,X)),
                    Y is X-1, 
                    asserta(stored(Item,Y)),

                    upStatswp(Item),

                    retract(bagspace(Prev)),
                    New is Prev - 1,
                    asserta(bagspace(New)),

                    write('__      _____  __ _ _ __   ___  _ __  '),nl,
                    write('\\ \\ /\\ / / _ \\/ _  |  _ \\ / _ \\|  _ \\ '),nl,
                    write(' \\ V  V /  __/ (_| | |_) | (_) | | | |'),nl,
                    write('  \\_/\\_/ \\___|\\__,_| .__/ \\___/|_| |_|'),nl,
                    write('                   | |                '),nl,
                    write('                   |_|                '),nl,nl,
                    write(Item),
                    write(' equipped!'),nl,!;

                    \+(cekBag(Item)) -> write('You don\'t have this item'),nl;

                    write('This item not suit you!'),nl).
                    

unuseWeapon(Item) :-    (equipWpn(Item) -> downStatswp(Item),
                        (stored(Item,X) -> 
                        retract(stored(Item,X)), 
                        Y is X + 1, 
                        asserta(stored(Item, Y));
                        asserta(stored(Item,1))), 
                        
                        asserta(equipWpn(none)),
                        bagspace(Used), Used < 100,
                        retract(equipWpn(Item)), 
                        
                        retract(bagspace(Used)),
                        NewUsed is Used + 1, 
                        asserta(bagspace(NewUsed)),

                        write('Item unequipped!'), nl,!;
                        write('???? You don\'t even wear it ???'), nl). 


useArmor(Item) :-   (cekBag(Item), armorcheck(Item,Class),
                    class(_,Class) -> (equipArm(Used), Used\== none -> unuseArmor(_);
                    retract(equipArm(none))),
                    asserta(equipArm(Item)),
                    
                    retract(stored(Item,X)),
                    Y is X-1, 
                    asserta(stored(Item,Y)),

                    upStatsar(Item),

                    retract(bagspace(Prev)),
                    New is Prev - 1,
                    asserta(bagspace(New)),

                    write('  __ _ _ __ _ __ ___   ___  _ __ '),nl,
                    write(' / _  |  __|  _   _ \\ / _ \\|  __|'),nl,
                    write('| (_| | |  | | | | | | (_) | |   '),nl,
                    write(' \\__,_|_|  |_| |_| |_|\\___/|_|   '),nl,nl,
                    write(Item),
                    write(' equipped!'),nl,!;

                    \+(cekBag(Item)) -> write('You don\'t have this item'),nl;

                    write('This item not suit you!'),nl).
                    

unuseArmor(Item) :-     (equipArm(Item) -> downStatsar(Item),
                        (stored(Item,X) -> 
                        retract(stored(Item,X)), 
                        Y is X + 1, 
                        asserta(stored(Item, Y));
                        asserta(stored(Item,1))), 
                        
                        asserta(equipArm(none)),
                        bagspace(Used), Used < 100,
                        retract(equipArm(Item)), 
                        
                        retract(bagspace(Prev)),
                        New is Prev + 1, 
                        asserta(bagspace(New)),

                        write('Item unequipped!'), nl,!;
                        write('???? You don\'t even wear it ???'), nl). 

useAccessory(Item) :-    (cekBag(Item), accessorycheck(Item,Class),
                        class(_,Class) -> (equipAcc(Used), Used\== none -> unuseAccessory(_);
                        retract(equipArm(none))),
                        asserta(equipArm(Item)),
                        
                        retract(stored(Item,X)),
                        Y is X-1, 
                        asserta(stored(Item,Y)),

                        upStatsac(Item),

                        retract(bagspace(Prev)),
                        New is Prev - 1,
                        asserta(bagspace(New)),

                        write('  __ _  ___ ___ ___  ___ ___  ___  _ __ _   _ '),nl,
                        write(' / _  |/ __/ __/ _ \\/ __/ __|/ _ \\|  __| | | |'),nl,
                        write('| (_| | (_| (_|  __/\\__ \\__ \\ (_) | |  | |_| |'),nl,
                        write(' \\__,_|\\___\\___\\___||___/___/\\___/|_|   \\__, |'),nl,
                        write('                                         __/ |'),nl,
                        write('                                        |___/ '),nl,nl,
                        write(Item),
                        write(' equipped!'),nl,!;

                        \+(cekBag(Item)) -> write('You don\'t have this item'),nl;

                        write('This item not suit you!'),nl).
                        

unuseAccessory(Item) :- (equipArm(Item) -> downStatsac(Item),
                        (stored(Item,X) -> 
                        retract(stored(Item,X)), 
                        Y is X + 1, 
                        asserta(stored(Item, Y));
                        asserta(stored(Item,1))), 
                        
                        asserta(equipArm(none)),
                        bagspace(Used), Used < 100,
                        retract(equipArm(Item)), 
                        
                        retract(bagspace(Prev)),
                        New is Prev + 1, 
                        asserta(bagspace(New)),

                        write('Item unequipped!'), nl,!;
                        write('???? You don\'t even wear it ???'), nl). 

usePotion(Item) :-  (cekBag(Item), potioncheck(Item,Class),
                    class(_,Class) -> 
                    retract(stored(Item, X)),
                    Y is X-1, 
                    asserta(stored(Item, Y)),

                    upPotion(Item),

                    retract(bagspace(Prev)),
                    New is Prev - 1,
                    asserta(bagspace(New)),

                    write('             _   _                 '),nl,
                    write('            | | (_)                '),nl,
                    write(' _ __   ___ | |_ _  ___  _ __  ___ '),nl,
                    write('|  _ \\ / _ \\| __| |/ _ \\|  _ \\/ __|'),nl,
                    write('| |_) | (_) | |_| | (_) | | | \\__ \\'),nl,
                    write('| .__/ \\___/ \\__|_|\\___/|_| |_|___/'),nl,
                    write('| |                                '),nl,
                    write('|_|                                '),nl,nl,
                    write('Potion used!'),nl,!;
                    \+(cekBag(Item)) -> write('You don\'t have this item. Go to the store to buy it'),nl).

/*up and down stats weapon*/
upStatswp(Item) :-  class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
                    (Level == wood -> retract(attack(User,Prev)), New is Prev + 2, asserta(attack(User,New));
                    Level == iron -> retract(attack(User,Prev)), New is Prev + 4, asserta(attack(User,New));
                    Level == diamond -> retract(attack(User,Prev)), New is Prev + 6, asserta(attack(User,New));
                    Level == legendary -> retract(attack(User,Prev)), New is Prev + 8, asserta(attack(User,New))).

downStatswp(Item) :-    class(User,Class), weaponcheck(Item,Class), itemlevel(Item,Level),
                        (Level == wood -> retract(attack(User,Prev)), New is Prev - 2, asserta(attack(User,New));
                        Level == iron -> retract(attack(User,Prev)), New is Prev - 4, asserta(attack(User,New));
                        Level == diamond -> retract(attack(User,Prev)), New is Prev - 6, asserta(attack(User,New));
                        Level == legendary -> retract(attack(User,Prev)), New is Prev - 8, asserta(attack(User,New))).

/*up and down stats armor*/
upStatsar(Item) :-  class(User,Class), armorcheck(Item,Class), itemlevel(Item,Level),
                    (Level == wood -> retract(defense(User,Prev)), New is Prev + 2, asserta(defense(User,New));
                    Level == iron -> retract(defense(User,Prev)), New is Prev + 4, asserta(defense(User,New));
                    Level == diamond -> retract(defense(User,Prev)), New is Prev + 6, asserta(defense(User,New));
                    Level == legendary -> retract(defense(User,Prev)), New is Prev + 8, asserta(defense(User,New))).

downStatsar(Item) :-    class(User,Class), armorcheck(Item,Class), itemlevel(Item,Level),
                        (Level == wood -> retract(defense(User,Prev)), New is Prev - 2, asserta(defense(User,New));
                        Level == iron -> retract(defense(User,Prev)), New is Prev - 4, asserta(defense(User,New));
                        Level == diamond -> retract(defense(User,Prev)), New is Prev - 6, asserta(defense(User,New));
                        Level == legendary -> retract(defense(User,Prev)), New is Prev - 8, asserta(defense(User,New))).

/*up and down stats accessory*/
upStatsac(Item) :-  class(User,Class), accessorycheck(Item,Class), itemlevel(Item,Level),
                    (Level == wood -> retract(specialattack(User,Prev)), New is Prev + 2, asserta(specialattack(User,New));
                    Level == iron -> retract(specialattack(User,Prev)), New is Prev + 4, asserta(specialattack(User,New));
                    Level == diamond -> retract(specialattack(User,Prev)), New is Prev + 6, asserta(specialattack(User,New));
                    Level == legendary -> retract(specialattack(User,Prev)), New is Prev + 8, asserta(specialattack(User,New))).

downStatsac(Item) :-    class(User,Class), accessorycheck(Item,Class), itemlevel(Item,Level),
                        (Level == wood -> retract(specialattack(User,Prev)), New is Prev - 2, asserta(specialattack(User,New));
                        Level == iron -> retract(specialattack(User,Prev)), New is Prev - 4, asserta(specialattack(User,New));
                        Level == diamond -> retract(specialattack(User,Prev)), New is Prev - 6, asserta(specialattack(User,New));
                        Level == legendary -> retract(specialattack(User,Prev)), New is Prev - 8, asserta(specialattack(User,New))).

upPotion(Item) :-   class(User,Class), potioncheck(Item,Class),
                    (Item == health_potion -> retract(health(User,Prev,Max)), New is Prev + 5,
                    (New >= Max -> asserta(health(User,Max,Max));
                    New < Max -> asserta(health(User,New,Max)));

                    Item == big_health_potion -> retract(health(User,Prev,Max)), New is Prev + 10, 
                    (New >= Max -> asserta(health(User,Max,Max));
                    New < Max -> asserta(health(User,New,Max)));

                    Item == attack_potion -> retract(attack(User,Prev)), New is Prev + 5, asserta(attack(User,New));
                    Item == defense_potion -> retract(defense(User,Prev)), New is Prev + 5, asserta(defense(User,New))).

