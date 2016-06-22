//Example using Aeq and beq

H = [1 -1; -1 2]; 
f = [-2; -6];
intcon = [1];
A = [1 1; -1 2; 2 1];
b = [2; 2; 3];
Aeq=[1,1];
beq=[0];
lb=[0,0];
ub=[%inf, %inf];

path = get_absolute_file_path('example8.sce');

[xopt,fopt,status,output]=intqpipopt(H,f,intcon,A,b,Aeq,beq,lb,ub,[0 0], [path + '/bonmin.opt'])

clear path;

// "bonmin.opt" contains bonmin file options
// Current options enables printing output to the terminal which can be used for debugging and other purposes.
// For more details visit their website http://coin-or.org/Bonmin