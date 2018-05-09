function [y,relation,coeff,explained]=pcamatrix(a,rain,t,tag1,tag2,yuzhi,tag3)       
%ͨ��pcaת�����룬a����������rain�ǽ�ˮ��t�Ǳ���ʱ�䣬tag1��־����Լ����Ƿ�ȡ�н�ˮ��
%tag2��־��3Сʱѵ������1Сʱѵ����yuzhi��ʾ��ˮ��ֵ��tag3=1��ʾ�н�ˮ
relation=relationf(a,rain,t,tag1,tag2,yuzhi);
[mr,nr]=size(relation);
[m,n]=size(a);
a1=meanzhou(a,t,tag2);
if(tag3==1)
    matrix=relationmatrix(a1,rain,relation,0);
    corr=cov(matrix);
    [coeff,latent,explained]=pcacov(corr);
else
    matrix=relationmatrix(a1,rain,relation,-0.1);
    corr=cov(matrix);
    [coeff,latent,explained]=pcacov(corr);
end
sum=0;
matrix1=relationmatrix(a1,rain,relation,-0.1);
[mm,nn]=size(matrix1);
for i=1:1:nn
    sum=sum+explained(i,1);
    if(sum>=99.99)
        break;
    end
end
rol=i;
y=zeros(mm,rol);
for j=1:1:rol
    for k=1:1:mm
        y(k,j)=matrix1(k,:)*coeff(:,j);
    end
end

