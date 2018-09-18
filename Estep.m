function [ Gnk] = Estep( X,M,S,P,K )
%evaluates responsibilities
Gnk=zeros(size(X,1),K);
for i=1:size(X,1)
    responsibilities=zeros(1,K);
     for k=1:K
        gauss=0;
        for d=1:size(X,2)
           gauss=gauss+(log(2*pi*S(k,d))+((X(i,d)-M(k,d))^2)/S(k,d));
        end 
        gauss=log(P(k))-(gauss/2);
        responsibilities(k)=gauss;
     end
     maxExp=max(responsibilities);
     responsibilities=responsibilities-maxExp;
     responsibilities=exp(responsibilities);
     denominator=sum(responsibilities);
     responsibilities=responsibilities/denominator;
     Gnk(i,:)=responsibilities;
end
end

