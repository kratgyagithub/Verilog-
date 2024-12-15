module mux_tb;

reg [3:0]in;
reg [1:0]S;
wire Y;

mux_4x1 uut(.in(in),.S(S),.Y(Y));

initial begin
  in[0]= 0;in[1]= 0;in[2]= 0;in[3]= 0;S=2'b00;
  #10;
  in[0]= 0;in[1]= 1;in[2]= 0;in[3]= 0;S=2'b01;
  #10;
  in[0]= 0;in[1]= 0;in[2]= 1;in[3]= 0;S=2'b10;
  #10;
  in[0]= 0;in[1]= 0;in[2]= 0;in[3]= 1;S=2'b11;
  #10;
end
initial begin
  $monitor(" %t || IN1 = %b || IN2 = %b || IN3 = %b || IN4 = %b || S = %b || Y = %b ", $time,in[0],in[1],in[2],in[3],S,Y);
end
endmodule
