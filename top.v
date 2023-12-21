module top(
	input  wire  clk,
	input  wire  set,
	input  wire  check,
	input  wire  confirm,
	input         rst,
    input  [3:0]  row,
    output [3:0]  col,
    output wire  set_led,
    output wire   [7:0]led_en,
    output wire  [7:0]led,
    output wire  [2:0]ledwrong,
    output wire [3:0]  keyboard_num,
    output wire ledwright

);

    parameter IDLE = 3'b111;
    parameter s0 = 3'b000;   
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;
    

	reg [2:0]current_state;
	reg [2:0]next_state;
	wire keyboard_en;

    wire  setend;
    wire  checkend;
    wire  boom;
    wire [2:0]seat;
    wire [2:0]seatc;
    wire  [11:0]setnum;
    wire  [11:0]checknum;




always @(posedge clk or posedge rst )
begin
      if(rst) current_state <=IDLE ;
 //     else if(button) current_state<=IDLE;
      else  current_state <= next_state;

end

always @(*) //设置密码还是放外面吧//密码验证盒也外面
begin//只判断状态！
  if(rst) next_state = IDLE;
     else begin
     case (current_state)
        IDLE : if(setend &&ledwright != 1'b1) next_state = s1;//已设置密码
               else  next_state = s0;//已经解锁或者未设置密码
        s0 : if(set) next_state = s2;//进入设置
             else next_state = s0;
        s1 : if(check) next_state = s3;//进入验证密码
             else next_state = s1;             
        s2 : if(setend) next_state =IDLE;//设置完的信号
             else next_state = s2;
        s3 : if(checkend) next_state = s4;//正确信号
             else next_state = s3;
        s4 : if(~rst) next_state = s4;//解锁状态
             else next_state = IDLE;     
        default: next_state = IDLE;
    endcase
   end
end



keyboard  u_keyboard(
    .clk(clk), 
    .rst(rst), 
    .row(row), 
    .col(col), 
    .keyboard_en(keyboard_en), 
    .keyboard_num(keyboard_num)    // 因只亮一个周期，直接送到led显示将看不到灯亮
//    input  wire       clk,
//    input  wire       rst,
//    input  wire [3:0] row,           //读取行输入信号
//    output reg  [3:0] col,           //输出列扫描信号
//    output reg        keyboard_en,   //keyboard是否有按下,只有按下的时候按键值才有效，区分复位状态的0和实际按下编号为的0的键
//    output reg  [3:0] keyboard_num  //keyboard具体按下的数字,送到数码管,只维持一个周期
);

 led_display_ctrl u_led_display_ctrl(
    .clk(clk), 
    .rst(rst), 
    .led_en(led_en),
    .led(led),
    .set(set),
    .confirm(confirm),
    .check(check),
	.boom(boom),
	.setnum(setnum),
	.checknum(checknum),
	.seat(seat),
	.seatc(seatc)
//	input  wire  rst,
//	input  wire  clk,
//	input  wire  set,
//	input  wire  confirm,
//	input  wire  check,
//	input  wire  boom,
//	input  wire  [11:0]setnum,
//	input  wire  [11:0]checknum,
//	input  wire  [2:0]seat,
//	input  wire  [2:0]seatc,
//	output reg   [7:0]led_en,
//	output wire  [7:0]led
);

 Setting u_Setting(
    .clk(clk),
    .set(set),
    .check(check),
    .confirm(confirm),
    .keyboard_en(keyboard_en),
    .rst(rst),
    .keyboard_num(keyboard_num),
    .set_led(set_led),
    .seat(seat),
    .setnum(setnum),
    .setend(setend)
//	input  wire  clk,
//	input  wire  set,
//	input  wire  check,
//	input  wire  confirm,
//	input  keyboard_en,
//	input         rst,
//	input  wire  keyboard_num,
//    output reg   set_led,
//    output reg  [2:0]seat,
//    output reg  [11:0]setnum,
//    output reg setend
);

 Checking u_Checking(
    .clk(clk),
    .set(set),
    .check(check),
    .confirm(confirm),
    .keyboard_en(keyboard_en),
    .rst(rst),
    .setnum(setnum),
    .keyboard_num(keyboard_num),
    .boom(boom),
    .seatc(seatc),
    .checkend(checkend),
    .ledwrong(ledwrong),
    .checknum(checknum),
    .ledwright(ledwright)
//	input  wire  clk,
//	input  wire  set,
//	input  wire  check,
//	input  wire  confirm,
//	input  keyboard_en,
//	input         rst,
//	input  wire  [11:0]setnum,
//	input  wire  [3:0]keyboard_num,
//	output reg   boom,
//	output reg  [2:0]seatc,
//	output reg  checkend,
//	output reg  [2:0]ledwrong,
//	output reg  [11:0]checknum
);


endmodule
