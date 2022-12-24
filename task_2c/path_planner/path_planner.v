// SM : Task 2 C : Path Planning
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design path planner.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//Path Planner design
//Parameters : node_count : for total no. of nodes + 1 (consider an imaginary node, refer discuss forum),
//					max_edges : no. of max edges for every node.


//Inputs  	 : clk : 50 MHz clock, 
//				   start : start signal to initiate the path planning,
//				   s_node : start node,
//				   e_node : destination node.
//
//Output     : done : Path planning completed signal,
//             final_path : the final path from start to end node.



//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////

module path_planner
#(parameter node_count = 27, parameter max_edges = 4)
(
	input clk,
	input start,
	input [4:0] s_node,
	input [4:0] e_node,
	output reg done,	
	output reg [10*5-1:0] final_path
);

////////////////////////WRITE YOUR CODE FROM HERE////////////////////
reg[1:0] graph[25:0][25:0];
integer i,index,j,ii,jj,count,v,u,min,min_index,temp,clk_count,c,n,dummy;
reg[4:0] temp_arr[25:0];
reg[4:0] sptSet[25:0];
reg[4:0] distance[25:0];
reg[4:0] parent[25:0];
parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
reg[2:0] state = s0;

initial begin
for(ii=0;ii<26;ii=ii+1) begin
 for(jj=0;jj<26;jj=jj+1) begin
  graph[ii][jj] = 0;
 end
end
graph[0][1] = 3;graph[1][0] = 3;graph[1][2] = 3;graph[1][13] = 3;graph[2][1] = 3;graph[2][3] = 1;graph[2][5] = 3;graph[3][2] = 1;graph[4][6] = 3;graph[5][2] = 3;graph[5][6] = 1;graph[5][9] = 2;graph[6][4] = 3;graph[6][5] = 1;graph[6][16] = 3;graph[7][12] = 2;graph[8][9] = 1;graph[9][5] = 2;graph[9][8] = 1;graph[9][15]=1;graph[10][16] = 2;graph[11][12] = 3;graph[12][7] = 2;graph[12][11] = 3;graph[12][17] = 3;graph[12][13] = 1;graph[13][1] = 3;graph[13][12] = 1;graph[13][18] = 2;graph[14][15] = 1;graph[15][9] = 1;graph[15][14] = 1;graph[15][22] = 1;graph[16][6] = 3;graph[16][10] = 2;graph[16][23] = 2;graph[17][12] = 3;graph[18][13] = 2;graph[18][19] = 1;graph[18][20] = 1;graph[19][18] = 1;graph[20][18] = 1;graph[20][21] = 1;graph[20][22] = 2;graph[21][20] = 1;graph[22][15] = 1;graph[22][20] = 2;graph[22][23] = 1;graph[23][16] = 2;graph[23][22] = 1;graph[23][24] = 2;graph[24][23] = 2;graph[25][22] = 3;
count = 0;
v=0;
temp=0;
i=0;
clk_count=0;
final_path = 0;
c=0;
n=0;
index = 0;
done=1;
end


always@(posedge clk) begin
   if(start) begin
	 done=0;
	end
	clk_count = clk_count+1;
   case(state) 
	   s0: begin
		    if(i==26) begin
		      state = s1;
				min = 31;
				distance[s_node] = 0;
				i=0;
				n=0;
				index=0;
			 end
			 else begin
			   parent[s_node] = 27; 
            distance[i] = 31;
		      sptSet[i] = 0;
				
			 end
			 i=i+1;
		end
	   
		s1: begin
		   if(count==25) begin
		     state = s4;
			  count=0;
			  dummy = parent[e_node];
			  
		   end
			else if(v==26) begin
		     state = s2;
			  u = min_index;
		     sptSet[u] = 1;
			  v=0;
			  temp=0;
			  min=31;
			  
		   end
		   else begin
		     if(sptSet[v] == 0 && distance[v]<min) begin
              min = distance[v];
				  min_index = v;
			  end
			end
			v=v+1;
		end 
		
		s2: begin
		      if(temp==26) begin
		          state = s1;
					 count = count + 1;
					 temp=0;
				end
		      else begin
				    if (!sptSet[temp] && graph[u][temp] && distance[u]+graph[u][temp]<distance[temp]) begin
                  parent[temp] = u;
					   distance[temp] = distance[u] + graph[u][temp];
					 end
				end
				    temp = temp+1;
		end
		
		s3: begin
		      if(clk_count == 1650) begin
				  state = s0;
				  clk_count = 0;
				end
		end
		
	   s4: begin
		    if(dummy == 27) begin
			   state = s3;
				if(n==0) begin
				final_path = {{9{parent[s_node]}},e_node};done=1;
				end
				if(n==1) begin
				final_path = {{8{parent[s_node]}},s_node,e_node};done=1;
				end
				if(n==2) begin 
				final_path = {{7{parent[s_node]}},s_node,temp_arr[0],e_node};done=1;
				end
				if(n==3) begin
				final_path = {{6{parent[s_node]}},s_node,temp_arr[1],temp_arr[0],e_node};done=1;
				end
				if(n==4) begin
				final_path = {{5{parent[s_node]}},s_node,temp_arr[2],temp_arr[1],temp_arr[0],e_node};done=1;
				end
				if(n==5) begin
				final_path = {{4{parent[s_node]}},s_node,temp_arr[3],temp_arr[2],temp_arr[1],temp_arr[0],e_node};done=1;
				end
				if(n==6) begin
				final_path = {{3{parent[s_node]}},s_node,temp_arr[4],temp_arr[3],temp_arr[2],temp_arr[1],temp_arr[0],e_node};done=1;
				end
				if(n==7) begin
				final_path = {{2{parent[s_node]}},s_node,temp_arr[5],temp_arr[4],temp_arr[3],temp_arr[2],temp_arr[1],temp_arr[0],e_node};done=1;
				end
				if(n==8) begin
				final_path = {parent[s_node],s_node,temp_arr[6],temp_arr[5],temp_arr[4],temp_arr[3],temp_arr[2],temp_arr[1],temp_arr[0],e_node};done=1;
				end
			 end
		    else begin
			   n=n+1;
				temp_arr[index] = dummy;
				index = index + 1;
				dummy = parent[dummy];
			 end
			 
		end
	endcase         
end

////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////