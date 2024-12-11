module seq_101(input wire in,R,clk, output reg out);

reg[1:0] state;
parameter s0 = 0, s1 = 1, s10 = 2;

always @(posedge clk)begin
  if (R)begin
    state <= s0;
    out <= 0;
  end
  else begin
    case(state)
    s0:begin
      state <= in? s1:s0;
      out <= 0;
    end
    s1:begin
      state <= in? s1:s10;
      out <= 0;
    end
    s10:begin
      state <= in? s0:s0;
      out <= in? 1:0;
    end
    default:begin
      state <= s0;
      out <= 0;
    end
    endcase
  end
end
endmodule
