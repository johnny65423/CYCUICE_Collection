
module bit32ALU(clk,sel, a, b, shamt, sum, Zero, divReset);
    input[31:0] a, b;
    wire invert;
    input[2:0] sel;
	input[4:0] shamt;
input divReset,clk;
    wire set, cout;
    output[31:0] sum;
	output Zero;
	wire[31:0] alu_out, srl_out;
    wire [31:0] carry;
    	wire [31:0] HiOut, LoOut;
	wire [63:0] DivAns ;
	wire [5:0]funct;
	assign invert = ( sel == 3'b110 || sel == 3'b111 ) ? 1'b1 : 1'b0;

    bit1ALU    ALU0(.a(a[0]), .b(b[0]), .cin(invert), .less(set), .sel(sel), .invert(invert), .cout(carry[0]), .sum(alu_out[0]));
    bit1ALU    ALU1(.a(a[1]), .b(b[1]), .cin(carry[0]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[1]), .sum(alu_out[1]));
    bit1ALU    ALU2(.a(a[2]), .b(b[2]), .cin(carry[1]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[2]), .sum(alu_out[2]));
    bit1ALU    ALU3(.a(a[3]), .b(b[3]), .cin(carry[2]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[3]), .sum(alu_out[3]));
    bit1ALU    ALU4(.a(a[4]), .b(b[4]), .cin(carry[3]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[4]), .sum(alu_out[4]));
    bit1ALU    ALU5(.a(a[5]), .b(b[5]), .cin(carry[4]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[5]), .sum(alu_out[5]));
    bit1ALU    ALU6(.a(a[6]), .b(b[6]), .cin(carry[5]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[6]), .sum(alu_out[6]));
    bit1ALU    ALU7(.a(a[7]), .b(b[7]), .cin(carry[6]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[7]), .sum(alu_out[7]));
    bit1ALU    ALU8(.a(a[8]), .b(b[8]), .cin(carry[7]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[8]), .sum(alu_out[8]));
    bit1ALU    ALU9(.a(a[9]), .b(b[9]), .cin(carry[8]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[9]), .sum(alu_out[9]));
    bit1ALU    ALU10(.a(a[10]), .b(b[10]), .cin(carry[9]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[10]), .sum(alu_out[10]));
    bit1ALU    ALU11(.a(a[11]), .b(b[11]), .cin(carry[10]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[11]), .sum(alu_out[11]));
    bit1ALU    ALU12(.a(a[12]), .b(b[12]), .cin(carry[11]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[12]), .sum(alu_out[12]));
    bit1ALU    ALU13(.a(a[13]), .b(b[13]), .cin(carry[12]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[13]), .sum(alu_out[13]));
    bit1ALU    ALU14(.a(a[14]), .b(b[14]), .cin(carry[13]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[14]), .sum(alu_out[14]));
    bit1ALU    ALU15(.a(a[15]), .b(b[15]), .cin(carry[14]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[15]), .sum(alu_out[15]));
    bit1ALU    ALU16(.a(a[16]), .b(b[16]), .cin(carry[15]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[16]), .sum(alu_out[16]));
    bit1ALU    ALU17(.a(a[17]), .b(b[17]), .cin(carry[16]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[17]), .sum(alu_out[17]));
    bit1ALU    ALU18(.a(a[18]), .b(b[18]), .cin(carry[17]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[18]), .sum(alu_out[18]));
    bit1ALU    ALU19(.a(a[19]), .b(b[19]), .cin(carry[18]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[19]), .sum(alu_out[19]));
    bit1ALU    ALU20(.a(a[20]), .b(b[20]), .cin(carry[19]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[20]), .sum(alu_out[20]));
    bit1ALU    ALU21(.a(a[21]), .b(b[21]), .cin(carry[20]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[21]), .sum(alu_out[21]));
    bit1ALU    ALU22(.a(a[22]), .b(b[22]), .cin(carry[21]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[22]), .sum(alu_out[22]));
    bit1ALU    ALU23(.a(a[23]), .b(b[23]), .cin(carry[22]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[23]), .sum(alu_out[23]));
    bit1ALU    ALU24(.a(a[24]), .b(b[24]), .cin(carry[23]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[24]), .sum(alu_out[24]));
    bit1ALU    ALU25(.a(a[25]), .b(b[25]), .cin(carry[24]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[25]), .sum(alu_out[25]));
    bit1ALU    ALU26(.a(a[26]), .b(b[26]), .cin(carry[25]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[26]), .sum(alu_out[26]));
    bit1ALU    ALU27(.a(a[27]), .b(b[27]), .cin(carry[26]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[27]), .sum(alu_out[27]));
    bit1ALU    ALU28(.a(a[28]), .b(b[28]), .cin(carry[27]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[28]), .sum(alu_out[28]));
    bit1ALU    ALU29(.a(a[29]), .b(b[29]), .cin(carry[28]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[29]), .sum(alu_out[29]));
    bit1ALU    ALU30(.a(a[30]), .b(b[30]), .cin(carry[29]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[30]), .sum(alu_out[30]));
    bit31ALU    ALU31(.a(a[31]), .b(b[31]), .cin(carry[30]), .less(1'b0), .sel(sel), .invert(invert), .cout(carry[31]), .sum(alu_out[31]), .set(set));

	BarrelShifter srl(.in(b), .ctrl(shamt), .out(srl_out) );

	Div DIV( .clk(clk), .reset(divReset), .signal(funct), .remainder(a), .divisor(b), .dataOut(DivAns) ); 
	Hilo HILO( .clk(clk), .reset(divReset), .dataOut(DivAns), .HiOut(HiOut), .LoOut(LoOut) );


	assign sum=(sel==3'b011)?srl_out:
		(sel==3'b100)?HiOut:
		(sel==3'b101)?LoOut:alu_out;

	assign Zero=(sum==32'd0)?1'd1:1'd0;

endmodule

