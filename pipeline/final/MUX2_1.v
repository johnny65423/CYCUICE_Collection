
module mux2X1(out,in1,in0,sel);

    input in1,in0,sel;
    output out;
    
    assign out=(sel)?in1:in0; 

endmodule