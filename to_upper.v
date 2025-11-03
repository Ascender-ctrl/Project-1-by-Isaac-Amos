`timescale 1ns / 1ps

// Project 1: toUpper Combinational Circuit
module to_upper (
    input  [7:0] A_in,
    output [7:0] A_out
);
    wire not_A7, not_A6, not_A4, not_A3, not_A2, not_A1, not_A0;

    wire P1, P2, P3, P4, P5;
    
    buf #(4) G_A0 (A_out[0], A_in[0]);
    buf #(4) G_A1 (A_out[1], A_in[1]);
    buf #(4) G_A2 (A_out[2], A_in[2]);
    buf #(4) G_A3 (A_out[3], A_in[3]);
    buf #(4) G_A4 (A_out[4], A_in[4]);
    buf #(4) G_A6 (A_out[6], A_in[6]);
    buf #(4) G_A7 (A_out[7], A_in[7]);


    not #(5) N_A7 (not_A7, A_in[7]);
    not #(5) N_A6 (not_A6, A_in[6]);
    not #(5) N_A4 (not_A4, A_in[4]);
    not #(5) N_A3 (not_A3, A_in[3]);
    not #(5) N_A2 (not_A2, A_in[2]);
    not #(5) N_A1 (not_A1, A_in[1]);
    not #(5) N_A0 (not_A0, A_in[0]);

    //p1, p2, p3, p4,and p5
    and #(10) AND_P1 (P1, A_in[7], A_in[5]);
    and #(10) AND_P2 (P2, not_A7, not_A6, A_in[5]);
    and #(10) G_P3 (P3, not_A7, A_in[6], A_in[5], A_in[4], A_in[3], A_in[2]);
    and #(10) G_P4 (P4, not_A7, A_in[5], not_A4, not_A3, not_A2, not_A1, not_A0);
    and #(10) G_P5 (P5, not_A7, A_in[6], A_in[5], A_in[4], A_in[3], not_A2, A_in[1], A_in[0]);

    
    // A_out[5] = (P1 + P2) + (P3 + P4) + P5
    or #(10) OR_SOP (A_out[5], P1, P2, P3, P4, P5);


endmodule // to_upper
