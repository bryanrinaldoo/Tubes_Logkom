/* 2 contoh nanti bisa disesuaiin sama info character */
health(ghally,100).
health(riko,-2).

failstate(X):- health(X,Y),Y <= 0, write('Anda kalah!').