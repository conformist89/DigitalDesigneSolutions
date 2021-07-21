`include "config.vh"

module top
(
    input        clk,
    input        reset_n,
    
    input  [3:0] key_sw,
    output [3:0] led,

    output [7:0] abcdefgh,
    output [3:0] digit,

    output       buzzer,

    output       hsync,
    output       vsync,
    output [2:0] rgb
);

    assign led    = 4'hf;
    assign buzzer = 1'b0;
    assign hsync  = 1'b1;
    assign vsync  = 1'b1;
    assign rgb    = 3'b0;

    //   --a--
    //  |     |
    //  f     b
    //  |     |
    //   --g--
    //  |     |
    //  e     c
    //  |     |
    //   --d--  h
    //
    //  0 means light

    parameter [7:0] C = 8'b01100011,

						  ZERO = 8'b11111111,
                    P = 8'b00110001,
						  O = 8'b00000011,
						  L = 8'b11100011,
						  Y = 8'b10011001,
						  A = 8'b00010001;

//    assign abcdefgh = key_sw [0] ? C : E;
//    assign digit    = key_sw [1] ? 4'b1110 : 4'b1101;

    // Exercise 1: Display the first letters
    // of your first name and last name instead.

//     assign abcdefgh = key_sw [0] ? L :O ;
//     assign digit    = key_sw [1] ? 4'b1110 : 4'b1101;


    // Exercise 2: Display letters of a 4-character word
    // using this code to display letter of ChIP as an example



    reg [7:0] letter;
    
    always @*
      case (key_sw)

      4'b0111: letter = O;
		4'b1011: letter = L;
		4'b1101: letter = Y;
		4'b1110: letter = A;
      default: letter = ZERO;
      endcase
      
    assign abcdefgh = letter;
    assign digit    = key_sw == 4'b1111 ? 4'b0000 : key_sw;
// 

endmodule
