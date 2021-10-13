
module reg_MEMWB(clk,reset,en_reg,d_cin1,d_cin2,d_in1,d_in2,d_in3,d_cout1,d_cout2,d_out1,d_out2,d_out3);
	input clk,reset,en_reg;
	input d_cin1,d_cin2;
	input[31:0] d_in1,d_in2;
	input[4:0]d_in3;

	output d_cout1,d_cout2;
	output[31:0]d_out1,d_out2;
	output[4:0]d_out3;

	reg d_cout1,d_cout2;
	reg[31:0]d_out1,d_out2;
	reg[4:0]d_out3;

	always@(posedge clk)begin
		if(reset)begin
			d_out1<=32'd0;
			d_out2<=32'd0;
			d_out3<=5'd0;
			d_cout1<=1'd0;
			d_cout2<=1'd0;
		end
		else if(en_reg) begin
			d_out1<=d_in1;
			d_out2<=d_in2;
			d_out3<=d_in3;
			d_cout1<=d_cin1;
			d_cout2<=d_cin2;
		end
		
	end

endmodule