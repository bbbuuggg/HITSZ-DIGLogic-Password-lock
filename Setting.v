module Setting( 						//设置密码盒子
	input  wire  clk,
	input  wire  set,
	input  wire  check,
	input  wire  confirm,
	input  keyboard_en,
	input         rst,
	input  wire  [3:0]keyboard_num,
    output reg   set_led,
    output reg  [2:0]seat,
    output reg  [11:0]setnum,
    output reg setend
    
);

    parameter IDLE = 3'b111;
    parameter s0 = 3'b000;   
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;

	reg [2:0]current_state;
	reg [2:0]next_state;




always @(posedge clk or posedge rst )
begin
      if(rst) current_state <=IDLE ;
 //     else if(button) current_state<=IDLE;
      else  current_state <= next_state;

end

always @(*) //
begin
  if(rst) next_state = IDLE;
     else begin
     case (current_state)
        IDLE : if(set) next_state = s0;//进入第一位设�?
               else  next_state = IDLE;
        s0 : if(keyboard_en&&!set) next_state = s1;//进入第二位设�?
             else next_state = s0;
        s1 : if(keyboard_en) next_state = s2;//进入第三位设�?
             else next_state = s1; 
        s2 : if(keyboard_en) next_state = s3;//进入第三位设�?
             else next_state = s2;             
        s3 : if(confirm) next_state = s4;//设置完的信号
             else next_state = s3;
        s4 : if(rst||set) next_state = IDLE;
             else next_state = s4;//成功亮灯�?
        default: next_state = IDLE;
    endcase
   end
end


always @(posedge clk or posedge rst )
begin
      if(rst||set) set_led<= 1'b0;
      else  if(next_state == s4) set_led <= 1'b1;
      else set_led <= set_led ;
end
always @(posedge clk or posedge rst )
begin
      if(rst||set) setend<= 1'b0;
      else  if(next_state == s4) setend <= 1'b1;
      else setend <= setend ;
end

always @(posedge clk or posedge rst )
begin
      if(rst||set) seat<= 3'b111;
      else  if(next_state == s1)  seat[2] <= 1'b0;
      else  if(next_state == s2)  seat[1] <= 1'b0;
      else  if(next_state == s3)  seat[0] <= 1'b0;
      else seat <= seat ;
end

always @(posedge clk or posedge rst )
begin
      if(rst||set) setnum<= 12'b111111111111;
      else  if(keyboard_en&&next_state == s1)  setnum = {keyboard_num,setnum[11:4]};
      else  if(keyboard_en&&next_state == s2)  setnum = {setnum[11:8],keyboard_num,setnum[3:0]};
      else  if(keyboard_en&&next_state == s3)  setnum = {setnum[11:4],keyboard_num};
      else setnum <= setnum ;
end



endmodule