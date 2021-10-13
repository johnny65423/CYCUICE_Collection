
module BarrelShifter(in, ctrl, out);

    input  [31:0] in;
    input [4:0] ctrl;
    output [31:0] out;
    wire [31:0] a,b,c,d;
	wire [31:0] temp ;

    BarrelShifter1 U1(in,ctrl[0],a);
    BarrelShifter2 U2(a,ctrl[1],b);
    BarrelShifter4 U3(b,ctrl[2],c);
    BarrelShifter8 U4(c,ctrl[3],d);
    BarrelShifter16 U5(d,ctrl[4],out);

endmodule