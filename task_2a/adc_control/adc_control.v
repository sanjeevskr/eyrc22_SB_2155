// SB : Task 2 A : ADC
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design ADC Controller.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//ADC Controller design
//Inputs  : clk_50 : 50 MHz clock, dout : digital output from ADC128S022 (serial 12-bit)
//Output  : adc_cs_n : Chip Select, din : Ch. address input to ADC128S022, adc_sck : 2.5 MHz ADC clock,
//				d_out_ch5, d_out_ch6, d_out_ch7 : 12-bit output of ch. 5,6 & 7,
//				data_frame : To represent 16-cycle frame (optional)

//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
module adc_control(
	input  clk_50,				//50 MHz clock
	input  dout,				//digital output from ADC128S022 (serial 12-bit)
	output adc_cs_n,			//ADC128S022 Chip Select
	output din,					//Ch. address input to ADC128S022 (serial)
	output adc_sck,			//2.5 MHz ADC clock
	output [11:0]d_out_ch5,	//12-bit output of ch. 5 (parallel)
	output [11:0]d_out_ch6,	//12-bit output of ch. 6 (parallel)
	output [11:0]d_out_ch7,	//12-bit output of ch. 7 (parallel)
	output [1:0]data_frame	//To represent 16-cycle frame (optional)
);
	
////////////////////////WRITE YOUR CODE FROM HERE////////////////////

