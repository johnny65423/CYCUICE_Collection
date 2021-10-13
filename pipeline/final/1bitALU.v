
module bit1ALU(a, b, cin, less, sel, invert, cout, sum);
    input a, b, cin, invert, less;
    input[2:0] sel;
    output cout, sum;
    
    wire   tempb;

    assign tempb=b^invert;

    wire  addout, subout;
    wire addsum, subsum, andsum, orsum, sltsum;

        FullAdder add(.a(a), .b(tempb), .cin(cin), .carry(addout), .sum(addsum));
        FullAdder sub(.a(a), .b(tempb), .cin(cin), .carry(subout), .sum(subsum));
        And andlogic(.a(a), .b(b), .out(andsum));
        Or orlogic(.a(a), .b(b), .out(orsum));
        Slt slt(.less(less), .sum(sltsum));

    assign sum=(sel==3'b010)?addsum:
                       (sel==3'b110)?subsum:
                       (sel==3'b000)?andsum:
                       (sel==3'b001)?orsum:
			(sel==3'b111)?sltsum:1'd0;


    assign cout=(sel==3'b010)?addout:
                       (sel==3'b110 || sel==3'b111)?subout:1'b0;


endmodule

