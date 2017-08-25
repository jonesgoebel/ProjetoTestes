classdef interpolador < matlab.System
   
    properties(Access = private)
    r1,r2,r3,r4,r5,r6,r7,r8;
	aux,E;
	SADreg,SADi,MVXi,MVYi,result;
	
	estado;
	contador;
	READY;
    
    end

    methods(Access = public)
        function createReg(obj)
			obj.r1 = zeros(8);	
			obj.r2 = zeros(8);	
			obj.r3 = zeros(8);	
			obj.r4 = zeros(8);	
			obj.r5 = zeros(8);	
			obj.r6 = zeros(8);	
			obj.r7 = zeros(8);	
			obj.r8 = zeros(8);	
			obj.aux=zeros(8);
			obj.E=0;
			
			obj.estado=0;
			obj.contador=0;	
			
			
			obj.SADi=0;
			obj.MVXi=0;
			obj.MVYi=0;	
			obj.result=zeros(8,1);
			obj.SADreg = zeros(8);	
		end
		
		
		function [LOAD_A,LOAD_B,READY,MVX,MVY,SAD] = FME(obj,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,B1,B2,B3,B4,B5,B6,B7)
		
			[READY,LOAD_A,LOAD_B,ENABLE_RI,SELETOR,RESET_SAD,ENABLE_SAD,RESET_BEST_SAD] = controle(obj);
			[S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63] = computerInterpolador(obj,ENABLE_RI,SELETOR,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14);
			
			%disp([ENABLE_RI,SELETOR])
			%disp([A0,A1,A2,A3,A4,A5,A6,A7])
			%disp([S0,S1,S2,S3,S4,S5,S6,S7])
			%disp('')
			
			[Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7] = arvore(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63,B0,B1,B2,B3,B4,B5,B6,B7);
			[MVX,MVY,SAD] = obj.regSAD(RESET_SAD,ENABLE_SAD,SELETOR,RESET_BEST_SAD,Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7);
			
			
		end
		
        function [S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63] = computerInterpolador(obj,enable,seletor,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14)  
                
				
			%disp(enable)
			
			
			aux = obj.vertical(seletor+1);                
			
			finish = shift2(aux);
			finish(:,1)= aux(:,1);
			
			if(enable==true)	
			obj.horizontal(A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14);
			%disp([A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14])
			end	
			
			
			
			
			%disp(finish)
		
		S0 = finish(1,1);
		S1 = finish(1,2);
		S2 = finish(1,3);
		S3 = finish(1,4);
		S4 = finish(1,5);
		S5 = finish(1,6);
		S6 = finish(1,7);
		S7 = finish(1,8);
		S8 = finish(2,1);
		S9 = finish(2,2);
		S10 = finish(2,3);
		S11 = finish(2,4);
		S12 = finish(2,5);
		S13 = finish(2,6);
		S14 = finish(2,7);
		S15 = finish(2,8);
		S16 = finish(3,1);
		S17 = finish(3,2);
		S18 = finish(3,3);
		S19 = finish(3,4);
		S20 = finish(3,5);
		S21 = finish(3,6);
		S22 = finish(3,7);
		S23 = finish(3,8);
		S24 = finish(4,1);
		S25 = finish(4,2);
		S26 = finish(4,3);
		S27 = finish(4,4);
		S28 = finish(4,5);
		S29 = finish(4,6);
		S30 = finish(4,7);
		S31 = finish(4,8);
		S32 = finish(5,1);
		S33 = finish(5,2);
		S34 = finish(5,3);
		S35 = finish(5,4);
		S36 = finish(5,5);
		S37 = finish(5,6);
		S38 = finish(5,7);
		S39 = finish(5,8);
		S40 = finish(6,1);
		S41 = finish(6,2);
		S42 = finish(6,3);
		S43 = finish(6,4);
		S44 = finish(6,5);
		S45 = finish(6,6);
		S46 = finish(6,7);
		S47 = finish(6,8);
		S48 = finish(7,1);
		S49 = finish(7,2);
		S50 = finish(7,3);
		S51 = finish(7,4);
		S52 = finish(7,5);
		S53 = finish(7,6);
		S54 = finish(7,7);
		S55 = finish(7,8);
		S56 = finish(8,1);
		S57 = finish(8,2);
		S58 = finish(8,3);
		S59 = finish(8,4);
		S60 = finish(8,5);
		S61 = finish(8,6);
		S62 = finish(8,7);
		S63 = finish(8,8);
		
		
        end
	
	function [MVX,MVY,SAD] = regSAD(obj,RESET_SAD,ENABLE_SAD,seletor,RESET_BEST_SAD,A0, A1, A2, A3, A4, A5, A6, A7)
		
			aux(1)=A0;
			aux(2)=A1;
			aux(3)=A2;
			aux(4)=A3;
			aux(5)=A4;
			aux(6)=A5;
			aux(7)=A6;
			aux(8)=A7;
			
			
			SAD=obj.SADi;
			MVX=obj.MVXi;
			MVY=obj.MVYi;
		
			if RESET_SAD==1
				obj.SADreg = zeros(8);	
			else
				if ENABLE_SAD==1					
					obj.result = aux'+obj.SADreg(:,seletor+1);
					obj.SADreg(:,seletor+1) = obj.result;
				end
			end
			
			if RESET_BEST_SAD==1
				obj.SADi=65535;
				obj.MVXi=0;
				obj.MVYi=0;	
			else
				A = sort(obj.SADreg(:,seletor+1)');
				if(A(1)<obj.SADi)

					vetor=find(obj.SADreg(:,seletor+1)'==A(1));
					obj.MVXi=seletor;
					obj.MVYi=vetor(1)-1;	
					obj.SADi = A(1);
				end
				
			end
			
			
	
	end

	
	function  Resetcontrole(obj)
		obj.estado='loading';
		obj.contador=0;
		obj.READY=0;	
	end


 function [READY,LOAD_A,LOAD_B,ENABLE_RI,SELETOR,RESET_SAD,ENABLE_SAD,RESET_BEST_SAD] = controle(obj)
	READY = 0;
	LOAD_A = 0;
	LOAD_B = 0; 
	ENABLE_RI = 0;
	SELETOR = 0;
	RESET_SAD = 0;
	ENABLE_SAD = 0;
	RESET_BEST_SAD = 0;
	%obj.estado	
		
	%loading,vert_0,vert_1,vert_2,vert_3,vert_4,vert_5,vert_6,vert_7,horizontal,final	
	switch obj.estado
		case 'loading'
			LOAD_A = 1;
			LOAD_B = 0;
			ENABLE_RI = 1;
			SELETOR = 0;
			RESET_SAD = 1;
			ENABLE_SAD = 0;
			RESET_BEST_SAD = 1;						
			READY = obj.READY;
			
			if obj.contador>=6
				obj.estado = 'horizontal';
				obj.contador=0;
			else
				obj.contador=obj.contador+1;
			end
			
			
		case 'vert_0'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 0;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			obj.estado = 'vert_1';
			
		case 'vert_1'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 1;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			obj.estado = 'vert_2';	
			
		case 'vert_2'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 2;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			
			obj.estado = 'vert_3';
			
		case 'vert_3'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 3;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			obj.estado = 'vert_4';
			
		case 'vert_4'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 4;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			obj.estado = 'vert_5';	
			
		case 'vert_5'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 5;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			obj.estado = 'vert_6';
			
		case 'vert_6'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 6;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			obj.estado = 'vert_7';
			
		case 'vert_7'
			LOAD_A = 0;
			LOAD_B = 0;
			ENABLE_RI = 0;
			SELETOR = 7;
			RESET_SAD = 0;
			ENABLE_SAD = 1;
			RESET_BEST_SAD = 0;		
			
			obj.READY=0;
			READY=obj.READY;
			
			if (obj.contador>=8) 
				obj.estado = 'final';	
			else
				obj.estado = 'horizontal';	
			end
			
		case 'horizontal'
			LOAD_A = 1;
			LOAD_B = 1;
			ENABLE_RI = 1;
			SELETOR = 0;
			RESET_SAD = 0;
			ENABLE_SAD = 0;
			RESET_BEST_SAD = 1;		
			
			obj.READY=0;
			READY=obj.READY;

			obj.contador = obj.contador+1;
			obj.estado = 'vert_0';
			
		case 'final'
			LOAD_A = 1;
			LOAD_B = 0;
			ENABLE_RI = 1;
			SELETOR = 0;
			RESET_SAD = 0;
			ENABLE_SAD = 0;
			RESET_BEST_SAD = 0;		
			
			
			obj.READY=1;
			READY=obj.READY;
			
			obj.estado= 'loading';
			obj.contador=1;
			
			
		%otherwise
		%	disp('other value')
			end	
		end
    end
        methods(Access = private)
        
        function horizontal(obj,E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14)
            aux = zeros(8);
            aux(1,:) = filtro(E0,E1,E2,E3,E4,E5,E6,E7);
            aux(2,:) = filtro(E1,E2,E3,E4,E5,E6,E7,E8);
            aux(3,:) = filtro(E2,E3,E4,E5,E6,E7,E8,E9);
            aux(4,:) = filtro(E3,E4,E5,E6,E7,E8,E9,E10);
            aux(5,:) = filtro(E4,E5,E6,E7,E8,E9,E10,E11);
            aux(6,:) = filtro(E5,E6,E7,E8,E9,E10,E11,E12);
            aux(7,:) = filtro(E6,E7,E8,E9,E10,E11,E12,E13);
            aux(8,:) = filtro(E7,E8,E9,E10,E11,E12,E13,E14);
            
			
			
            aux2  = shift2(aux);
            aux2(:,1)= aux(:,1);
			
			%disp('t');
            %disp(aux2(1,:));
            %disp('t');
			
            %disp(aux2(:,:));
            
            obj.register(aux2);
            
        end
        
        
        
        function register(obj,reg)
			%disp(reg(1,:));
		
			obj.r1(8,:) = obj.r1(7,:);
			obj.r1(7,:) = obj.r1(6,:);
			obj.r1(6,:) = obj.r1(5,:);
			obj.r1(5,:) = obj.r1(4,:);
			obj.r1(4,:) = obj.r1(3,:);
			obj.r1(3,:) = obj.r1(2,:);
			obj.r1(2,:) = obj.r1(1,:);
			obj.r1(1,:) = reg(1,:);
			
			obj.aux(1,:) = reg(1,:);
			
			%disp(obj.r1(:,:));
           
			obj.r2(8,:)= obj.r2(7,:);
			obj.r2(7,:)= obj.r2(6,:);
			obj.r2(6,:)= obj.r2(5,:);
			obj.r2(5,:)= obj.r2(4,:);
			obj.r2(4,:)= obj.r2(3,:);
			obj.r2(3,:)= obj.r2(2,:);
			obj.r2(2,:)= obj.r2(1,:);
			obj.r2(1,:)= reg(2,:);
			
			obj.aux(2,:) = reg(2,:);
			
			
			obj.r3(8,:)= obj.r3(7,:);
			obj.r3(7,:)= obj.r3(6,:);
			obj.r3(6,:)= obj.r3(5,:);
			obj.r3(5,:)= obj.r3(4,:);
			obj.r3(4,:)= obj.r3(3,:);
			obj.r3(3,:)= obj.r3(2,:);
			obj.r3(2,:)= obj.r3(1,:);
			obj.r3(1,:)= reg(3,:);
			
			obj.aux(3,:) = reg(3,:);
			
			
			obj.r4(8,:)= obj.r4(7,:);
			obj.r4(7,:)= obj.r4(6,:);
			obj.r4(6,:)= obj.r4(5,:);
			obj.r4(5,:)= obj.r4(4,:);
			obj.r4(4,:)= obj.r4(3,:);
			obj.r4(3,:)= obj.r4(2,:);
			obj.r4(2,:)= obj.r4(1,:);
			obj.r4(1,:)= reg(4,:);
			
			obj.aux(4,:) = reg(4,:);
			
			
			obj.r5(8,:)= obj.r5(7,:);
			obj.r5(7,:)= obj.r5(6,:);
			obj.r5(6,:)= obj.r5(5,:);
			obj.r5(5,:)= obj.r5(4,:);
			obj.r5(4,:)= obj.r5(3,:);
			obj.r5(3,:)= obj.r5(2,:);
			obj.r5(2,:)= obj.r5(1,:);
			obj.r5(1,:)=  reg(5,:);
			
			obj.aux(5,:) = reg(5,:);
			
			
			obj.r6(8,:)= obj.r6(7,:);
			obj.r6(7,:)= obj.r6(6,:);
			obj.r6(6,:)= obj.r6(5,:);
			obj.r6(5,:)= obj.r6(4,:);
			obj.r6(4,:)= obj.r6(3,:);
			obj.r6(3,:)= obj.r6(2,:);
			obj.r6(2,:)= obj.r6(1,:);
			obj.r6(1,:)= reg(6,:);
			
			obj.aux(6,:) = reg(6,:);
			
			
			obj.r7(8,:)= obj.r7(7,:);
			obj.r7(7,:)= obj.r7(6,:);
			obj.r7(6,:)= obj.r7(5,:);
			obj.r7(5,:)= obj.r7(4,:);
			obj.r7(4,:)= obj.r7(3,:);
			obj.r7(3,:)= obj.r7(2,:);
			obj.r7(2,:)= obj.r7(1,:);
			obj.r7(1,:)= reg(7,:);
			
			obj.aux(7,:) = reg(7,:);
			
			
			obj.r8(8,:)= obj.r8(7,:);
			obj.r8(7,:)= obj.r8(6,:);
			obj.r8(6,:)= obj.r8(5,:);
			obj.r8(5,:)= obj.r8(4,:);
			obj.r8(4,:)= obj.r8(3,:);
			obj.r8(3,:)= obj.r8(2,:);
			obj.r8(2,:)= obj.r8(1,:);
			obj.r8(1,:)= reg(8,:);
		   
		   obj.aux(8,:) = reg(8,:);
		   
		   
        end
        
         
        
        function S = vertical(obj,seletor)
            S = zeros(8);
			
			%disp([obj.r1(8,seletor),obj.r1(7,seletor),obj.r1(6,seletor),obj.r1(5,seletor),obj.r1(4,seletor),obj.r1(3,seletor),obj.r1(2,seletor),obj.r1(1,seletor)])
			S(1,:) = filtro(obj.r1(8,seletor),obj.r1(7,seletor),obj.r1(6,seletor),obj.r1(5,seletor),obj.r1(4,seletor),obj.r1(3,seletor),obj.r1(2,seletor),obj.r1(1,seletor));
            S(2,:) = filtro(obj.r2(8,seletor),obj.r2(7,seletor),obj.r2(6,seletor),obj.r2(5,seletor),obj.r2(4,seletor),obj.r2(3,seletor),obj.r2(2,seletor),obj.r2(1,seletor));
            S(3,:) = filtro(obj.r3(8,seletor),obj.r3(7,seletor),obj.r3(6,seletor),obj.r3(5,seletor),obj.r3(4,seletor),obj.r3(3,seletor),obj.r3(2,seletor),obj.r3(1,seletor));
            S(4,:) = filtro(obj.r4(8,seletor),obj.r4(7,seletor),obj.r4(6,seletor),obj.r4(5,seletor),obj.r4(4,seletor),obj.r4(3,seletor),obj.r4(2,seletor),obj.r4(1,seletor));
            S(5,:) = filtro(obj.r5(8,seletor),obj.r5(7,seletor),obj.r5(6,seletor),obj.r5(5,seletor),obj.r5(4,seletor),obj.r5(3,seletor),obj.r5(2,seletor),obj.r5(1,seletor));
            S(6,:) = filtro(obj.r6(8,seletor),obj.r6(7,seletor),obj.r6(6,seletor),obj.r6(5,seletor),obj.r6(4,seletor),obj.r6(3,seletor),obj.r6(2,seletor),obj.r6(1,seletor));
            S(7,:) = filtro(obj.r7(8,seletor),obj.r7(7,seletor),obj.r7(6,seletor),obj.r7(5,seletor),obj.r7(4,seletor),obj.r7(3,seletor),obj.r7(2,seletor),obj.r7(1,seletor));
            S(8,:) = filtro(obj.r8(8,seletor),obj.r8(7,seletor),obj.r8(6,seletor),obj.r8(5,seletor),obj.r8(4,seletor),obj.r8(3,seletor),obj.r8(2,seletor),obj.r8(1,seletor));
			
			%disp(obj.r1(:,seletor));
			%disp(S(1,:));
        end
        
    end
end

   