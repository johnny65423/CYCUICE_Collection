
module Hilo( clk, reset, dataOut, HiOut, LoOut ) ;
	input clk, reset ;

    input [63:0] dataOut ;
	output [31:0] HiOut, LoOut ;
	reg [63:0] HiLo ;
	wire [31:0] HiOut, LoOut ;
	
	always@( posedge clk or reset ) begin 
	
		if ( reset == 1'b1 ) begin 
			HiLo = 64'b0 ;
		end
		else begin
			HiLo = dataOut ;
		end

	end
	
	assign HiOut = HiLo[63:32] ;
	assign LoOut = HiLo[31:0] ;
	
endmodule 