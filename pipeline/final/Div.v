
module Div( clk, reset, signal, remainder, divisor, dataOut ) ;
	input clk, reset ;
	input [5:0]signal ;
	input [31:0] remainder ;
	input [31:0] divisor ;
	output [63:0] dataOut ;


	reg [31:0] quotient ;
	reg [63:0] REM ;
	reg [63:0] DIVR ;
	reg [31:0] count ;
	reg [63:0] dataOut ;


always @( posedge clk ) begin
    if ( reset == 1'b1 ) begin
        count <= 33 ;
        quotient <= 0 ;
    	REM <= { 32'b0, remainder } ;
        DIVR <= { divisor, 32'b0 } ;

    end
    if ( DIVR == 0 ) begin 
		quotient <= 32'bx ;
		REM [31:0] <= 32'bx ;
	end
    else if(reset==1'b0)begin

		if(count!=0)begin
			REM = REM - DIVR ;
			if ( REM[63] == 1'b0 ) begin
				quotient = quotient << 1 ;
				quotient[0] = 1'b1 ;
			end

			else begin
				REM = REM + DIVR ;
				quotient = quotient << 1 ;
				quotient[0] = 1'b0 ;
			end

			DIVR = DIVR >> 1 ;
			count = count - 1 ;
		end
    end
    
end

always @( posedge clk ) begin
    dataOut [63:32] <= REM [31:0];
    dataOut [31:0] <= quotient ;

end
endmodule
