//cin.cout類為控制訊號們
//其他就是一般輸入輸出

module reg_EXMEM(clk,reset,en_reg,d_cin1,d_cin2,d_cin3,d_cin4,d_cin5,d_cin6,d_cin7,d_in1,d_in2,d_in3,d_in4,d_in5,d_in6,d_in7,d_cout1,d_cout2,d_cout3,d_cout4,d_cout5,d_cout6,d_cout7,d_out1,d_out2,d_out3,d_out4,d_out5,d_out6,d_out7);
	input clk,reset,en_reg;
	input d_cin1,d_cin2,d_cin3,d_cin4,d_cin5,d_cin6,d_cin7;
	input[31:0] d_in1,d_in4,d_in3,d_in6,d_in7;
	input[4:0] d_in5;
	input d_in2;

	output d_cout1,d_cout2,d_cout3,d_cout4,d_cout5,d_cout6,d_cout7;
	output[31:0] d_out1,d_out4,d_out3,d_out6,d_out7;
	output[4:0] d_out5;
	output d_out2;

	reg d_cout1,d_cout2,d_cout3,d_cout4,d_cout5,d_cout6,d_cout7;
	reg[31:0] d_out1,d_out4,d_out3,d_out6,d_out7;
	reg[4:0] d_out5;
	reg d_out2;

	always@(posedge clk )begin
		if(reset)begin
			d_out1<=32'd0;
			d_out2<=1'd0;
			d_out3<=32'd0;
			d_out4<=32'd0;
			d_out5<=5'd0;
			d_out6<=32'd0;
			d_out7<=32'd0;
			d_cout1<=1'd0;
			d_cout2<=1'd0;
			d_cout3<=1'd0;
			d_cout4<=1'd0;
			d_cout5<=1'd0;
			d_cout6<=1'd0;
			d_cout7<=1'd0;
		end
		else if(en_reg) begin
			d_out1<=d_in1;
			d_out2<=d_in2;
			d_out3<=d_in3;
			d_out4<=d_in4;
			d_out5<=d_in5;
			d_out6<=d_in6;
			d_out7<=d_in7;
			d_cout1<=d_cin1;
			d_cout2<=d_cin2;
			d_cout3<=d_cin3;
			d_cout4<=d_cin4;
			d_cout5<=d_cin5;
			d_cout6<=d_cin6;
			d_cout7<=d_cin7;
		end
		
	end

endmodule