`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2024 11:34:20
// Design Name: 
// Module Name: D_FlipFlop_Test
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


module D_FlipFlop_Test();

// Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds
    // Signals
    reg clk;
    reg reset;
    reg D;
    wire q, q_bar;
    
    // Instantiate the module under test
    D_FlipFlop Dut (
       .d(D),
       .reset(reset),
       .clk(clk),
       .q(q),
       .q_bar(q_bar)
    );
    
     // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;
    
    // Initial values
    initial begin
        clk = 0;
        reset = 1;
        D = 0;
       
     end
     always #2 D = D + 1;
     initial begin
       #20 reset = 0; // Release reset after 20 ns
       #40 reset = 1; 
       #100  $finish;
     end
        
    always @(posedge clk) begin
    
        $monitor("Time: %d ns,  D = %B, q = %B, q_bar = %B",$time, D,q,q_bar);
    end
    
endmodule
