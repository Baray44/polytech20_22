function [X] = initialize_f12(P_no,d,BM)

X = zeros(P_no,d);

for i=1:d
    aux    = BM(i,:);
    xi     = unifrnd(aux(1),aux(2),P_no,1);
    X(:,i) = xi;
end

end

