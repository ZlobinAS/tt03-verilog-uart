`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
	output wire tx,
    output wire [6:0] segments
   );

   reg clk;
   reg rst;
   reg rx;

   integer bit_cnt;
   integer data;

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {6'b0, rx, rst, clk};
    wire [7:0] outputs;
    assign segments = outputs[6:0];
	assign tx = outputs[7];

    // instantiate the DUT
    zl_uart zl_uart(
        `ifdef GL_TEST
            .vccd1( 1'b1),
            .vssd1( 1'b0),
        `endif
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule


