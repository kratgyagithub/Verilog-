module vending_machine(
  input wire clk, R,
  input wire [1:0] in,
  output reg out, 
  output reg[1:0]ch
);

reg [1:0]state;
parameter s0 = 2'b00; 
parameter s1 = 2'b01;
parameter s2 = 2'b10; 
always@(posedge clk) begin
  if(R)begin
    state <= s0;
    out <= 2'b00;
    ch <= 2'b00;
  end
  else begin
    case(state)
    s0 : begin
      if (in == 2'b00)begin
        state <= s0;
        out <= 0;
        ch <= 2'b00;
      end
      else if (in == 2'b01)begin
        state <= s1;
        out <= 0;
        ch <= 2'b00;
      end
      else if (in == 2'b10)begin
        state <= s2;
        out <= 0;
        ch <= 2'b00;
      end
    end
    s1 : begin
      if (in == 2'b00)begin
        state <= s0;
        out <= 0;
        ch <= 2'b01;
      end
      else if (in == 2'b01)begin
        state <= s2;
        out <= 0;
        ch <= 2'b00;
      end
      else if (in == 2'b10)begin
        state <= s0;
        out <= 1;
        ch <= 2'b00;
      end
    end
    s2 : begin
      if (in == 2'b00)begin
        state <= s0;
        out <= 0;
        ch <= 2'b10;
      end
      else if (in == 2'b01)begin
        state <= s0;
        out <= 1;
        ch <= 2'b00;
      end
      else if (in == 2'b10)begin
        state <= s0;
        out <= 1;
        ch <= 2'b01;
      end
    end
    endcase
  end    
end
endmodule
