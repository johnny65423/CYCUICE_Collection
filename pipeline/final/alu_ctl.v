module alu_ctl(ALUOp, Funct, ALUOperation,divReset);
    input [1:0] ALUOp;
    input [5:0] Funct;
    output [2:0] ALUOperation;
    reg    [2:0] ALUOperation;
    output reg divReset;

    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_and = 6'd36;
    parameter F_or  = 6'd37;
    parameter F_slt = 6'd42;
    parameter F_srl = 6'd02;
    parameter F_mfhi = 6'd16;
    parameter F_mflo = 6'd18;

    // symbolic constants for ALU Operations
    parameter ALU_add = 3'b010;
    parameter ALU_sub = 3'b110;
    parameter ALU_and = 3'b000;
    parameter ALU_or  = 3'b001;
    parameter ALU_slt = 3'b111;
    parameter ALU_srl = 3'b011;
    parameter ALU_mfhi = 3'b100;
    parameter ALU_mflo = 3'b101;

    always @(ALUOp or Funct)
    begin
        case (ALUOp) 
            2'b00 : ALUOperation = ALU_add;
            2'b01 : ALUOperation = ALU_sub;
	2'b11 : ALUOperation = ALU_or;
            2'b10 : case (Funct) 
                        F_add : ALUOperation = ALU_add;
                        F_sub : ALUOperation = ALU_sub;
                        F_and : ALUOperation = ALU_and;
                        F_or  : ALUOperation = ALU_or;
                        F_slt : ALUOperation = ALU_slt;
	F_srl : ALUOperation = ALU_srl;
	F_mfhi : ALUOperation = ALU_mfhi;
	F_mflo : ALUOperation = ALU_mflo;
                        default ALUOperation = 3'bxxx;
                    endcase
            default ALUOperation = 3'bxxx;
        endcase

	if(Funct==6'd27)begin
		divReset<=1;
	end
	else begin
		divReset<=0;

	end

    end

endmodule

