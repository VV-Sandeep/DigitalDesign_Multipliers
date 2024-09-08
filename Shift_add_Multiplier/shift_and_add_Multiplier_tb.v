module shift_and_add_multiplier_nbit_tb;
parameter n = 8;
reg [n-1:0]a,b;
reg clk,rst;
wire [2*n:0]out;
shift_and_add_multiplier_nbit dut(a,b,clk,rst,out);
initial clk = 0;
always #2 clk = ~clk;
initial
begin
    a = 8'hfe;
    b = 8'hff;
    rst = 1;
    #5 rst = 0;
    #100 $finish;
end
endmodule
