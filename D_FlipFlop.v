`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2024 11:30:06
// Design Name: 
// Module Name: D_FlipFlop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module D_FlipFlop(

    input d,reset,clk,
    output reg q,
    output q_bar
    );
    
     always @ (posedge clk)  
       if (reset==0)  
          q <= 0;  
       else  
          q <= d;  
     
     assign q_bar = ~q;
endmodule
