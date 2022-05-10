w=0.1;
syms z1 z2 u1 u2 f1 f2 s1 s2 m1 m2 p1 p2;
f1 = w*((z1+u1-1)^2+(5*z1-1)^2);
f2 = (1-w)*((-5*z2-2)^2+(z2+u2-2)^2);
syms L1 L2;
L1 = f1 + m1*(s1-z1-u1) + p1*(z1 - 1/5*s2)
L2 = f2 + m2*(s2-z2-u2) + p2*(z2 + 1/5*s1)
display('Лагранжиан 1')
diff(L1,u1)
diff(L1,z1)
diff(L1,m1)
diff(L1,p1)
display('Лагранжиан 2')
diff(L2,u2)
diff(L2,z2)
diff(L2,m2)
diff(L2,p2)
