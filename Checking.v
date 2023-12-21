module Checking( 						
	input  wire  clk,
	input  wire  set,
	input  wire  check,
	input  wire  confirm,
	input  keyboard_en,
	input         rst,
	input  wire  [11:0]setnum,
	input  wire  [3:0]keyboard_num,
	output reg   boom,
	output reg  [2:0]seatc,
	output reg  checkend,
	output reg  [2:0]ledwrong,
	output reg  [11:0]checknum,
	output reg  ledwright
    
);

    parameter IDLE = 3'b111;
    parameter s0 = 3'b000;   
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;
    parameter IDLE1 = 3'b111;
    parameter s01 = 3'b000;   
    parameter s11 = 3'b001;
    parameter s21 = 3'b010;
    parameter s31 = 3'b011;
    parameter s41 = 3'b100;
	reg [2:0]current_state;
	reg [2:0]next_state;
	reg [2:0]current_state1;
	reg [2:0]next_state1;
	reg [3:0]num1;
	reg [3:0]num2;
	reg [3:0]num3;
	reg [3:0]step;
	reg check1;


always @(posedge clk or posedge rst )//轮播
begin
	             if(rst) begin
					 check1<= 1'b0;
					end 
				else if(check)check1<=1'b1;
				else if(confirm)check1<=1'b0;
				else check1<= check1;
end

always @(posedge clk or posedge rst )
begin
      if(rst) begin 
		num1<= 4'd0;
	  end
      else  if(check)  begin 
	   num1 <= setnum[11:8];
	   end
      else begin num1 <= num1;
      end
end
always @(posedge clk or posedge rst )
begin
      if(rst) begin 
		num2<= 4'd0;
	  end
      else  if(check)  begin 
	   num2 <= setnum[7: 4];
	   end
      else begin num2 <= num2;
      end
end
always @(posedge clk or posedge rst )
begin
      if(rst) begin 
		num3<= 4'd0;
	  end
      else  if(check)  begin 
	   num3 <= setnum[3: 0];
	   end
      else begin num3 <= num3;
      end
end

always @(posedge clk or posedge rst )
begin
      if(rst) current_state <=IDLE ;
	else if(confirm) current_state<=IDLE;
      else  current_state <= next_state;
end

always @(posedge clk or posedge rst )
begin
      if(rst) current_state1 <=IDLE1 ;
	else if(confirm) current_state1<=IDLE1;
      else  current_state1 <= next_state1;

end

always @(*) //
begin
  if(rst) next_state = IDLE;
     else begin
     case (current_state)
        IDLE : if(check1) next_state = s0;//check已经被按下
               else  next_state = IDLE;
        s0 : if(num1 == keyboard_num) next_state = s1;//第一位正确
             else next_state = s0;
        s1 : if(num2 == keyboard_num) next_state = s2;//第二位正确
             else next_state = s1;             
        s2 : if(num3 == keyboard_num) next_state = s3;//第三位正确
             else next_state = s2;
        s3 : if(confirm) next_state = s4;//按下confirm判断结果
             else next_state = s3;             
        s4 : if(check) next_state = IDLE;
             else if (set)next_state = IDLE;
             else next_state = s4;
        default: next_state = IDLE;
    endcase
   end
end

always @(*) //
begin
  if(rst) next_state1 = IDLE1;
     else begin
     case (current_state1)
        IDLE1 : if(check) next_state1 = s01;//开始检测
               else  next_state1 = IDLE1;
        s01 : if(keyboard_en) next_state1 = s11;//第一位输入
             else next_state1 = s01;
        s11 : if(keyboard_en) next_state1 = s21;//第二位输入
             else next_state1 = s11; 
        s21 : if(keyboard_en) next_state1 = s31;//第三位输入
             else next_state1 = s21;             
        s31 : if(confirm) next_state1 = s41;//确认按钮按下
             else next_state1 = s31;
        s41 : if(check) next_state1 = IDLE1;//再次检测
             else next_state1 = s41;//
        default: next_state1 = IDLE1;
    endcase
   end
end

always @(posedge clk or posedge rst )
begin
      if(rst) checknum<= 12'b111111111111;
      else if(check)checknum<= 12'b111011101110;
//      else if(check)checknum <= {num1,num2,num3};
      else  if(keyboard_en&&next_state1 == s11)  checknum <= {keyboard_num,checknum[11:4]};
      else  if(keyboard_en&&next_state1 == s21)  checknum <= {checknum[11:8],keyboard_num,checknum[3:0]};
      else  if(keyboard_en&&next_state1 == s31)  checknum <= {checknum[11:4],keyboard_num};
      else checknum <= checknum ;
end

always @(posedge clk or posedge rst )
begin
      if(rst||check||set) seatc<= 3'b111;
      else  if(next_state1 == s11)  seatc[2] <= 1'b0;
      else  if(next_state1 == s21)  seatc[1] <= 1'b0;
      else  if(next_state1 == s31)  seatc[0] <= 1'b0;
      else seatc <= seatc ;
end

always @(posedge clk or posedge rst )
begin
      if(rst) step<= 4'b0000;
      else  if(keyboard_en&&check1)  step <= step + 4'd1;
	  else  if(step == 4'd10)step <= 4'd0;
      else  step <= step ;
end

always @(posedge clk or posedge rst )//正确的盒子
begin
      if(rst||set) checkend<= 1'b0;
      else  if(next_state == s4) checkend <= 1'b1;
      else checkend <= checkend ;
end
always @(posedge clk or posedge rst )//正确的盒子
begin
      if(rst||set) ledwright<= 1'b0;
      else  if(checkend) ledwright <= 1'b1;
      else ledwright <= ledwright ;
end

//always @(posedge clk or posedge rst )
//begin
//      if(rst) ledwrong<= 3'b000;
//      else  if(step == 4'd3&&confirm&&~checkend)  ledwrong<= 3'b100;
//	  else  if(step == 4'd6&&confirm&&~checkend)  ledwrong<= 3'b110;
//	  else  if(step == 4'd9&&confirm&&~checkend)  ledwrong<= 3'b111;
//	  else  ledwrong <=ledwrong;
//end

always @(posedge clk or posedge rst )
begin
      if(rst||set) ledwrong<= 3'b000;
      else  if(next_state != s4&&next_state1 == s41)  ledwrong<= {1'b1,ledwrong[2:1]};
	  else  ledwrong <=ledwrong;
end


always @(posedge clk or posedge rst )
begin
      if(rst) boom<= 1'b0;
	  else  if(ledwrong == 3'd7)  boom<= 1'b1;
	  else  boom <= boom;
end

endmodule