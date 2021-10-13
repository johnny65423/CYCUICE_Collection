
module BarrelShifter16(in,ctrl,out);
input[31:0] in;
input ctrl;
output[31:0] out;

//16 bit shift right
mux2X1  mux32 (.in0(in[31]),.in1(1'b0),.sel(ctrl),.out(out[31]));
mux2X1  mux31 (.in0(in[30]),.in1(1'b0),.sel(ctrl),.out(out[30]));
mux2X1  mux30 (.in0(in[29]),.in1(1'b0),.sel(ctrl),.out(out[29]));
mux2X1  mux29 (.in0(in[28]),.in1(1'b0),.sel(ctrl),.out(out[28]));
mux2X1  mux28 (.in0(in[27]),.in1(1'b0),.sel(ctrl),.out(out[27]));
mux2X1  mux27 (.in0(in[26]),.in1(1'b0),.sel(ctrl),.out(out[26]));
mux2X1  mux26 (.in0(in[25]),.in1(1'b0),.sel(ctrl),.out(out[25]));
mux2X1  mux25 (.in0(in[24]),.in1(1'b0),.sel(ctrl),.out(out[24]));
mux2X1  mux24 (.in0(in[23]),.in1(1'b0),.sel(ctrl),.out(out[23]));
mux2X1  mux23 (.in0(in[22]),.in1(1'b0),.sel(ctrl),.out(out[22]));
mux2X1  mux22 (.in0(in[21]),.in1(1'b0),.sel(ctrl),.out(out[21]));
mux2X1  mux21 (.in0(in[20]),.in1(1'b0),.sel(ctrl),.out(out[20]));
mux2X1  mux20 (.in0(in[19]),.in1(1'b0),.sel(ctrl),.out(out[19]));
mux2X1  mux19 (.in0(in[18]),.in1(1'b0),.sel(ctrl),.out(out[18]));
mux2X1  mux18 (.in0(in[17]),.in1(1'b0),.sel(ctrl),.out(out[17]));
mux2X1  mux17 (.in0(in[16]),.in1(1'b0),.sel(ctrl),.out(out[16]));
mux2X1  mux16 (.in0(in[15]),.in1(in[31]),.sel(ctrl),.out(out[15]));
mux2X1  mux15 (.in0(in[14]),.in1(in[30]),.sel(ctrl),.out(out[14]));
mux2X1  mux14 (.in0(in[13]),.in1(in[29]),.sel(ctrl),.out(out[13]));
mux2X1  mux13 (.in0(in[12]),.in1(in[28]),.sel(ctrl),.out(out[12]));
mux2X1  mux12 (.in0(in[11]),.in1(in[27]),.sel(ctrl),.out(out[11]));
mux2X1  mux11 (.in0(in[10]),.in1(in[26]),.sel(ctrl),.out(out[10]));
mux2X1  mux10 (.in0(in[9]),.in1(in[25]),.sel(ctrl),.out(out[9]));
mux2X1  mux09 (.in0(in[8]),.in1(in[24]),.sel(ctrl),.out(out[8]));
mux2X1  mux08 (.in0(in[7]),.in1(in[23]),.sel(ctrl),.out(out[7]));
mux2X1  mux07 (.in0(in[6]),.in1(in[22]),.sel(ctrl),.out(out[6]));
mux2X1  mux06 (.in0(in[5]),.in1(in[21]),.sel(ctrl),.out(out[5]));
mux2X1  mux05 (.in0(in[4]),.in1(in[20]),.sel(ctrl),.out(out[4]));
mux2X1  mux04 (.in0(in[3]),.in1(in[19]),.sel(ctrl),.out(out[3]));
mux2X1  mux03 (.in0(in[2]),.in1(in[18]),.sel(ctrl),.out(out[2]));
mux2X1  mux02 (.in0(in[1]),.in1(in[17]),.sel(ctrl),.out(out[1]));
mux2X1  mux01 (.in0(in[0]),.in1(in[16]),.sel(ctrl),.out(out[0]));

endmodule