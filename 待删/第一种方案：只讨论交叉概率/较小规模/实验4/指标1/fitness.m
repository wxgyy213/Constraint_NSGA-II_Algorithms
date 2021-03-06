function F=fitness(X,Index,D,time,cost,Performance) 
m=Index(end);
for i = 1:size(X,1)
    idx = floor(X(i,:));
x = zeros(1,m+1);
temp =[0,5,9,14,18,22,25,30,32,35,38,42,45,50,55,57,61,63,66,68,73,76,81,85,90,93,95,99,102];
    x(idx(idx>0)+temp) = 1;
    if (x(25)~=x(66))&&(x(25)==1)
        x(66)=1;
        x(64)=0;
        x(65)=0;
    elseif (x(25)~=x(66))&&(x(66)==1)
        x(25)=1;
        x(23)=0;
        x(24)=0;
    end
    if (x(75)~=x(106))&&(x(75)==1)
        x(106)=1;
        x(103)=0;
        x(104)=0;
        x(105)=0;
    elseif (x(75)~=x(106))&&(x(106)==1)
        x(75)=1;
        x(74)=0;
        x(76)=0;
    end
    if (x(9)~=x(61))&&(x(9)==1)
        x(61)=1;
        x(58)=0;
        x(59)=0;
        x(60)=0;
    elseif (x(9)~=x(61))&&(x(61)==1)
        x(9)=1;
        x(6)=0;
        x(7)=0;
        x(8)=0;
    end
    if (x(37)~=x(47))&&(x(37)==1)
        x(47)=1;
        x(46)=0;
        x(48)=0;
        x(49)=0;
        x(50)=0;
    elseif (x(37)~=x(47))&&(x(47)==1)
        x(37)=1;
        x(36)=0;
        x(38)=0;
    end
    if (x(62)==x(102))&&(x(62)==1)
        x(102)=0;
        x(100)=round(rand(1));
        x(101)=1-x(100);
    elseif (x(62)==x(102))&&(x(62)==0)
        x(102)=1;
        x(100)=0;
        x(101)=0;
    end
    x(end)=1;
%cost=[20;60;90;12;6;50;46;60;120;25;12;5;88;74;160;9.7;32;68;91.5;82;192;120;457;330;10;32;95;0;34;22;9.3;13;6;8;0;70;96;82;94;12;63;60;190;120;250;0;10;60;0];
%time=[4,5,7,2,3,5,4,5,8,2,1,1,4,5,8,2,3,3,5,6,8,9,2,3,4,0.0001,1,1,2,2,2,2,0.0001,22,17,18,5,2,3,1,3,2,1,0.0001,2,7,0];
%The first function 
F(i,1)=x*cost;
%The second function
nu=size(D,2);
rr=x.*time;
CC=rr(rr~=0)';
pp=repmat(CC,1,nu);
C=pp.*D;
%C=timehandle(x,A,m);
n1=size(C,2);
ST=zeros(1,n1);
  for k=2:n1
      tt=0;
      for l=1:(k-1)
          if (C(l,k)>0)&&(C(l,k))~=0.0001
              tt=[tt,C(l,k)+ST(l)];
          elseif C(l,k)==0.0001
              C(l,k)=0;
              tt=[tt,C(l,k)+ST(l)];
          end
      end
      ST(k)=max(tt);
  end
  F(i,2)=ST(n1);
%The third function
%F(i,3)=-(x*Performance-26.5234)/(56.6129-26.5234);
F(i,3)=-x*Performance;
%F(i,3)=-(x*Performance);
end
