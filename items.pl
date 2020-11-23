
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

accesorycheck(wooden_ring,swordsman).
accesorycheck(wooden_ring,archer).
accesorycheck(wooden_ring,sorcerer).

accesorycheck(iron_ring,swordsman).
accesorycheck(iron_ring,archer).
accesorycheck(iron_ring,sorcerer).

accesorycheck(diamond_ring,swordsman).
accesorycheck(diamond_ring,archer).
accesorycheck(diamond_ring,sorcerer).

accesorycheck(legendary_ring,swordsman).
accesorycheck(legendary_ring,archer).
accesorycheck(legendary_ring,sorcerer).

potioncheck(health_potion, Class) :- isClass(Class).
potioncheck(big_health_potion,Class):- isClass(Class).
potioncheck(attack_potion,Class) :- isClass(Class).
potioncheck(defense_potion,Class) :- isClass(Class).

:- dynamic(equipWpn/1).
:- dynamic(equipArm/1).
:- dynamic(equipAcc/1).

useWeapon(Item) :-  (cekBag(Item), weaponcheck(Item,Class),
                    class(_,Class) -> (equipWpn(used), used\== none -> unuseWeapon(_);
                    retract(equipWpn(none))),
                    asserta(equipWpn(Item)),
                    
                    retract(stored(Item,X)),
                    Y is X-1, 
                    asserta(stored(Item,Y)),

                    retract(bagspace(Prev)),
                    New is Prev - 1,
                    asserta(bagspace(New)),

                    write('Item equipped!'),nl;

                    \+(cekBag(Item)) -> write('You don\'t have this item'),nl;

                    write('This item not suit you!'),nl).
                    
                    /*belum kasih stat kedalam item nya */

unuseWeapon(Item) :-    (equipWpn(Item), /* belum turunin stat dari item */
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

                        write(' Item unequipped!'), nl;
                        write('???? You don\'t even wear it ???'), nl). 


useArmor(Item) :-   (cekBag(Item), armorcheck(Item,Class),
                    class(_,Class) -> (equipArm(used), used\== none -> unuseArmor(_);
                    retract(equipArm(none))),
                    asserta(equipArm(Item)),
                    
                    retract(stored(Item,X)),
                    Y is X-1, 
                    asserta(stored(Item,Y)),

                    retract(bagspace(Prev)),
                    New is Prev - 1,
                    asserta(bagspace(New)),

                    write('Item equipped!'),nl;

                    \+(cekBag(Item)) -> write('You don\'t have this item'),nl;

                    write('This item not suit you!'),nl).
                    
                    /*belum kasih stat kedalam item nya */

unuseArmor(Item) :-     (equipArm(Item), /* belum turunin stat dari item */
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

                        write(' Item unequipped!'), nl;
                        write('???? You don\'t even wear it ???'), nl). 

useAccesory(Item) :-    (cekBag(Item), accesorycheck(Item,Class),
                        class(_,Class) -> (equipArm(used), used\== none -> unuseAccesory(_);
                        retract(equipArm(none))),
                        asserta(equipArm(Item)),
                        
                        retract(stored(Item,X)),
                        Y is X-1, 
                        asserta(stored(Item,Y)),

                        retract(bagspace(Prev)),
                        New is Prev - 1,
                        asserta(bagspace(New)),

                        write('Item equipped!'),nl;

                        \+(cekBag(Item)) -> write('You don\'t have this item'),nl;

                        write('This item not suit you!'),nl).
                        
                        /*belum kasih stat kedalam item nya */

unuseAccesory(Item) :-  (equipArm(Item), /* belum turunin stat dari item */
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

                        write(' Item unequipped!'), nl;
                        write('???? You don\'t even wear it ???'), nl). 
                        