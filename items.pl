
weaponcheck(wooden_sword, swordsman).
weaponcheck(iron_sword, swordsman).
weaponcheck(diamond_sword, swordsman).
weaponcheck(legendary_sword, swordsman).

weaponcheck(wooden_bow, archer).
weaponcheck(iron_bow, archer).
weaponcheck(diamond_bow, archer).
weaponcheck(legendary_bow, archer).

weaponcheck(wooden_staff, mage).
weaponcheck(iron_staff, mage).
weaponcheck(diamond_staff, mage).
weaponcheck(legendary_staff, mage).

armorcheck(wooden_armor,swordsman).
armorcheck(wooden_armor,archer).
armorcheck(wooden_armor,mage).

armorcheck(iron_armor,swordsman).
armorcheck(iron_armor,archer).
armorcheck(iron_armor,mage).

armorcheck(diamond_armor,swordsman).
armorcheck(diamond_armor,archer).
armorcheck(diamond_armor,mage).

armorcheck(legendary_armor,swordsman).
armorcheck(legendary_armor,archer).
armorcheck(legendary_armor,mage).


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
                        inventory(Used), Used < 100,
                        retract(equipWpn(Item)), 
                        
                        retract(bagspace(Used)),
                        NewUsed is Used + 1, 
                        asserta(bagspace(NewUsed)),

                        write(Item), write(' Item unequipped!'), nl;
                        write('???? You don\'t even wear it ???'), nl). 

