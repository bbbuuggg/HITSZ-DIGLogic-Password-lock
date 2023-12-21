module keyboard #(
    parameter CNT_THRESHOLD=1000000-1
)(
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] row,           //读取行输入信号
    output reg  [3:0] col,           //输出列扫描信号
    output reg        keyboard_en,   //keyboard是否有按下,只有按下的时候按键值才有效，区分复位状态的0和实际按下编号为的0的键
    output reg  [3:0] keyboard_num  //keyboard具体按下的数字,送到数码管,只维持一个周期
);

wire cnt_end;

counter #(CNT_THRESHOLD, 24) u_counter(//上板用
    .clk(clk), 
    .rst(rst), 
    .cnt_inc(1),
    .cnt_end(cnt_end)
);
//counter #(4, 24) u_counter(//测试用
//    .clk(clk), 
//    .rst(rst), 
//    .cnt_inc(1),
//    .cnt_end(cnt_end)
//);

reg[15:0] key;
reg[15:0] key_r;
wire[15:0] key_posedge = (~key_r) & key; //key快一个节拍，故有一个节拍的时间差，判断为输入信号

always @(posedge clk, posedge rst) begin
    if (rst == 1) begin
        keyboard_num <= 0;   
    end else if (key_posedge) begin
		if (key_posedge[0]) keyboard_num <= 'hd;
		else if (key_posedge[1]) keyboard_num <= 'hc;
		else if (key_posedge[2]) keyboard_num <= 'hb;
		else if (key_posedge[3]) keyboard_num <= 'ha;
		else if (key_posedge[4]) keyboard_num <= 'hf;
		else if (key_posedge[5]) keyboard_num <= 'h9;
		else if (key_posedge[6]) keyboard_num <= 'h6;
		else if (key_posedge[7]) keyboard_num <= 'h3;
		else if (key_posedge[8]) keyboard_num <= 'h0;
		else if (key_posedge[9]) keyboard_num <= 'h8;
		else if (key_posedge[10]) keyboard_num <= 'h5;
		else if (key_posedge[11]) keyboard_num <= 'h2;
		else if (key_posedge[12]) keyboard_num <= 'he;
		else if (key_posedge[13]) keyboard_num <= 'h7;
		else if (key_posedge[14]) keyboard_num <= 'h4;
		else if (key_posedge[15]) keyboard_num <= 'h1;
	end else begin
		keyboard_num <= 0;
	end
end

/*
      case ({col, row})  // 编码表
        8'b1110_1110 : keyboard_num <= 4'hd;   // key_posedge[0]
        8'b1110_1101 : keyboard_num <= 4'hc;   // key_posedge[1]
        8'b1110_1011 : keyboard_num <= 4'hb;   // key_posedge[2]
        8'b1110_0111 : keyboard_num <= 4'ha;   // key_posedge[3]  后面以此类推，

        8'b1101_1110 : keyboard_num <= 4'hf;  // #键
        8'b1101_1101 : keyboard_num <= 4'h9;
        8'b1101_1011 : keyboard_num <= 4'h6;
        8'b1101_0111 : keyboard_num <= 4'h3;

        8'b1011_1110 : keyboard_num <= 4'h0;
        8'b1011_1101 : keyboard_num <= 4'h8;
        8'b1011_1011 : keyboard_num <= 4'h5;
        8'b1011_0111 : keyboard_num <= 4'h2;

        8'b0111_1110 : keyboard_num <= 4'he;  // *键
        8'b0111_1101 : keyboard_num <= 4'h7;
        8'b0111_1011 : keyboard_num <= 4'h4;
        8'b0111_0111 : keyboard_num <= 4'h1;        
      endcase
   */

always @(posedge clk, posedge rst) begin
    if (rst == 1) begin
        keyboard_en <= 0;
    end else if (key_posedge) begin
		keyboard_en <= 1;
	end else begin
		keyboard_en <= 0;
	end
end

always @(posedge clk, posedge rst) begin
    if (rst == 1)           col <= 4'b1111;
    else if (col ==  4'b1111) col <= 4'b1110;
    else if (cnt_end)         col <= {col[2:0], col[3]};
end


always @(posedge clk, posedge rst) begin
    if (rst == 1) key_r <= 0;
    else key_r <= key;
end

always @(posedge clk, posedge rst) begin
    if (rst == 1) key <= 0;
    else if (cnt_end) begin
        if (col[0] == 0) key[3:0]   <= ~row;//行输入信号；每列对应四个key位
        if (col[1] == 0) key[7:4]   <= ~row;
        if (col[2] == 0) key[11:8]  <= ~row;
        if (col[3] == 0) key[15:12] <= ~row;
    end
end

endmodule