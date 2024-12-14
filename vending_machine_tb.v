module vending_machine_tb;
reg clk,R;
reg [1:0]in;
wire out;
wire [1:0]ch;

vending_machine uut(.clk(clk),.R(R),.in(in),.out(out),.ch(ch));

initial begin
  clk = 0;
  forever #5 clk = ~clk;
end

initial begin
  R = 1;
  #15;
  R = 0;
end
initial begin
  #15 in = 2'b00; #10 in = 2'b01;#10 in = 2'b01;#10 in = 2'b01;
  #10 $finish;
end
initial begin
  $monitor(" %t || in = %b || state = %b || out = %b || change = %b", $time,in,uut.state,out,ch);
end
endmodule
