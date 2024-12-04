`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:05 11/04/2024 
// Design Name: 
// Module Name:    memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//-------------------------------------- memory --------------------------------------//

module memory(input clk, rst, write, read,
              input [5:0] write_address,
              input [5:0] read_address,
              input [size - 1:0] write_value,
              output reg [size - 1:0] data);
  parameter row = 2;
  parameter column = 2;
  parameter size = 8;
  
  // 8 bit 2x2 matrix
  reg [size - 1 : 0] mem [0 : (row*column) - 1]; // https://www.chipverify.com/verilog/verilog-arrays-memories
  integer i;
  integer j;
  // sync writing
  
  
  
  // zakria addition
  initial begin
  //initialize
  for (i = 0; i < row; i = i+1)
        for (j = 0; j < column; j = j + 1)
          mem[row*i + j] = 8'b0; // make 0 
  end
  // zakria close
  
  always @ (posedge clk) begin
    // clearing memory
    //if (rst) begin
      //integer i;
      //integer j;
    //  for (i = 0; i < row; i = i+1)
      //  for (j = 0; j < column; j = j + 1)
        //  mem[row*i + j] <= 100-2*j+i; // make 0 later
    //end
    // writing in memory
    if (write) mem[write_address] <= write_value;
	 
	 //else begin
	//	for (i = 0; i < row; i = i+1)
    //    for (j = 0; j < column; j = j + 1)
     //     mem[row*i + j] <= 0; // make 0 
	 //end
	 
  end
    
  // async reading
  always @ (*) begin if (read) data = mem[read_address]; else data = 8'b0; end
endmodule

