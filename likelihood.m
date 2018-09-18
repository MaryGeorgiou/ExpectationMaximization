function [ l ] = likelihood( X,M,S,P,K)
%computes the likelihood
l=0;
for i=1:size(X,1)
    temp=zeros(1,K);
    for k=1:K
        gauss=0;
        for d=1:size(X,2)
           gauss=gauss+(log(2*pi*S(k,d))+((X(i,d)-M(k,d))^2)/S(k,d));
        end 
        gauss=log(P(k))-(gauss/2);
        temp(k)=gauss;
    end
     maxExp=max(temp);
     temp=temp-maxExp;
     temp=exp(temp);
     final=maxExp+log(sum(temp));
     l=l+final;
end

end

