:- dynamic(space/1).
inventory(X) :- bagspace(X).


:- dynamic(stored/2).
cekBag(X) :- stored(X,Y), Y > 0.

banyakitem(Item,Count) :- stored(Item,Count).

inventorysword :-   asserta(bagspace(6)),
                    asserta(equipWpn(none)),
                    asserta(equipArm(none)),
                    asserta(stored(health_potion, 5)),
                    asserta(stored(wooden_sword, 1)).

inventoryarcher :-  asserta(bagspace(6)),
                    asserta(equipWpn(none)),
                    asserta(equipArm(none)),
                    asserta(stored(health_potion, 5)),
                    asserta(stored(wooden_sword, 1)).

inventorymage :-    asserta(bagspace(6)),
                    asserta(equipWpn(none)),
                    asserta(equipArm(none)),
                    asserta(stored(health_potion, 5)),
                    asserta(stored(wooden_staff, 1)).