//reg [3:0] adc_sck_temp,old_count,temp_ch;
//reg [3:0] countForSck;
//reg ttt,pos_ttt,count,count_pos;
//reg [11:0]data_dup,total_count,no_of_total_count;
//reg [11:0]dataout;
//reg clock_out;
//reg din_duplicate;
//reg ADD2,ADD1,ADD0;
//reg signal1,signal2,signal3;
//
////assign adc_cs_n=count?count_pos?0:ttt:0;
////assign adc_cs_n=count_pos?ttt:1;
//assign adc_cs_n=ttt;
//
//
//assign din=din_duplicate;
//
////assign adc_sck= adc_cs_n?1:clk_50;
//assign adc_sck= adc_sck_temp;
//
//initial
//begin
//din_duplicate=0;
//total_count=0;
//count=0;
//ttt=1;
//ADD2=1;
//ADD1=1;
//ADD0=0;
//clock_out=0;
//countForSck=0;
//count_pos=1;
////signal1=0;
////signal2=0;
////signal3=0;
//end
//
//
////always @(posedge clk_50)
////begin
////	case (count)
////	5:begin
////	din_duplicate<=ADD2;
////	end
////	6:begin
////	din_duplicate<=ADD1;
////	end
////	7:begin
////	din_duplicate<=ADD0;
////	end
////	endcase
////end
//
//
//
//
////assign d_out_ch5=signal1?dataout:0;
////assign d_out_ch6=signal2?dataout:0;
////assign d_out_ch7=signal3?dataout:0;
//
//
//
//always@(negedge clk_50)
//begin
//	
////if(temp_ch==1)
////begin
////signal1=1;
////signal2=0;
////signal3=0;
////end
////if(temp_ch==2)
////begin
//////assign d_out_ch6=dataout;
////signal2=1;
////signal1=0;
////signal3=0;
////end
////if(temp_ch==0)
////begin
//////assign d_out_ch7=dataout;
////signal3=1;
////signal2=0;
////signal1=0;
////end	
//
//
//	case (total_count)
//	36:begin
//	din_duplicate<=1;
//	temp_ch=1;
//	end
//	54:begin
//	din_duplicate<=0;
//	end
//	72:begin
//	din_duplicate<=1;
//	end
//	90:begin
//	din_duplicate<=0;
//	end
//	324:begin
//	temp_ch=2;
//	din_duplicate<=1;
//	end
//	360:begin
//	din_duplicate<=0;
//	end	
//	612:begin
//	temp_ch=0;
//	din_duplicate<=1;
//	end	
//	666:begin
//	din_duplicate<=0;
//	end	
//	endcase
////
////if(total_count==36)
////begin
////	din_duplicate=1;
////end
//
//
//
//
//
//if(total_count>890)
//begin
//ttt=1;
//end
//
//
//if(countForSck<9)
//begin
//countForSck=countForSck + 1;
//	if(countForSck==1)
//	begin
//		if(adc_sck_temp==0)
//		begin
//		adc_sck_temp<=1;
//		if(count==0)
//			begin
//				count<=1;
//				ttt=0;
//			end
//		end
//		else
//		begin
//		adc_sck_temp<=0;
//		
////			case(no_of_total_count%16)
////			3: dataout<=data_dup;
////			4:	data_dup[11]<=dout;
////			5: data_dup[10]<=dout;
////			6: data_dup[9]<=dout;
////			7: data_dup[8]<=dout;
////			8: data_dup[7]<=dout;
////			9: begin data_dup[6]<=dout;
////			clock_out<=1;
////			end
////			10: begin data_dup[5]<=dout;
////			clock_out<=0; end
////			11: data_dup[4]<=dout;
////			12: data_dup[3]<=dout;
////			13: data_dup[2]<=dout;
////			14: data_dup[1]<=dout;
////			15: data_dup[0]<=dout;
////			endcase		
////		
//		end
//	end
//end
//else
//begin
//
//total_count=total_count+countForSck;
//countForSck=0;
//no_of_total_count=no_of_total_count+1;
//
//
////if(adc_sck_temp==0)
////begin
////	if(count==0)
////			begin
////				count<=count+4'd1;
////				ttt=0;
////			end
////end
//end
//end
//
//
////
////always @(posedge clk_50)
////begin
////case(no_of_total_count%16)
////3: dataout<=data_dup;
////4:	data_dup[11]<=dout;
////5: data_dup[10]<=dout;
////6: data_dup[9]<=dout;
////7: data_dup[8]<=dout;
////8: data_dup[7]<=dout;
////9: begin data_dup[6]<=dout;
////clock_out<=1;
////end
////10: begin data_dup[5]<=dout;
////clock_out<=0; end
////11: data_dup[4]<=dout;
////12: data_dup[3]<=dout;
////13: data_dup[2]<=dout;
////14: data_dup[1]<=dout;
////15: data_dup[0]<=dout;
////endcase
////end
//
//
//
//
////module adc_interface  (
////  addr, data,
////  din, dout,
////  sclk, rst);
////
////input [1:0]    addr;
////output [11:0]  data;
////input          sclk;
////input          rst;
////input          din;
////output         dout;
////
////reg [11:0]    data;
////reg           dout;
////
////reg [3:0]     sclk_count;
////reg [1:0]     dout_addr; // We only want to select 4 of the 8 analog ports
////wire          addr_inc;
////reg  [11:0]   din_ff;
////reg  [11:0]   data_ram [0:2];
////
////assign addr_inc = (sclk_count == 4'b0001);
////
////// Handle clock counting
////always @ (posedge sclk or posedge rst)
////  if (rst) 
////    sclk_count <= 4'b0000;
////  else
////    sclk_count <= sclk_count + 1'b1;
////
/////// Handle address incrementing to cycle through reading
//////   bytes from the ADC device input pins /
////always @ (posedge addr_inc or posedge rst)
////  if (rst) 
////    dout_addr <= 2'b00;
////  else
////    dout_addr <= dout_addr + 1'b1;
////
/////// Serial DOUT, based on sclk count, send the current address bit MSB first. 
////// * Note: since we are only selecting 4 Analog ports we just have 2 bits to send
////// * during the 2nd clock cycle we went a zero by defualt. 
////// /
////always @ ()
////  case (sclk_count)
////    4'd3: dout = dout_addr[1];
////    4'd4: dout = dout_addr[0];
////    default: dout = 1'b0;
////  endcase
////
///////* DeSerialize DIN, use a shift register to move DIN into a 12 bit register during
////// * clock cycles 4 -> 15
////// /
////always @ (posedge sclk or posedge rst)
////  if (rst)
////      din_ff <= 12'd0;
////  else
////    casez (sclk_count)
////      4'b01??, 4'b1???: din_ff <= {din_ff[10:0],din};
////    endcase
////
/////// Return static ram on read interface
////// * Write shift register to static ram on first clock
////// */ 
////always @ (negedge sclk) begin
////  if (sclk_count == 4'b0000
////  ) begin
////     data_ram[dout_addr] <= din_ff;
////  end
////  data <= data_ram[addr];
////end
////
////endmodule
//
//
//always@(posedge clk_50)
//begin
////
////if(total_count>890)
////begin
//////pos_ttt=1;
////count_pos=0;
////end
////
//////if(countForSck==50)
//////begin
//////ttt=1;
//////end
////
////
////
////
////
//////
//////if(count<16)
//////begin
//////count<=count+4'd1;
//////	if(count==1)
//////	begin
//////		if(ttt==1)
//////		begin
//////		ttt=0;
//////		end
//////		else
//////		begin
//////		ttt=1;
//////		end
//////	end
//////end
//////else
//////begin
//////count=0;
//////end
//////if (count==1)
//////begin
//////ttt<=0;
//////end
//end

