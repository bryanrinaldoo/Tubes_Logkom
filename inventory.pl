:- dynamic(bagspace/1).
inventory(X) :- bagspace(X).


:- dynamic(stored/2).
cekBag(X) :- stored(X,Y), Y > 0.

banyakitem(Item,Count) :- stored(Item,Count).

inventorysword :-   asserta(bagspace(6)),
                    asserta(equipWpn(none)),
                    asserta(equipArm(none)),
                    asserta(equipAcc(none)),
                    asserta(stored(health_potion, 5)),
                    asserta(stored(wooden_sword, 1)).

inventoryarcher :-  asserta(bagspace(6)),
                    asserta(equipWpn(none)),
                    asserta(equipArm(none)),
                    asserta(equipAcc(none)),
                    asserta(stored(health_potion, 5)),
                    asserta(stored(wooden_bow, 1)).

inventorysorcerer :-    asserta(bagspace(6)),
                        asserta(equipWpn(none)),
                        asserta(equipArm(none)),
                        asserta(equipAcc(none)),
                        asserta(stored(health_potion, 5)),
                        asserta(stored(wooden_staff, 1)).

keepitem(Item) :-   (bagspace(Used), Used < 100 ->
                    (stored(Item,Y) -> 
                    retract(stored(Item, Y)), 
                    Z is Y+1, 
                    asserta(stored(Item, Z)), 
                    
                    retract(bagspace(Used)), 
                    New is Used + 1, 
                    asserta(bagspace(New));
                    
                    asserta(stored(Item, 1)), 
                    
                    retract(bagspace(Used)), 
                    New is Used + 1, 
                    asserta(bagspace(New))),
                    write('Item stored!'), nl;
                    write('Your Bag already Full! Delete or  sell some item!'), nl).

deleteItem(Item) :-     (cekBag(Item) -> stored(Item, X), 
                        Y is X-1,
                        (Y == 0 -> 
                        retract(stored(Item, X)), 
                        retract(bagspace(Used)),
                        New is Used - X,
                        asserta(bagspace(New));

                        retract(stored(Item,X)),
                        asserta(stored(Item,Y)),
                        
                        retract(bagspace(Used)),
                        New is Used - 1, 
                        asserta(bagspace(New))),

                        write('Item deleted from your bag!'),nl,!;
                        write('You don\'t even have that item!'),nl).

banyakitem :- bagspace(X), write(X).
