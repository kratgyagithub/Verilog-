module seq_101_tb;
reg in , R, clk;
wire out;

seq_101 uut( .in(in),.R(R),.clk(clk),.out(out));

initial begin
  clk = 0;
  forever #5 clk =~clk;
end
initial begin
  R = 1;
  #15;
  R = 0;
  #100;
end
initial begin
  #15 in = 0; #10 in = 1; #10 in = 0; #10 in = 1;
  #10 in = 1; #10 in = 0; #10 in = 1; #10 in = 1;
  #10;
  $finish;
end
initial begin
  $monitor("%t|| IN = %b || OUT = %b || R = %b",$time, in, out,R);
end
endmodule
