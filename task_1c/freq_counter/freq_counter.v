// SB : Task 1C Frequency Counter
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design 2:1 Multiplexer.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
Do not make any changes to Test_Bench_Vector.txt file. Violating will result into Disqualification.
-------------------
*/

//Freq Counter design
//Inputs	: clk & ip_sig (input signal)
//Output	: count (8 bits)

//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
module freq_counter(
	input clk,
	input ip_sig,

	output reg [7:0] count = 0
);


////////////////////////WRITE YOUR CODE FROM HERE//////////////////// 
	
//////module counter(
//////
//////input rst,
//////input clk,
//////
//////output [31:0] countout
////////output [31:0] count
//////);
////
//////wire rst=ip_sig;
//////wire clk;
////reg [7:0] countout=8'b00000000;
//////initial
//////	begin
//////		countout=8'b00000000;
//////	end	
//////reg [7:0] countout=8'b00000000;
//////reg [7:0] count=0; 
////
////always @ (posedge clk )
////    begin
////		if(clk)
////		begin
////        countout = countout + 8'b00000001;
////		end
//////		if(!ip_sig)
//////		begin
//////			countout = 8'b00000000;
//////		end
////    end
////
////always @ (negedge ip_sig , posedge clk )
////    begin
////		if(!ip_sig)
////			begin
////				if(clk)
////				begin
////					count = countout;
////				end
////		  end
//////		else  
//////	     count = 0;
////    end
////
//////always @ ( negedge ip_sig )
//////    begin
//////			countout = 8'b00000000;
//////    end
//////endmodule
//
//
//
//
//
//
//
//
////module counter(
////
////input rst,
////input clk,
////
////output [31:0] countout
//////output [31:0] count
////);
//
//reg rst=0;
////wire clk;
//
////reg [7:0] count=0;
//reg [7:0] temp=0; 
//
//always @ (posedge clk,posedge ip_sig)
//    begin
//		if(clk)
//		begin
//		if(rst)
//        temp = temp + 8'b00000001;
//		else
//			temp=8'b00000000;
//		end
//		if(ip_sig)
//		begin
//			if(rst)
//			rst=0;
////			count=temp;
//		end
//		if(clk)
//		begin
//			if(!ip_sig)
//			begin
//			if(!rst)
//			begin
//				rst=1;
//			end
//			count=temp;
//			end
//		end
//		
//    end
//
////always @ ( posedge rst )
////    begin
////        count = temp;
////    end
////
////always @ ( negedge rst )
////    begin
////        temp = 0;
////    end
////endmodule	
reg [7:0] temp = 0;
always@(posedge clk)
begin
  if(ip_sig)
   temp = temp + 1;
  else
  begin
	if(temp!=0)
	begin
   count = temp;
	temp=0;
	end
  end
end	

////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////
