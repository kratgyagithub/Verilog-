module sp_ram(input [7:0]data,input [5:0]addr,input clk,we,output reg [7:0] Q);

reg [7:0] ram [63:0];
reg [5:0] addr_reg;

always @(posedge clk) begin
  if(we)begin
    ram[addr] <= data;

  end
  else begin
    addr_reg <= addr;
  end
  Q <= ram[addr_reg];
end
always@(posedge clk)begin
    Q <= ram[addr_reg];
end
endmodule
