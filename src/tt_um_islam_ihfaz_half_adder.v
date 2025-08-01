/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_islam_ihfaz_half_adder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire x = ui_in[0];
    wire y = ui_in[1];

    wire S, C;

    assign S = x ^ y; //xor for sum
    assign C = x & y; //and for carry

    // Assign outputs
    assign uo_out[0] = S;
    assign uo_out[1] = C;
    assign uo_out[2] = 1'b0; 
    assign uo_out[3] = 1'b0; 
    assign uo_out[4] = 1'b0; 
    assign uo_out[5] = 1'b0; 
    assign uo_out[6] = 1'b0; 
    assign uo_out[7] = 1'b0; 

    assign uio_out = 0;
    assign uio_oe  = 0;

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, clk, rst_n, ui_in[7:2], uio_in, 1'b0};
    
    // All output pins must be assigned. If not used, assign to 0.
  
endmodule
