module counter #(
    parameter END=15,
    parameter WIDTH=4
)(
    input clk, 
    input rst, 
    input cnt_inc, 
    output cnt_end, 
    output reg[WIDTH-1:0] cnt
);

assign cnt_end = (cnt == END);//ÿ15������һ�Σ�

always @(posedge clk, posedge rst) begin
	if (rst) cnt <= 0;
	else if (cnt_end) cnt <= 0;//������������
	else if (cnt_inc) cnt <= cnt + 1;//ÿ�����ļ�1
end

endmodule