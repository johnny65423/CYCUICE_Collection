
module reg_IDEX(clk,reset,en_reg,d_cin1,d_cin2,d_cin3,d_cin4,d_cin5,d_cin6,d_cin7,d_cin8,d_cin9,d_cin10,d_in1,d_in2,d_in3,d_in4,d_in5,d_in6,d_in7,d_in8,d_in9,d_cout1,d_cout2,d_cout3,d_cout4,d_cout5,d_cout6,d_cout7,d_cout8,d_cout9,d_cout10,d_out1,d_out2,d_out3,d_out4,d_out5,d_out6,d_out7,d_out8,d_out9);
	input clk,reset,en_reg;
	input d_cin1,d_cin3,d_cin4,d_cin5,d_cin6,d_cin7,d_cin8,d_cin9,d_cin10;
	input [1:0] d_cin2;
	input[31:0] d_in1,d_in2,d_in3,d_in4,d_in9;
	input[4:0] d_in5,d_in6, d_in8;
	input[5:0] d_in7;

	output d_cout1,d_cout3,d_cout4,d_cout5,d_cout6,d_cout7,d_cout8,d_cout9,d_cout10;
	output [1:0] d_cout2;
	output[31:0] d_out1,d_out2,d_out3,d_out4,d_out9;
	output[4:0] d_out5,d_out6,d_out8;
	output[5:0] d_out7;

	reg d_cout1,d_cout3,d_cout4,d_cout5,d_cout6,d_cout7,d_cout8,d_cout9,d_cout10;
	reg [1:0] d_cout2;
	reg[31:0] d_out1,d_out2,d_out3,d_out4,d_out9;
	reg[4:0] d_out5,d_out6,d_out8;
	reg[5:0] d_out7;

	always@(posedge clk)begin
		if(reset)begin
			d_out1<=32'd0;
			d_out2<=32'd0;
			d_out3<=32'd0;
			d_out4<=32'd0;
			d_out5<=5'd0;
			d_out6<=5'd0;
			d_out7<=6'd0;
			d_out8<=5'd0;
			d_out9<=32'd0;
			d_cout1<=1'd0;
			d_cout2<=2'd0;
			d_cout3<=1'd0;
			d_cout4<=1'd0;
			d_cout5<=1'd0;
			d_cout6<=1'd0;
			d_cout7<=1'd0;
			d_cout8<=1'd0;
			d_cout9<=1'd0;
			d_cout10<=1'd0;
		end
		else if(en_reg) begin
			d_out1<=d_in1;
			d_out2<=d_in2;
			d_out3<=d_in3;
			d_out4<=d_in4;
			d_out5<=d_in5;
			d_out6<=d_in6;
			d_out7<=d_in7;
			d_out8<=d_in8;
			d_out9<=d_in9;
			d_cout1<=d_cin1;
			d_cout2<=d_cin2;
			d_cout3<=d_cin3;
			d_cout4<=d_cin4;
			d_cout5<=d_cin5;
			d_cout6<=d_cin6;
			d_cout7<=d_cin7;
			d_cout8<=d_cin8;
			d_cout9<=d_cin9;
			d_cout10<=d_cin10;
		end
		
	end

endmodule