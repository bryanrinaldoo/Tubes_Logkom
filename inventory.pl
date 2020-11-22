:- dynamic(space/1).
inventory(X) :- space(X).


:- dynamic(stored/2).
cekInvent(X) :- stored(X,Y), Y > 0.


initinventorysword :-   assert(space(6)),
                        assert(weapon(none)),
                        assert(armor(none)),
                        assert(stored(health_potion, 5)),
                        assert(stored(wooden, 1)),