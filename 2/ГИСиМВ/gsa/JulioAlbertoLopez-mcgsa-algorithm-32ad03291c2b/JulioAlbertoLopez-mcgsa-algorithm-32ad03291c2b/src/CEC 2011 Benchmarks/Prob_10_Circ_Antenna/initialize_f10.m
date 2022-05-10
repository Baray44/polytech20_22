function [X] = initialize_f10(P_no,d,lb1, ub1, lb2, ub2)

X   = zeros(P_no,d);

aux = d/2; 

X1               = unifrnd(lb1, ub1, P_no, aux);
X(:,1:aux)       = X1; 

X2               = unifrnd(lb2, ub2, P_no, aux);
X(:,aux+1:aux*2) = X2;

end

