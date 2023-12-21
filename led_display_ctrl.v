`timescale 1ns / 1ps

module led_display_ctrl(
	input  wire  rst,
	input  wire  clk,
	input  wire  set,
	input  wire  confirm,
	input  wire  check,
	input  wire  boom,
	input  wire  [11:0]setnum,
	input  wire  [11:0]checknum,
	input  wire  [2:0]seat,
	input  wire  [2:0]seatc,
	output reg   [7:0]led_en,
	output wire  [7:0]led

);
    reg [26:0]counter3;
    reg [26:0]counterplay;
	reg sig_r0;
	reg sig_r1;
	wire pos_edge;
	reg [3:0]num_set;
	reg set1;
	reg check1;
	reg confirm1;
	reg boom1;
	reg boomplay;
	

always @(posedge clk or posedge rst )//是否按下设置
begin
	             if(rst) begin
					set1<= 1'b0;
					end 
				else if(set)set1<= 1'b1;
				else if(confirm)set1 <= 1'b0;
				else set1<=set1;
end
always @(posedge clk or posedge rst )//是否按下确认
begin
	             if(rst) begin
					confirm1<= 1'b0;
					end 
				else if(confirm)confirm1<= 1'b1;
				else confirm1<= confirm1;
end
always @(posedge clk or posedge rst )//是否按下检查 
begin
	             if(rst) begin
					 check1<= 1'b0;
					end 
				else if(check)check1<=1'b1;
				else if(confirm)check1<=1'b0;
				else check1<= check1;
end
always @(posedge clk or posedge rst )//是否达到三次错误
begin
	             if(rst) begin
					boom1<= 1'b0;
				    end
				else if(boom) boom1<= 1'b1;
				else boom1<= boom;
end
always @(posedge clk or posedge rst )//数码管轮播，即轮流使能
begin
	             if(rst) begin
					counter3 <=27'd0;
					led_en <= 8'b11111110;
				 end 
				 else if (counter3 == 27'd100000) begin//原为100000
					counter3 <=27'd0;
					led_en <= {led_en[6:0],led_en[7]};
				 end
				 else begin
  				    counter3 <= counter3 +27'd1;
		          end
end

always @(posedge clk  )//“hhhUdead"字幕倒计时
begin
	             if(rst) begin
					counterplay <=27'd0;
					boomplay<= 1'b0;
				 end 
				 else if (counterplay == 27'd100000000) begin//原为100000000
				    boomplay<= 1'b1;
				 end
				 else if(boom1) begin
  				    counterplay <= counterplay +27'd1;
  				    boomplay <= boomplay;
		          end 
		    else;
end


always @(* ) //counter
begin
            case(led_en)
            8'b11111110:begin//0
                        if(rst)begin
                         num_set = 4'b1110; 
                         end
//                         else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0011;
//                         end
                         else if(boom)begin
                            if(boomplay)
                            begin
                                num_set = 4'b0011;
                            end else
                            num_set = 4'b1111;
                         end
                        else if(confirm)begin
                         num_set = 4'b0000;
                        end
                         else if(set1)begin
                         num_set = 4'b1110;
                         end
                         else if(check1)begin
                         num_set = 4'b1110;
                         end
                         else 
                            num_set = 4'd0;
                         
                   end					 
            8'b11111101:begin//1
                        if(rst)begin
                             num_set = 4'b0000; 
                             end
//                         else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0110;
//                         end                             
                             else if(boom1)begin
                                 if(boomplay)
                                        begin
                                            num_set = 4'b0110;
                                        end else
                                 num_set = 4'b1111;
                             end  
                            else if(confirm)begin
                             num_set = 4'b0000;
                            end
                             else if(set1)begin
                             num_set = 4'b1110;
                             end
                             else if(check1)begin
                             num_set = 4'b1110;
                             end

                             else 
                                num_set = 4'd0;
                                       
                  end
            8'b11111011:begin//2
                    if(rst)begin
                         num_set = 4'b0000; 
                         end
//                         else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0100;
//                         end                         
                             else if(boom1)begin
                                 if(boomplay)
                                        begin
                                            num_set = 4'b0100;
                                        end else
                             num_set = 4'b1111;
                             end  
                        else if(confirm)begin
                         num_set = 4'b0000;
                        end
                         else if(set1)begin
                         num_set = 4'b1110;
                         end
                         else if(check1)begin
                         num_set = 4'b1110;
                         end
                         else 
                                num_set = 4'd0;
                 end
            8'b11110111:begin//3
                    if(rst)begin
                         num_set = 4'b0000; 
                         end
//                         else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0011;
//                         end                         
                         else if(boom1)begin
                             if(boomplay)
                                        begin
                                            num_set = 4'b0011;
                                        end else
                         num_set = 4'b1111;
                         end                        
                         else if(confirm)begin
                         num_set = 4'b0000;
                        end
                         else if(set1)begin
                         num_set = 4'b1110;
                         end
                         else if(check1)begin
                         num_set = 4'b1110;
                         end

                         else 
                           num_set = 4'd0;
                 end
            8'b11101111:begin//led4&5涓烘寜閿崄鍏繘鍒惰鏁?
                      if(rst)begin
                             num_set = 4'b0000; 
                             end
//                         else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0101;
//                         end
                             else if(boom1)begin
                             if(boomplay)
                                        begin
                                            num_set = 4'b0001;
                                        end     else                   
                             num_set = 4'b1111;
                             end                            
                             else if(confirm)begin
                             num_set = 4'b0000;
                            end
                             else if(set1)begin
                             num_set = 4'b1110;
                             end
                             else if(check1)begin
                             num_set = 4'b1110;
                             end

                             else 
                                 num_set = 4'b0000;
                  end
		    8'b11011111:begin// 
                      if(rst)begin
                       num_set = 4'b0010; 
                       end
                       else if(set1)begin
                                if(seat[0]==1'b0)begin
                                num_set = setnum[3:0];
                                end
                                else 
                                num_set = 4'b1110;
                       end
                       else if(check1)begin
                                if(seatc[0]==1'b0)begin
                                num_set = checknum[3:0];
                                end
                                else 
                                num_set = 4'b1110;
                       end
//                         else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0101;
//                         end                       
                       else if(boom1)begin
                             if(boomplay)
                                        begin
                                            num_set = 4'b0101;
                                        end    else                  
                       num_set = 4'b1111;
                       end
                       else
                          num_set = 4'b0000; 
                       
                  end
		    8'b10111111:begin//led6&7涓鸿嚜鍔?16杩涘埗璁℃暟闂撮殧涓?0.2s鍗宠鏁?20000000娆?
                      if(rst)begin
                       num_set = 4'b0000; 
                       end
                       else if(set1)begin
                                if(seat[1]==1'b0)begin
                                num_set = setnum[7:4];
                                end
                                else 
                                num_set = 4'b1110;
                       end
                       else if(check1)begin
                                if(seatc[1]==1'b0)begin
                                num_set = checknum[7:4];
                                end
                                else 
                                num_set = 4'b1110;
                       end
//                         else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0101;
//                         end                       
                       else if(boom1)begin
                             if(boomplay)
                                        begin
                                            num_set = 4'b0101;
                                        end    else                       
                       num_set = 4'b1111;
                       end
                       else
                          num_set = 4'b0000;                         
                      end
		    8'b01111111:begin//
                      if(rst)begin
                       num_set = 4'b1110; 
                       end
                       else if(set1)begin
                                if(seat[2]==1'b0)begin
                                num_set = setnum[11:8];
                                end
                                else 
                                num_set = 4'b1110;
                       end
                       else if(check1)begin
                                if(seatc[2]==1'b0)begin
                                num_set = checknum[11:8];
                                end
                                else 
                                num_set = 4'b1110;
                       end
//                          else if(boom1&&counterplay == 27'd100000000)
//                         begin
//                          num_set = 4'b0101;
//                         end                     
                       else if(boom1)begin
                              if(boomplay)
                                        begin
                                            num_set = 4'b0101;
                                        end   else                         
                       num_set = 4'b1111;
                       end
                       else
                          num_set = 4'b0000;                  
                  end
            endcase
    end

	led_choose u_led_choose(
			.rst(rst),
			.clk(clk),
			.boom1(boom1),
			.num_set(num_set),
			.led_show(led));
			

			
endmodule