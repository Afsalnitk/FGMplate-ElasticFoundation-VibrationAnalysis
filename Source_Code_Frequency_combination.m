clc
clear all
tic
%
X=[];
for BCs=4:4
    K0L=[0];
    J0L=[0];
    TcL=[300 500 700 1000 1300 1400];
    ThickRatioL=[10];
    PindexL=[5];
    LOADtypeL=[1 2 3];
    for i1=1:length(K0L)
        K0=K0L(i1);
    for i2=1:length(J0L)
        J0=J0L(i2);  
    for i3=1:length(TcL)
        Tc=TcL(i3);
    for i4=1:length(ThickRatioL)
        ThickRatio=ThickRatioL(i4);
    for i5=1:length(PindexL)
        Pindex=PindexL(i5);
    for i6=1:length(LOADtypeL)
        LOADtype=LOADtypeL(i6);

            Xi=[K0,J0,Tc,ThickRatio,Pindex,BCs,LOADtype];
            X=[X;Xi];
    end
    end
    end
    end
    end
    end
end
Table_Results(:,1:7)=X;

%Max-Min Normalization
Max_Min=[100000	0
100000	0
1500	300
100	4
10	0
8	1
3	1];

for i = 1:7
    column_data = X(:, i);
    normalized_X(:, i) = (column_data -Max_Min(i,2)) / (Max_Min(i,1) - Max_Min(i,2));
end


normalized_XX=num2cell(normalized_X);
normalized_Y=MyNetworkFunction(normalized_XX');

% Compute exponential of each element
Y = cellfun(@exp, normalized_Y);

Table_Results(:,8)=Y;
toc


%% 
