store :-    write('WELCOME TO THE STORE!'),nl,nl,
            write('1. I want to buy!'),nl,
            write('2. I want to sell!'),nl,
            write('3. Just visiting!'),nl,nl,
            write('what do you want to do? '),read_integer(Pickshop),nl,
            (Pickshop = 1 -> buyitem,!;
            Pickshop = 2 -> sellitem,!;
            Pickshop = 3 -> write('Till next time fighter!'),nl,!).
                

cekbalance :- gold(_,Balance), write(Balance).

buyitem :-      write('---Here what i sell today---'),nl,
                write('1. Health Potion      |   25'),nl,
                write('2. Big Health Potion  |   50'),nl,
                write('3. Attack Potion      |   25'),nl,
                write('4. Defense Potion     |   25'),nl,
                write('5. Gacha              |   100'),nl,nl,
                gold(_,Balance), 
                write('Your Balance right now :'),
                write(Balance),nl,nl,

                write('Tell me what u want fighter: '), read_integer(Pickbuy),nl,
                
                (Pickbuy = 1 ->
                (Balance >= 25 -> 
                retract(gold(User,Balance)),
                New is Balance - 25,
                asserta(gold(User,New)),
                keepitem(health_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);
                
                Pickbuy = 2 ->
                (Balance >= 50 -> 
                retract(gold(User,Balance)),
                New is Balance - 50,
                asserta(gold(User,New)),
                keepitem(big_health_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);
                
                Pickbuy = 3 ->
                (Balance >= 25 -> 
                retract(gold(User,Balance)),
                New is Balance - 25,
                asserta(gold(User,New)),
                keepitem(attack_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);

                Pickbuy = 4 ->
                (Balance >= 25 -> 
                retract(gold(User,Balance)),
                New is Balance - 25,
                asserta(gold(User,New)),
                keepitem(defense_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);

                Pickbuy = 5 ->
                (Balance>=100 -> 
                retract(gold(User,Balance)),
                New is Balance - 100,
                asserta(gold(User,New)),
                gacha,nl,nl,
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!)).

sellitem :- write('Masih belum jadi pak wkkwwk').

gacha :- write('Masih belum juga pak').