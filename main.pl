:- include('character.pl').

mainmenu :- write ('1. start'),nl,
            write ('2. Quit'),nl,nl,
            write ('Please pick what you want to do fighter! : '), read_integer(pick),

            (pick = 1 -> write("Let's start the journey!"), nl, start, !;
            pick = 2 -> write("Till next time fighter!"),nl, !).

start :-    write("Please tell me your name fighter : "), read(username), nl,
            write("This is the class that you can choose: "),nl, 
            write("1. Swordsman"),nl,
            write("2. Archer"),nl,
            write("3. Mage"),nl,nl,

            write("Choose wisely: "), read_integer(pickclass), nl,

            (pickclass = 1 -> createswordsman(username),
            write ("You have become a Swordsman"),nl ;
            pickclass = 2 -> createarcher(username),
            write ("You have become a Swordsman"),nl ;
            pickclass = 2 -> createmage(username),
            write ("You have become a Swordsman"),nl).