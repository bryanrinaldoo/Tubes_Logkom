:- dynamic(space/1).
inventory(X) :- space(X).


:- dynamic(stored/2).
cekInvent(X) :- stored(X,Y), Y > 0.

inventorysword :-   asserta(bagspace(6)),
                        asserta(weapon(none)),
                        asserta(armor(none)),
                        asserta(stored(health_potion, 5)),
                        asserta(stored(wooden_sword, 1)).

inventoryarcher :-  asserta(bagspace(6)),
                        asserta(weapon(none)),
                        asserta(armor(none)),
                        asserta(stored(health_potion, 5)),
                        asserta(stored(wooden_bow, 1)).

inventorymage :-    asserta(bagspace(6)),
                        asserta(weapon(none)),
                        asserta(armor(none)),
                        asserta(stored(health_potion, 5)),
                        asserta(stored(wooden_staff, 1)).

