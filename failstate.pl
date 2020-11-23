/* 2 contoh nanti bisa disesuaiin sama info character */
pemain(ghally,100).
pemain(riko,0).

failstate(X):- pemain(X,Y),Y is 0, write('Anda kalah!').