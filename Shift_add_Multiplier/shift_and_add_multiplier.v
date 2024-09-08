module shift_and_add_multiplier_nbit(a,b,clk,rst,out);
parameter n = 8;
input [n-1:0]a,b;
input clk,rst;
output reg [2*n:0]out;
reg c;
reg [n-1:0]acc;
reg [3:0]N;
reg [n-1:0]m,q;
always @(posedge clk)
begin
    if (rst)
    begin
    m = a;
    q = b;
    c = 0;
    acc = 0;
    N = n;
    end
    else if (N > 0)
    begin
        if (q[0])
        begin
            {c,acc} = acc+m;
        end
        {c,acc,q} = {c,acc,q} >> 1;
        N = N-1;
    end
    else
    out = {acc,q};
end 
endmodule
