clc
clear all

%

 K0=input('\nK0 : '); J0=input('\nJ0 : ');  Tc=input('\nTc : '); 
 ThickRatio=input('\nThickness Ratio(a/h) : '); 
 Pindex=input('\nPower low index : '); 
 BCs=menu('Boundary Conditions : ','CCCC','SCSC','SSSC','SSSS','SFSC','SFSS','CFCF','SFSF');
 LOADtype=menu('LOAD TYPE : ','uniform','linear','Non-Linear');

 
 X=[K0,J0,Tc,ThickRatio,Pindex,BCs,LOADtype]

% X1=[0	0	300	100	0	1	1];
% X2=[0	0	1500	100	0	1	1];
% X3=[0	0	300	50	2	1	1];
% X4=[1000	1000	800	25	1	4	1];
% X=[X1;X2;X3;X4];

tic
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
Y = cellfun(@exp, normalized_Y)
toc
