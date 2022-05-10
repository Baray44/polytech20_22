%clear tf
%w=tf([1], [1 2 -8])
w=tf([1], [1 5 6])
%w=tf([1 2], [3 4 5 3])

%pole(w)
%rlocus(w)

%pzmap(w)
%rlocus(w)
zgrid()



pzmap(w)