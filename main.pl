:- include('character.pl').
:- include('inventory.pl').
:- include('items.pl').
:- include('map.pl').
:- include('store.pl').
menu :- write('WELCOME FIGHTER!'),nl,nl,
            write('1. start'),nl,
            write('2. Quit'),nl,nl,
            write('Choose what you want to do fighter! : '), read_integer(Pick),nl,

            (Pick = 1 -> write('Let\'s start the journey!'), nl, start, !;
            Pick = 2 -> write('Till next time fighter!'),nl, !).

:- dynamic(alreadystart/1).

start    :- alreadystart(_), write('You already start the journey!'), !,nl.

start    :- \+alreadystart(_), asserta(alreadystart(1)),
            write('Please tell me your name fighter : '), read(Username),nl,
            write('This is the class that you can choose: '),nl, 
            write('1. Swordsman'),nl,
            write('2. Archer'),nl,
            write('3. Sorcerer'),nl,nl,

            write('Choose wisely: '), read_integer(Pickclass), nl,

            (Pickclass = 1 -> createswordsman(Username),nl,
            write('You have become a Swordsman'),nl ;
            Pickclass = 2 -> createarcher(Username),
            write('You have become a Archer'),nl ;
            Pickclass = 3 -> createsorcerer(Username),
            write('You have become a Sorcerer'),nl).

stats    :- class(Username,_),
            checkstats(Username),!.

bag :-  write('Your bag contains : '), nl, nl,
        forall((cekBag(Item)), 
        (banyakitem(Item, Count), 
        write(Item), 
        write(' : '), 
        write(Count), nl)), nl.

help :-     alreadystart(_) ->
            write('These are the command you can use in your game : '),nl,nl,
            write('- write stats. to see your stats'),nl,
            write('- write bag. to check your inventory'),nl,
            write('- write helpequip. to check how to use item'),nl,
            write('- write map. to check where you are'),nl,
            write('----nanti ditambahin lagi help nya----'),nl,!;
            write('Start the game first fighter!').

helpequip :-    write('---This is the command you can  use : '),nl,nl,
                write('- write useWeapon(<item_name>). to equip your weapon'),nl,
                write('- write useArmor(<item_name>). to equip your weapon'),nl,
                write('- write useAccessory(<item_name>). to equip your weapon'),nl,
                write('- write usePotion(<item_name>). to use your potion'),nl.