module mux_2x1(input wire A,B,S , output reg X); //making 2X1 mux 

always@(*)begin
  case(S)
    0:begin
      X = A;
    end
    1:begin
      X = B;
    end
  endcase
end
endmodule
// //////////////////////////////////////////////

module mux_4x1(input wire[3:0]in, input wire [1:0]S, output wire Y);//4x1 mux from 2x1 mux
wire w1,w2;
  mux_2x1 m1(.A(in[0]),.B(in[1]),.S(S[0]),.X(w1));  //  instantiating 2X1 mux and feeding it with input
mux_2x1 m2(.A(in[2]),.B(in[3]),.S(S[0]),.X(w2));
mux_2x1 m3(.A(w1),.B(w2),.S(S[1]),.X(Y));
endmodule
