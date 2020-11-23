:- include('character.pl').
:- include('inventory.pl').
:- include('items.pl').

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
            write('3. Mage'),nl,nl,

            write('Choose wisely: '), read_integer(Pickclass), nl,

            (Pickclass = 1 -> createswordsman(Username),nl,
            write('You have become a Swordsman'),nl ;
            Pickclass = 2 -> createarcher(Username),
            write('You have become a Archer'),nl ;
            Pickclass = 3 -> createmage(Username),
            write('You have become a Mage'),nl).

stats    :- class(Username,_),
            checkstats(Username),!.

bag :-  write('Your bag contains : '), nl, nl,
        forall((cekBag(Item)), 
        (banyakitem(Item, Count), 
        write(Item), 
        write(' : '), 
        write(Count), nl)), nl.

help :-     write('These are the command you can use in your game : '),nl,nl,
            write('- write stats. to see your stats'),nl,
            write('- write bag. to check your inventory'),nl,
            write('----nanti ditambahin lagi help nya----'),!.

