module booth_multiplier_nbit_tb;
parameter n = 8;
reg [n-1:0]a,b;
reg clk,rst;
wire [(2*n)-1:0]out;
booth_multiplier_nbit dut(a,b,clk,rst,out);
initial clk = 0;
always #5 clk = ~clk;
initial
begin
    a = 16'h6a;
    b = 16'h88;
    rst = 1;
    #10 rst = 0;
    #200 $finish;
end
endmodule
