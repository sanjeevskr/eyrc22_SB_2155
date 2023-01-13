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
