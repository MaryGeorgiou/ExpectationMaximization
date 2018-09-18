function [ error,c1,c2,c3,c4 ] = ImageReconstruction( M,X,clusters,K,height,width)
%reconstructs the image (turns it fro 2D to 3D)
Xclustered=zeros(size(X,1),size(X,2));
cImage=zeros(height,width,3);

for i=1:size(X,1)
    k=clusters(i);
    Xclustered(i,:)=M(k,:);
end
    index=1;
for h=1:height
    for w=1:width
        cImage(h,w,:)= Xclustered(index,:);
       index=index+1;
    end
end
intImage= uint8(cImage);
imshow(intImage)
Xdiff=X-Xclustered;

sum=0;
for e=1:size(X,1)
    sum=sum+norm(Xdiff(e))^2;
end
error=sum/size(X,1);


end

