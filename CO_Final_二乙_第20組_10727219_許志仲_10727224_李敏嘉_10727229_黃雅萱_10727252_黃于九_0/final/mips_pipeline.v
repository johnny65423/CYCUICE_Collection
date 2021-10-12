module mips_pipeline( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr;

	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	wire divReset ;
	wire[31:0] instr2ID,pc_incr2ID;

	wire [5:0]functEX;

	wire [31:0] rfile_rd1EX,rfile_rd2EX,pc_incr2EX,extend_immed2EX;
	wire [4:0] rt2EX,rd2EX, shamtEX;
	wire RegDstEX, ALUSrcEX, BranchEX, MemReadEX, MemWriteEX, RegWriteEX, MemtoRegEX,JumpEX,JREX;
	wire [1:0] ALUOpEX;	

	wire [31:0]  alu_out2MEM, rfile_rd2MEM, rfile_rd1MEM;
	wire[4:0]rfile_wn2MEM;
	wire Zero2MEM, BranchMEM, MemReadMEM, MemWriteMEM, RegWriteMEM, MemtoRegMEM,JRMEM;

	wire [31:0] b_tgt2MEM, dmem_rdataWB, alu_out2WB;
	wire [4:0] rfile_wn2WB;
	wire RegWriteWB, MemtoRegWB;	


	// module instantiations
	
////////////////////////////////////////////////////     IF     //////////////////////////////////////////////////////////////////////////////////////////

	// jump offset shifter & concatenation

wire NOP, en_pc, nop_pc ,JR,stop,read;
wire [31:0] instrInMEM, pc_final, jump_addrEX,jump_addrMEM;

  	assign jumpoffset = instr2ID[25:0];
 	assign jump_addr = { pc_incr2ID[31:28], jumpoffset <<2 };

	nop nop( .clk(clk), .reset(rst), .instr(instrInMEM), .en_reg(en_pc), .NOP(NOP),.read(read)  );

	mux2 #(32) INSTRMUX( .sel(NOP), .a(instrInMEM), .b(32'd0), .y(instr) );

	mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt2MEM), .y(branch_addr) );

	mux2 #(32) jr_pc_MUX( .sel(JRMEM), .a(pc_next), .b(rfile_rd1MEM), .y(pc_final) );

	mux2 #(32) J_pc_MUX( .sel(JumpMEM), .a(branch_addr), .b(jump_addrMEM), .y(pc_next) );

	reg32 PC( .clk(clk), .rst(rst), .en_reg(en_pc), .d_in(pc_final), .d_out(pc) );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr), .sel(~NOP) );

	memory InstrMem( .clk(clk), .MemRead(~NOP), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instrInMEM) );

	reg_IFID IFID( .clk(clk), .reset(rst), .en_reg(1'b1),
		.d_in1(pc_incr), .d_in2(instr),
		 .d_out1(pc_incr2ID), .d_out2(instr2ID) );

////////////////////////////////////////////////////     ID     //////////////////////////////////////////////////////////////////////////////////////////

  	  assign opcode = instr2ID[31:26];
   	 assign rs = instr2ID[25:21];
   	 assign rt = instr2ID[20:16];
    	assign rd = instr2ID[15:11];
   	 assign shamt = instr2ID[10:6];
   	 assign funct = instr2ID[5:0];
   	 assign immed = instr2ID[15:0];
  	//  assign jumpoffset = instr2ID[25:0];

	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );

	reg_file RegFile( .clk(clk), .RegWrite(RegWriteWB), .RN1(rs), .RN2(rt), .WN(rfile_wn2WB), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

  	  control_single CTL(.instr(instr2ID), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp),.Jr(JR));

	reg_IDEX IDEX( .clk(clk), .reset(rst), .en_reg(1'b1),
			.d_cin1(RegDst), .d_cin2(ALUOp), .d_cin3(ALUSrc), .d_cin4(Branch), .d_cin5(MemRead), .d_cin6(MemWrite), .d_cin7(RegWrite), .d_cin8(MemtoReg),.d_cin9(Jump),.d_cin10(JR),
			.d_in1(pc_incr2ID), .d_in2(rfile_rd1), .d_in3(rfile_rd2), .d_in4(extend_immed) , .d_in5(rt), .d_in6(rd), .d_in7(funct), .d_in8(shamt),.d_in9(jump_addr),
			.d_cout1(RegDstEX), .d_cout2(ALUOpEX), .d_cout3(ALUSrcEX), .d_cout4(BranchEX), .d_cout5(MemReadEX), .d_cout6(MemWriteEX), .d_cout7(RegWriteEX), .d_cout8(MemtoRegEX), .d_cout9(JumpEX),.d_cout10(JREX),
			 .d_out1(pc_incr2EX), .d_out2(rfile_rd1EX), .d_out3(rfile_rd2EX), .d_out4(extend_immed2EX) , .d_out5(rt2EX), .d_out6(rd2EX), .d_out7(functEX), .d_out8(shamtEX),.d_out9(jump_addrEX) );

////////////////////////////////////////////////////     EX     //////////////////////////////////////////////////////////////////////////////////////////

   	 assign b_offset = extend_immed2EX << 2;    // branch offset shifter

    	add32 BRADD( .a(pc_incr2EX), .b(b_offset), .result(b_tgt), .sel(1'b1) );

	bit32ALU ALU( .clk(clk), .sel(Operation), .a(rfile_rd1EX), .b(alu_b), .shamt(shamtEX), .sum(alu_out), .Zero(Zero), .divReset(divReset) );

    	mux2 #(32) ALUMUX( .sel(ALUSrcEX), .a(rfile_rd2EX), .b(extend_immed2EX), .y(alu_b) );

    	alu_ctl ALUCTL( .ALUOp(ALUOpEX), .Funct(functEX), .ALUOperation(Operation), .divReset(divReset) );

    	mux2 #(5) RFMUX( .sel(RegDstEX), .a(rt2EX), .b(rd2EX), .y(rfile_wn) );

	reg_EXMEM EXMEM( .clk(clk), .reset(rst), .en_reg(1'b1),
				.d_cin1(BranchEX), .d_cin2(MemReadEX), .d_cin3(MemWriteEX), .d_cin4(RegWriteEX), .d_cin5(MemtoRegEX),.d_cin6(JumpEX),.d_cin7(JREX),
				.d_in1(b_tgt), .d_in2(Zero), .d_in3(alu_out), .d_in4(rfile_rd2EX), .d_in5(rfile_wn),.d_in6(jump_addrEX),.d_in7(rfile_rd1EX),
				.d_cout1(BranchMEM), .d_cout2(MemReadMEM), .d_cout3(MemWriteMEM), .d_cout4(RegWriteMEM), .d_cout5(MemtoRegMEM),.d_cout6(JumpMEM),.d_cout7(JRMEM),
				.d_out1(b_tgt2MEM), .d_out2(Zero2MEM), .d_out3(alu_out2MEM), .d_out4(rfile_rd2MEM), .d_out5(rfile_wn2MEM),.d_out6(jump_addrMEM),.d_out7(rfile_rd1MEM) );

////////////////////////////////////////////////////     MEM     //////////////////////////////////////////////////////////////////////////////////////////

   	 and BR_AND(PCSrc, BranchMEM, Zero2MEM);

	memory DatMem( .clk(clk), .MemRead(MemReadMEM), .MemWrite(MemWriteMEM), .wd(rfile_rd2MEM), 
				   .addr(alu_out2MEM), .rd(dmem_rdata) );	

	reg_MEMWB MEMWB( .clk(clk), .reset(rst), .en_reg(1'b1),
				.d_cin1(RegWriteMEM), .d_cin2(MemtoRegMEM),
				.d_in1(dmem_rdata), .d_in2(alu_out2MEM), .d_in3(rfile_wn2MEM),
				.d_cout1(RegWriteWB), .d_cout2(MemtoRegWB),
				.d_out1(dmem_rdataWB), .d_out2(alu_out2WB), .d_out3(rfile_wn2WB) );

////////////////////////////////////////////////////     WB     //////////////////////////////////////////////////////////////////////////////////////////
	

  	  mux2 #(32) WRMUX( .sel(MemtoRegWB), .a(alu_out2WB), .b(dmem_rdataWB), .y(rfile_wd) );

////////////////////////////////////////////////////     DIV     //////////////////////////////////////////////////////////////////////////////////////////
				   
endmodule
