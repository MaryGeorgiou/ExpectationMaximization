function [ X,width,height ] = ImageTo2D( Dir)
%loads an image and turns it into 2D double matrix
newIm=imread(Dir);
X=[];
index=1;
for i=1:size(newIm,1)
    for j=1:size(newIm,2)
    X(index,:)=newIm(i,j,:);
    index=index+1;
    end
end
height=size(newIm,1);
width=size(newIm,2);
end

