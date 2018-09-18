%Uncomment the next line and comment line 6 to use another picture.
% [ X,width,height ] = ImageTo2D('im2.jpg');
clear;
DIFFIts=[];
indexE=1;
load('final')
%Number of clusters
K=4;
%D is the Data Matrix
D=X;
[M,S,P] = initialize(K,D);
L=likelihood( D,M,S,P,K);
iteration=1;
while 1%while likelihood hasn't converged
     disp(['Iteration ' num2str(iteration)])
     Gnk = Estep( D,M,S,P,K ); %Create the responsibilities matrix
     [ M,S,P,clusters ] = Mstep( Gnk,D,K); %update the variables
     Lnew=likelihood( D,M,S,P,K); %Compute new likelihood
        disp(['diff = ' num2str(Lnew-L)]) 
        DIFFIts(indexE)=Lnew-L;
        indexE=indexE+1;
       if Lnew<L
           disp('ERROR');
           break;
       end 
       if Lnew-L<10
           disp('Convergence');
           break;
       end
       L=Lnew;
       iteration=iteration+1;
end

 error  = ImageReconstruction( M,X,clusters,K,height,width);
 disp(['Error for ',num2str(K), ' clusters is ',num2str(error)])

