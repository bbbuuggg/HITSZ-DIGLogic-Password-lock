`timescale 1ns/1ps         
//��1�����������״̬ת�ƣ����������趨������ƥ��ɹ�������ƥ��ʧ�ܡ�����������
//��2�����������ƥ��״̬����ת�ƹ��̣�ƥ��ʧ�ܺͳɹ���һ�μ��ɡ�
module top_sim();    
reg  clk;
reg  set;
reg  check;
reg  confirm;
reg       rst;
reg [3:0]  row;
wire [3:0]  col;
wire [3:0] keyboard_num;
wire [2:0] ledwrong;
wire set_led;
wire   [7:0]led_en;
wire  [7:0]led;

reg [3:0]key;//ǰ��λΪ��������������λΪ�к�


initial
begin
 clk = 1'b1;set = 1'b0;   rst = 1'b1;  check = 1'b0; confirm = 1'b0; key=4'hf;//��ʼ����
#25 set = 1'b1;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//�������� 
#25 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//���������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h1; //��������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h2; 
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h3;
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b1; key=4'hf;//ȷ������ 
//���ý���
#25 set = 1'b0;   rst = 1'b0;  check = 1'b1; confirm = 1'b0; key=4'hf;//������֤ 
#25 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//���������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h1;//��������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h2;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h3;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b1; key=4'hf;//ȷ������
//��ȷ����
#25 set = 1'b1;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//�������� 
#25 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//���������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h1; //��������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h2; 
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h3;
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b1; key=4'hf;//ȷ������ 
//�����ý���
#25 set = 1'b0;   rst = 1'b0;  check = 1'b1; confirm = 1'b0; key=4'hf;//������֤ 
#25 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//���������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h5;//��������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h4;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h3;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b1; key=4'hf;//ȷ������ 
//����һ��
#25 set = 1'b0;   rst = 1'b0;  check = 1'b1; confirm = 1'b0; key=4'hf;//������֤ 
#25 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//���������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h5;//��������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h4;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h3;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b1; key=4'hf;//ȷ������ 
//��������
#25 set = 1'b0;   rst = 1'b0;  check = 1'b1; confirm = 1'b0; key=4'hf;//������֤ 
#25 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//���������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h5;//��������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h4;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h3;  
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b1; key=4'hf;//ȷ������ 
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//ȷ������ 
//��������
#50000 set = 1'b0;   rst = 1'b1;  check = 1'b0; confirm = 1'b0; key=4'hf;//��ʼ����  
#25 set = 1'b1;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//�������� 
#25 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'hf;//���������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h1; //��������
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h2; 
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b0; key=4'h3;
#50 set = 1'b0;   rst = 1'b0;  check = 1'b0; confirm = 1'b1; key=4'hf;//ȷ������ 
//���ý���

end
always #2.5 clk =~clk;


    always @(*) begin
        case (key)
            4'h0: if (col == 4'b1011) row = 4'b1110;else row = 4'b1111;//0
            4'h1: if (col == 4'b0111) row = 4'b0111;else row = 4'b1111;//1
            4'h2: if (col == 4'b1011) row = 4'b0111;else row = 4'b1111;//2 
            4'h3: if (col == 4'b1101) row = 4'b0111;else row = 4'b1111; 
            4'h4: if (col == 4'b0111) row = 4'b1011;else row = 4'b1111;//
            4'h5: if (col == 4'b1011) row = 4'b1011;else row = 4'b1111; 
            4'h6: if (col == 4'b1101) row = 4'b1011;else row = 4'b1111; 
            4'h7: if (col == 4'b0111) row = 4'b1101;else row = 4'b1111; 
            4'h8: if (col == 4'b1011) row = 4'b1101;else row = 4'b1111;//
            4'h9: if (col == 4'b1101) row = 4'b1101;else row = 4'b1111; 
            4'ha: if (col == 4'b1110) row = 4'b0111;else row = 4'b1111; 
            4'hb: if (col == 4'b1110) row = 4'b1011;else row = 4'b1111; 
            4'hc: if (col == 4'b1110) row = 4'b1101;else row = 4'b1111;//
            4'hd: if (col == 4'b1110) row = 4'b1110;else row = 4'b1111; 
            4'he: if (col == 4'b0111) row = 4'b1110;else row = 4'b1111;
            4'hf: row = 4'b1111; 
        endcase
    end

top u_top(
	.rst(rst),
	.clk(clk),
    .set(set),
    .check(check),
	.confirm(confirm),
	.row(row),
	.col(col),
	.keyboard_num(keyboard_num),
	.ledwrong(ledwrong),
	.set_led(set_led),
	.led_en(led_en),
	.led(led)
	);


endmodule
