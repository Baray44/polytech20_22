% GSA code v1.0.
% Generated by Esmat Rashedi, 2009. 
% Adopted from: " E. Rashedi, H. Nezamabadi-pour and S. Saryazdi,
%?GSA: A Gravitational Search Algorithm?, Information sciences, vol. 179,
%no. 13, pp. 2232-2248, 2009."
%
% This function calculates Gravitational constant. eq.13.
function G=Gconstant(iteration,max_it)

  alfa=20;G0=100;
  %alfa=chaos30(10,iteration,max_it);
  G=G0*exp(-alfa*iteration/max_it); %eq. 28.
