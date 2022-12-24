// SB : Task 1 B : Finite State Machine
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a Finite State Machine.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
			Do not make any changes to Test_Bench_Vector.txt file. Violating will result into Disqualification.
-------------------
*/

//Finite State Machine design
//Inputs  : I (4 bit) and CLK (clock)
//Output  : Y (Y = 1 when 102210 sequence(decimal number sequence) is detected)

//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
module fsm(
	input CLK,			  //Clock
	input [3:0]I,       //INPUT I
	output	  Y		  //OUTPUT Y
);

reg Y1 = 0;
assign Y = Y1;



////////////////////////WRITE YOUR CODE FROM HERE//////////////////// 
	

parameter S0=4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011, S4=4'b0100, S5=4'b0101,S6=4'b0110;
reg [3:0]nextState;
initial 
begin
	nextState=S0;
end	
always @(posedge CLK)
    begin

            case(nextState)
                S0:
                    begin
                    if(I==4'b0001)
                        begin
                        nextState=S1;
                        Y1=0;
                        end
                    else
                        begin
                        nextState=S0;
                        Y1=0;
                        end
                    end
                S1:
                    begin
                    if(I==4'b0000)
                        begin
                        nextState=S2;
                        Y1=0;
                        end
                    else
                        begin
                        nextState=S0;
                        Y1=0;
                        end
                    end
                S2:
                    begin
                    if(I==4'b0010)
                        begin
                        nextState=S3;
                        Y1=0;
                        end
                    else
                        begin
                        nextState=S0;
                        Y1=0;
                        end
                    end
                S3:
                    begin
                    if(I==4'b0010)
                        begin
                        nextState=S4;
                        Y1=0;
                        end
                    else
                        begin
                        nextState=S0;
                        Y1=0;
                        end
                    end
                S4:
                    begin
                    if(I==4'b0001)
                        begin
                        nextState=S5;
                        Y1=0;
                        end
                    else
                        begin
                        nextState=S0;
                        Y1=0;
                        end
                    end
                S5:
                    begin
                    if(I==4'b0000)
                        begin
                        nextState=S6;
                        Y1=1;
                        end
                    else
                        begin
                        nextState=S0;
                        Y1=0;
								end
                    end
					S6:
						begin
						if(I==4'b0010)
						begin
						nextState=S3;
						Y1=0;
						end
						else
						begin
						nextState=S0;
						Y1=0;
						end
						end  
            endcase
           end

////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////