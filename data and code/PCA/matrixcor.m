function y=matrixcor(a)
% Э�������
[m,n]=size(a);
y=zeros(n,n);
for i=1:1:n
    for j=1:1:n
        y(i,j)=corref(a(:,i),a(:,j));
    end
end