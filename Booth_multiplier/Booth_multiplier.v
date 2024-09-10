module booth_multiplier_nbit(a,b,clk,rst,out);
parameter n = 8;
input [n-1:0]a,b;
input clk,rst;
output reg [(2*n)-1:0]out;
reg [n-1:0]m,q;
reg [n-1:0]acc;
reg [4:0]N;
reg qx;
always @(posedge clk)
begin
    if (rst)
    begin
        m = a;
        q = b;
        acc = 1'b0;
        qx = 1'b0;
        N = n;
    end
    else if (N > 0)
    begin
        if({q[0],qx} == 2'b10)
        begin
            acc = acc-m;
        end
        else if ({q[0],qx} == 2'b01)
        begin
            acc = acc+m;
        end
         {acc,q,qx} = {acc[n-1],acc,q};
         N = N-1;
    end  
    else    
    begin
        out = {acc,q};
    end
end
endmodule
