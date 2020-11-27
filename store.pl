store :-    positionPlayer(_,BarisPlayer,KolomPlayer), position(store,BarisPlayer,KolomPlayer),
            write(' ____________________________'),nl,
            write('|  ________________________  |'),nl,
            write('| |                        | |'),nl,
            write('| |  WELCOME TO THE STORE! | |'),nl,
            write('| |                        | |'),nl,
            write('| |   1. I want to buy!    | | '),nl,
            write('| |                        | | '),nl,
            write('| |   2. I want to sell!   | | '),nl,
            write('| |                        | |'),nl,
            write('| |   3. Just visiting!    | |'),nl,
            write('| |________________________| |'),nl,
            write('|____________________________|'),nl,nl,
            write('what do you want to do? '),read_integer(Pickshop),nl,
            (Pickshop = 1 -> buyitem,!;
            Pickshop = 2 -> sellitem,!;
            Pickshop = 3 -> write('Till next time fighter!'),nl,!).

store :-    positionPlayer(_,BarisPlayer,KolomPlayer), \+position(store,BarisPlayer,KolomPlayer),
            write('Oops, You are not in the store. Move in to the symbol \'S\' of map to access store!'),!.

cekbalance :- gold(_,Balance), write(Balance).

buyitem :-      write('|----- Here what i sell today -----'),nl,
                write('|No.| Item name          | Price |'),nl,
                write('|1. | Health Potion      |   25  |'),nl,
                write('|2. | Big Health Potion  |   50  |'),nl,
                write('|3. | Attack Potion      |   25  |'),nl,
                write('|4. | Defense Potion     |   25  |'),nl,
                write('|5. | Gacha              |  100  |'),nl,nl,
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

sellitem :- write('Your bag contains : '), nl, nl,
            forall((cekBag(Item)), 
            (banyakitem(Item, Count), 
            write(Item), 
            write(' : '), 
            write(Count), nl)), nl,
            write('What do you want to sell? '), read(Sell),nl,
            
            (cekBag(Sell) -> 
            (hargaitem20(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 20,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('20 gold has already been added!'),!);

            hargaitem40(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 40,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('40 gold has already been added!'),!);

            hargaitem25(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 25,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('25 gold has already been added!'),!);

            hargaitem50(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 50,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('50 gold has already been added!'),!);

            hargaitem100(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 100,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('100 gold has already been added!'),!);

            hargaitem200(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 200,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('200 gold has already been added!'),!));

            write('You don\'t even have that item!'),nl,!).

gacha :-    random(1,100,R),nl,
            (R =< 50 -> randomwood;
            R =< 75 -> randomiron;
            R =< 90 -> randomdiamond;
            R =< 100 -> randomlegendary
            ).


randomwood :-   random(1,100,R),nl,
                (R =< 20 -> keepitem(wooden_sword);
                R =< 40 -> keepitem(wooden_bow);
                R =< 60 -> keepitem(wooden_staff);
                R =< 80 -> keepitem(wooden_armor);
                R =< 100 -> keepitem(wooden_ring)
                ),nl,
                write('                         _ '),nl,
                write('                        | |'),nl,
                write('__      _____   ___   __| |'),nl,
                write('\\ \\ /\\ / / _ \\ / _ \\ / _` |'),nl,
                write(' \\ V  V / (_) | (_) | (_| |'),nl,
                write('  \\_/\\_/ \\___/ \\___/ \\__,_|'),nl,nl,
                write('You just got wood level item!').

randomiron :-   random(1,100,R),nl,
                (R =< 20 -> keepitem(iron_sword);
                R =< 40 -> keepitem(iron_bow);
                R =< 60 -> keepitem(iron_staff);
                R =< 80 -> keepitem(iron_armor);
                R =< 100 -> keepitem(iron_ring)
                ),nl,
                write(' _ '),nl,                
                write('(_)      '),nl,          
                write(' _ _ __ ___  _ __  '),nl,
                write('| |  __/ _ \\|  _ \\ '),nl,
                write('| | | | (_) | | | |'),nl,
                write('|_|_|  \\___/|_| |_|'),nl,nl,
                write('You just got iron level item!').

randomdiamond :-    random(1,100,R),nl,
                    (R =< 20 -> keepitem(diamond_sword);
                    R =< 40 -> keepitem(diamond_bow);
                    R =< 60 -> keepitem(diamond_staff);
                    R =< 80 -> keepitem(diamond_armor);
                    R =< 100 -> keepitem(diamond_ring)
                    ),nl,
                    write('     _ _                                 _ '),nl,
                    write('    | (_)                               | |'),nl,
                    write('  __| |_  __ _ _ __ ___   ___  _ __   __| |'),nl,
                    write(' / _  | |/ _  |  _   _ \\ / _ \\|  _ \\ / _  |'),nl,
                    write('| (_| | | (_| | | | | | | (_) | | | | (_| |'),nl,
                    write(' \\__,_|_|\\__,_|_| |_| |_|\\___/|_| |_|\\__,_|'),nl,nl,
                    write('You just got diamond level item!').

randomlegendary :-  random(1,100,R),nl,
                    (R =< 20 -> keepitem(legendary_sword);
                    R =< 40 -> keepitem(legendary_bow);
                    R =< 60 -> keepitem(legendary_staff);
                    R =< 80 -> keepitem(legendary_armor);
                    R =< 100 -> keepitem(legendary_ring)
                    ),nl, 
                    write(' _                           _                  '),nl,
                    write('| |                         | |                 '),nl,
                    write('| | ___  __ _  ___ _ __   __| | __ _ _ __ _   _ '),nl,
                    write('| |/ _ \\/ _  |/ _ \\  _ \\ / _  |/ _  |  __| | | |'),nl,
                    write('| |  __/ (_| |  __/ | | | (_| | (_| | |  | |_| |'),nl,
                    write('|_|\\___|\\__, |\\___|_| |_|\\__,_|\\__,_|_|   \\__, |'),nl,
                    write('         __/ |                             __/ |'),nl,
                    write('        |___/                             |___/ '),nl,nl,
                    write('You just got legendary level item!').

