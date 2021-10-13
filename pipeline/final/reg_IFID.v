
module reg_IFID(clk,reset,en_reg,d_in1,d_in2,d_out1,d_out2);
	input clk,reset,en_reg;
	input[31:0] d_in1,d_in2;
	output[31:0]d_out1, d_out2;
	reg[31:0]d_out1, d_out2;

	always@(posedge clk)begin
		if(reset)begin
			d_out1<=32'd0;
			d_out2<=32'd0;
		end
		else if ( en_reg ) begin
			d_out1<=d_in1;
			d_out2<=d_in2;
		end
		
	end

endmodule