
function S0 = filtro(A0,A1,A2,A3,A4,A5,A6,A7)

VP9 =  [0	0	0	1	0	0	0	0;
        -2	5	-13	125	17	-6	3	-1;
        -4	9	-20	115	37	-13	6	-2;
        -4	10	-24	100	59	-19	9	-3;
        -4	11	-23	80	80	-23	11	-4;
        -3	9	-19	59	100	-24	10	-4;
        -2	6	-13	37	115	-20	9	-4;
        -1	3	-6	17	125	-13	5	-2; ];
    
    
    entradas(1)=A0;
    entradas(2)=A1;
    entradas(3)=A2;
    entradas(4)=A3;
    entradas(5)=A4;
    entradas(6)=A5;
    entradas(7)=A6;
    entradas(8)=A7;
    

    S0(1) = VP9(1,:)*entradas';
    S0(2) = VP9(2,:)*entradas';
    S0(3) = VP9(3,:)*entradas';
    S0(4) = VP9(4,:)*entradas';
    S0(5) = VP9(5,:)*entradas';
    S0(6) = VP9(6,:)*entradas';
    S0(7) = VP9(7,:)*entradas';
    S0(8) = VP9(8,:)*entradas';
 
end 
    
    
    