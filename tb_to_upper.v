`timescale 1ns / 1ps
module tb_to_upper;
    wire [7:0] ascii_out;
    reg [7:0] ascii_in;
    to_upper t1 (
        .A_in  (ascii_in),  
        .A_out (ascii_out)   
    );
    initial begin

        parameter T_DELAY = 24; // i tried it at 25ns first, then 24ns for it to fail

        ascii_in = 8'b00101000;
        #T_DELAY
        ascii_in = 8'b01001000;
        #T_DELAY
        ascii_in = 8'b10110111;
        #T_DELAY
        ascii_in = 8'b10000011;
        #T_DELAY
        ascii_in = 8'b01111100;
        #T_DELAY
        ascii_in = 8'b00010100;
        #T_DELAY
        ascii_in = 8'b11101011;
        #T_DELAY
        ascii_in = 8'b01100001;
        #T_DELAY
        ascii_in = 8'b01000001;
        #T_DELAY
        ascii_in = 8'b01111010;
        #T_DELAY
        ascii_in = 8'b01000111;
        #T_DELAY
        ascii_in = 8'b01101101;
        #T_DELAY
        ascii_in = 8'b10010010;
        #T_DELAY
        ascii_in = 8'b00110000;
        #T_DELAY
        ascii_in = 8'b11001111;
        #T_DELAY
        ascii_in = 8'b00111010;
        #T_DELAY
        ascii_in = 8'b01111011;
        #T_DELAY
        ascii_in = 8'b10000100;
        #T_DELAY
        ascii_in = 8'b01111111;
        #T_DELAY $finish;
    end
    initial begin
        $dumpfile("to_upper_waves.vcd");
        $dumpvars(0,tb_to_upper);
    end
endmodule
