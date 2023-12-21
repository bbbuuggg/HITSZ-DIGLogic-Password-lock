module led_choose (
	input  wire  rst,
	input  wire  clk,
	input  wire  boom1,
	input  wire  [3:0]num_set,
	output reg   [7:0]led_show
);
	reg  led_ca;
	reg  led_cb;
	reg  led_cc;
	reg  led_cd;
	reg  led_ce;
	reg  led_cf;
	reg  led_cg;
always @(*) 
begin	
  if(boom1)begin//±¬Õ¨×ÖÄ»µÄ×ÖÄ¸±í
        case(num_set)
	     4'b0000:begin
		            led_ca = 1'b1;//y
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b1;
					led_cf = 1'b0;
					led_cg = 1'b0;//[0]
		    end
	     4'b0001:begin
		            led_ca = 1'b1;//U
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b1;
		    end
	     4'b0010:begin
		            led_ca = 1'b1;//0
					led_cb = 1'b1;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b0011:begin
		            led_ca = 1'b1;//d
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b0100:begin
		            led_ca = 1'b0;//E
					led_cb = 1'b1;
					led_cc = 1'b1;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b0101:begin
		            led_ca = 1'b1;//h
					led_cb = 1'b1;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b0110:begin
		            led_ca = 1'b0;//A
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b0111:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b1;
					led_cg = 1'b1;
		    end
	     4'b1000:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1001:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1010:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1011:begin
		            led_ca = 1'b1;
					led_cb = 1'b1;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1100:begin
		            led_ca = 1'b1;
					led_cb = 1'b1;
					led_cc = 1'b1;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b1101:begin
		            led_ca = 1'b1;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b1110:begin
		            led_ca = 1'b1;
					led_cb = 1'b1;
					led_cc = 1'b1;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b1;
					led_cg = 1'b1;
		    end
	     4'b1111:begin
		            led_ca = 1'b0;
					led_cb = 1'b1;
					led_cc = 1'b1;
					led_cd = 1'b1;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
		    default begin
		            led_ca = 1'b1;
                    led_cb = 1'b1;
                    led_cc = 1'b1;
                    led_cd = 1'b1;
                    led_ce = 1'b1;
                    led_cf = 1'b1;
                    led_cg = 1'b1;
		    end

	  endcase
    end
    else begin 
    case(num_set)
	     4'b0000:begin
		            led_ca = 1'b0;//[7]
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b1;//[0]
		    end
	     4'b0001:begin
		            led_ca = 1'b1;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b1;
					led_cg = 1'b1;
		    end
	     4'b0010:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b1;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b0011:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b1;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b0100:begin
		            led_ca = 1'b1;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b0101:begin
		            led_ca = 1'b0;
					led_cb = 1'b1;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b1;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b0110:begin
		            led_ca = 1'b0;
					led_cb = 1'b1;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b0111:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b1;
					led_cg = 1'b1;
		    end
	     4'b1000:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1001:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1010:begin
		            led_ca = 1'b0;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b1;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1011:begin
		            led_ca = 1'b1;
					led_cb = 1'b1;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
	     4'b1100:begin
		            led_ca = 1'b1;
					led_cb = 1'b1;
					led_cc = 1'b1;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b1101:begin
		            led_ca = 1'b1;
					led_cb = 1'b0;
					led_cc = 1'b0;
					led_cd = 1'b0;
					led_ce = 1'b0;
					led_cf = 1'b1;
					led_cg = 1'b0;
		    end
	     4'b1110:begin
		            led_ca = 1'b1;
					led_cb = 1'b1;
					led_cc = 1'b1;
					led_cd = 1'b1;
					led_ce = 1'b1;
					led_cf = 1'b1;
					led_cg = 1'b1;
		    end
	     4'b1111:begin
		            led_ca = 1'b0;
					led_cb = 1'b1;
					led_cc = 1'b1;
					led_cd = 1'b1;
					led_ce = 1'b0;
					led_cf = 1'b0;
					led_cg = 1'b0;
		    end
		    default begin
		            led_ca = 1'b1;
                    led_cb = 1'b1;
                    led_cc = 1'b1;
                    led_cd = 1'b1;
                    led_ce = 1'b1;
                    led_cf = 1'b1;
                    led_cg = 1'b1;
		    end

	  endcase
	 end
	  
end

always @(*) 
      begin
  led_show <=// {led_ca,led_cb,led_cc,led_cd,led_ce,led_cf,led_cg};
	     {1'b1,led_cg,led_cf,led_ce,led_cd,led_cc,led_cb,led_ca};
	  end
endmodule