reg [1:0] df;
reg [4:0] count_sck,tot_clk_count;
reg sclk;
reg cs_temp;
reg din_temp;
reg ADD2,ADD1,ADD0;
reg [4:0] count1;
reg [3:0] count2;
reg [11:0]data_dup,dataout1,dataout2,dataout3,dataout;
reg signal1,signal2,signal3;
reg [3:0]temp;

assign adc_cs_n = cs_temp;
assign din = din_temp;
assign adc_sck = sclk;
assign din = din_temp;



initial
begin
	count1 = 5'b0;
	count2 = 4'b0;
	cs_temp = 1;
	sclk = 0;
	count_sck = 5'b0;
	df = 2'b0;
	din_temp=0;
	ADD2=1;
	ADD1=0;
	ADD0=1;
	signal1=0;
	signal2=0;
	signal3=0;
	temp=0;
	dataout=8'b00000000;
	dataout1=8'b00000000;
	dataout2=8'b00000000;
	dataout3=8'b00000000;
	tot_clk_count=0;
end







always@(negedge clk_50)	
 begin
  count1 = count1 + 5'b1;
  if(count1 == 20) begin
   sclk = 1;
   count1 = 0;
  end
  else if(count1 <= 10)
   sclk = 0;
  else if(count1< 20)
   sclk = 1;
 end

always@(posedge clk_50)
 begin
  count2 = count2 + 4'b1;
  if(count2==1)
   cs_temp <= 0;
	
	
//  	 if(temp==0)
//	 begin
//	 dataout3=dataout;
//	 end
//	 if(temp==1)
//	 begin
//	 dataout2=dataout;
//	 end
//	 if(temp==2)
//	 begin
//	 dataout1=dataout;
//	 end	
 end

 always@(negedge sclk) begin
  count_sck = count_sck + 5'b1;

  case(count_sck)
   1:begin
	 din_temp=0;
//	 dataout<=data_dup;
	 data_dup[0]<=dout;
	 if(tot_clk_count==3)
	 dataout3<=data_dup;
	 if(tot_clk_count==1)
	 dataout1<=data_dup;
	 if(tot_clk_count==2)
	 dataout2<=data_dup;	 
	end
	2:begin
	 din_temp=0;
	end
   3:begin
	  din_temp = ADD2;
	  
	end
	4:begin
     din_temp = ADD1;
	  
	end
	5:begin
	  din_temp = ADD0;
	  
	end
	6:begin
	 din_temp=0;
	 data_dup[11]<=dout;
	end
	7:begin
	 din_temp=0;
	 data_dup[10]<=dout;
	end
	8:begin
	 din_temp=0;
	 data_dup[9]<=dout;
	end
	9:begin
	 din_temp=0;
	 data_dup[8]<=dout;
	end
	10:begin
	 din_temp=0;
	 data_dup[7]<=dout;
	end
	11:begin
	 din_temp=0;
	 data_dup[6]<=dout;
	end
	12:begin
	 din_temp=0;
	 data_dup[5]<=dout;
	end
	13:begin
	 din_temp=0;
	 data_dup[4]<=dout;
	end
	14:begin
	 din_temp=0;
	 data_dup[3]<=dout;
	end
	15:begin
	 din_temp=0;
	 data_dup[2]<=dout;
	end
	16:begin
	data_dup[1]<=dout;
	 din_temp=0;
	 df = df + 2'b1;
	 count_sck = 5'b0;
	 tot_clk_count=tot_clk_count+1;
	 temp=temp+1;

	 
	 if(df==1) begin
	   ADD1 = 1;
		ADD0 = 0;
//	  signal3=0;
//	  signal1=0;
//	  signal2=1;		
	  end
	 if(df==2) begin
	   ADD1 = 1;
		ADD0 = 1;
//	  signal3=1;
//	  signal1=0;
//	  signal2=0;		
	  end  
//	 if(df==0)begin
////	  signal3=0;
////	  signal1=1;
////	  signal2=0;
//		end
	end
  endcase

  
end
assign d_out_ch7=(dataout>=dataout1)?dataout:dataout1;


assign d_out_ch5=(dataout>=dataout2)?dataout:dataout2;


assign d_out_ch6=(dataout>=dataout3)?dataout:dataout3;

//assign d_out_ch7=dataout1;
//
//
//assign d_out_ch5=dataout2;
//
//
//assign d_out_ch6=dataout3;
////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////