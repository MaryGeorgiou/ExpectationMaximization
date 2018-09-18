function [ Mnew,Snew,Pnew,clusters ] = Mstep( Gnk,X,K)
%Mstep
%compute Nk for every cluster
clustersPopulation=zeros(1,K);
clusters=ones(1,size(X,1));

for k=1:K
    %compute new means
    if sum(Gnk(:,k))~=0
        Mnew(k,:)=(Gnk(:,k)'*X)/sum(Gnk(:,k));
    else
        disp('zero probabilities in responsibilities matrix')
    end
    Pnew(k)=sum(Gnk(:,k))/size(X,1);
end

for k=1:k
    for d=1:size(X,2)
        Snew(k,d)=(Gnk(:,k)'*((X(:,d)-Mnew(k,d)).^2))/sum(Gnk(:,k));
        if(Snew(k,d)<0.01)
            Snew(k,d)=0.01;
        end
    end
end
% Mnew
% Snew
% Pnew
for i=1:size(X,1)
    [value, location] = max(Gnk(i,:));
    clusters(i)=location;
    clustersPopulation(location)=clustersPopulation(location)+1;
end
end

