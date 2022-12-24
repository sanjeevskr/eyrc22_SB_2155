// SB : Task 2 B : UART
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design UART Transmitter.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//UART Transmitter design
//Input   : clk_50M : 50 MHz clock
//Output  : tx : UART transmit output

//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
module uart(
	input clk_50M,	//50 MHz clock
	output tx		//UART transmit output
);
////////////////////////WRITE YOUR CODE FROM HERE////////////////////

//
////module Uart8Transmitter (
////    input  wire       clk,   // baud rate
////    input  wire       en,
////    input  wire       start, // start of transaction
////    input  wire [7:0] in,    // data to transmit
////    output reg        out,   // tx
////    output reg        done,  // end on transaction
////    output reg        busy   // transaction is in process
////);
////    reg [2:0] state  = `RESET;
////    reg [7:0] data   = 8'b0; // to store a copy of input data
////    reg [2:0] bitIdx = 3'b0; // for 8-bit data
////    reg [2:0] idx;
////
////    assign idx = bitIdx;
//
//parameter S0= 8'b11001010;
//parameter B= 8'b01000010;
//parameter five=8'b10100000;
//reg [31:0]count=0;
//reg [31:0]allInoOne=32'b11001010010000101010000010100000;
//reg ok=0;
//assign tx=ok;
//integer i;
//////always @(posedge clk_50M)
//////begin
//////	case(state)
//////	s : begin
//////	state = 
//////	
//////end
////
////parameter S0=4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011, S4=4'b0100, S5=4'b0101,S6=4'b0110;
//reg [3:0]nextState;
//initial 
//begin
//	nextState=S0;
//end	
////always @(posedge clk_50M)
////    begin
////
////	 
////	 if(count<435)
////	 begin
////	 count=count+1;
////	 case(nextState)begin
////		 S0:
////			  begin
////			  ok=allInOne[0];
////			  end
//////		 S1:
//////			  begin
//////
//////			  end
////		endcase
////     end
////
////	 end
////	 else
////	 begin
////	 count=0;
////	 end
////	 end
// 
//
////    always @(posedge clk) begin
////        case (state)
////            default     : begin
////                state   <= `IDLE;
////            end
////            `IDLE       : begin
////                out     <= 1'b1; // drive line high for idle
////                done    <= 1'b0;
////                busy    <= 1'b0;
////                bitIdx  <= 3'b0;
////                data    <= 8'b0;
////                if (start & en) begin
////                    data    <= in; // save a copy of input data
////                    state   <= `START_BIT;
////                end
////            end
////            `START_BIT  : begin
////                out     <= 1'b0; // send start bit (low)
////                busy    <= 1'b1;
////                state   <= `DATA_BITS;
////            end
////            `DATA_BITS  : begin // Wait 8 clock cycles for data bits to be sent
////                out     <= data[idx];
////                if (&bitIdx) begin
////                    bitIdx  <= 3'b0;
////                    state   <= `STOP_BIT;
////                end else begin
////                    bitIdx  <= bitIdx + 1'b1;
////                end
////            end
////            `STOP_BIT   : begin // Send out Stop bit (high)
////                done    <= 1'b1;
////                data    <= 8'b0;
////                state   <= `IDLE;
////            end
////        endcase
////    end
//
////endmodule
//

//reg [63:0] arr=64'b01100101011001000010110101000001101010000011;
//integer count=0;
//integer index=0;
//reg tx_dup;
//initial
//begin
// tx_dup=1;
//end
//assign tx=tx_dup;
//
//always @(posedge clk_50M)
//begin
//   count = count + 1;
//	if(count<435)
//	begin
//	    tx_dup=arr;
//	end
//	else
//	begin
//		count=0;
//		index=index+1;
//	end
//end


reg [5:0] bitpos;
reg [31:0] arr;
reg sample;
assign tx = sample;
reg [9:0] count;
reg [11:0] count2;
initial
begin
 count = 10'b0;
 count2 = 12'b0;
 arr[0] = 1'b1;
 arr[1] = 1'b1;
 arr[2] = 1'b0;
 arr[3] = 1'b0;
 arr[4] = 1'b1;
 arr[5] = 1'b0;
 arr[6] = 1'b1;
 arr[7] = 1'b0;
 arr[8] = 1'b0;
 arr[9] = 1'b1;
 arr[10] = 1'b0;
 arr[11] = 1'b0;
 arr[12] = 1'b0;
 arr[13] = 1'b0;
 arr[14] = 1'b1;
 arr[15] = 1'b0;
 arr[16] = 1'b1;
 arr[17] = 1'b0;
 arr[18] = 1'b1;
 arr[19] = 1'b0;
 arr[20] = 1'b1;
 arr[21] = 1'b1;
 arr[22] = 1'b0;
 arr[23] = 1'b0;
 arr[24] = 1'b1;
 arr[25] = 1'b0;
 arr[26] = 1'b1;
 arr[27] = 1'b0;
 arr[28] = 1'b1;
 arr[29] = 1'b1;
 arr[30] = 1'b0;
 arr[31] = 1'b0;
 sample = 1'b1;
 bitpos = 6'b0;
end

parameter STATE_IDLE = 2'b00;
parameter STATE_START = 2'b01;
parameter STATE_DATA = 2'b10;
parameter STATE_STOP = 2'b11;
reg [1:0] state = STATE_IDLE;

always @(posedge clk_50M) begin
   count=count+1;
	case(state)
     STATE_IDLE: begin
	  if(count<434) begin
	   sample = 1'b1;
	  end
	  else begin
	    state = STATE_START;
		 count = 10'b0;
	  end
	 end
		 
	  STATE_START :begin
	  if(count<434) begin
		 sample = 1'b0;
	  end
	  else begin
	    state = STATE_DATA;
		 count = 10'b0;
	  end
	 end
	 
	 STATE_DATA :begin
	   count2 = count2+1;
	   if(count2>=3472) begin
	      state = STATE_STOP;
			count2 = 0;
			bitpos = bitpos+1;
			count = 0;
		end
	   else if(count<434) begin
		 sample = arr[bitpos];
		end
		else if(count>=434) begin
		 bitpos = bitpos+1;
		 count = 10'b0;
		end
	 end		   
	 
	 STATE_STOP: begin
	  if(bitpos==32) begin
	   sample = 1'b1;
	  end
	  else if(count<868) begin
	   sample = 1'b1;
	  end
	  else if(count>=868) begin
		state = STATE_START;
		count = 0;
	  end
	 end
	 endcase
end
////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////