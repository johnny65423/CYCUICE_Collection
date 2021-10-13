module nop( clk, reset, instr, en_reg, NOP,read  );
	input clk, reset;
   	 input[31:0] instr;
	output en_reg;
	output NOP,read;
	reg [5:0] count;
	reg [2:0] max;
	reg en_reg, NOP,read;
	reg pass,sp;


	always @( posedge clk or instr ) begin
		if(reset)begin
			count<=0;
			//en_reg<=0;
			pass<=1'b1;
			//NOP<=1'd0;
			max<=3'd4;
		end
		else begin
			if(instr[31]==1'd0||instr[31]==1'd1)begin
				sp<=0;

				 if(instr[31:26]==6'd4 && pass == 1'b1 ) begin
					count<=6'd3;
					en_reg<=1'd1;
					pass<=1'b0;
				end
				else if(instr[31:26]==6'd2 && pass == 1'b1 ) begin
					count<=6'd3;
					en_reg<=1'd0;
					pass<=1'b0;
				end
				else if(instr[31:26]==6'd0&&instr[5:0]==6'd8&& pass==1'b1) begin
					count<=6'd3;
					en_reg<=1'd0;
					pass<=1'b0;
				end
				else if(instr[31:26]==6'd0&&instr[5:0]==6'd27&& pass==1'b1) begin
					count<=6'd34;
					en_reg<=1'd1;
					pass<=1'b0;
				end
				else if( pass == 1'b1 ) begin
					count<=0;
					en_reg<=1'd1;
					NOP<=1'd0;
					pass<=1'b1;
				end
			end
			else begin
				count<=0;
				en_reg<=0;
				sp<=1;
			end

		end
	end

	always @( posedge clk ) begin

		if(count!=3'd0)begin
			count<=count-1;
			NOP<=1'd1;
		end
		else if (count==3'd0&&sp==0) begin
			count<=0;
			NOP<=1'd0;
			pass<=1'b1 ;
		end


		if (count==3'd1) begin
			en_reg<=1'd1;
		end

	end

endmodule
