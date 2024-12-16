module sp_ram_tb;

  reg [7:0] data;   
  reg [5:0] addr;   
  reg we;           
  reg clk;          
  wire [7:0] Q;     

 
  sp_ram uut (
    .data(data),
    .addr(addr),
    .clk(clk),
    .we(we),
    .Q(Q)
  );


  initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;  
  end


  initial begin
    $monitor("Time=%0t | clk=%b | we=%b | addr=%d | data=%h | Q=%h", 
             $time, clk, we, addr, data, Q);
  end

  initial begin
    // Initialize inputs
    data = 8'h00;
    addr = 6'd0;
    we = 1'b0;

    // Test sequence
    #10;

    data = 8'hAA;
    addr = 6'd0;
    we = 1'b1;
    #10;


    data = 8'hBB;
    addr = 6'd1;
    #10;


    data = 8'hCC;
    addr = 6'd2;
    #10;


    we = 1'b0;
    addr = 6'd0;
    #10;


    addr = 6'd1;
    #10;

    addr = 6'd2;
    #10;


    data = 8'hDD;
    addr = 6'd1;
    we = 1'b1;
    #10;


    we = 1'b0;
    addr = 6'd1;
    #10;


    addr = 6'd3;
    #10;

    #10 $finish;
  end
endmodule
