module b_to_grey_tb;
reg[3:0]in;
wire[3:0]out;

b_to_grey uut(.in(in),.out(out));

initial begin
  in = 4'b0001;
  #5;
  in = 4'b0010;
  #5;
  in = 4'b0011;
  #5;
  in = 4'b0100;
  #5;
end
initial begin
  $monitor("input = %b ---> Grey out = %b",in,out);
end

endmodule
