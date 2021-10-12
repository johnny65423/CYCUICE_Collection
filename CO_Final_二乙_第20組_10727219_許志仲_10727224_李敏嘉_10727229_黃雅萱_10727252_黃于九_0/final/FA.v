
module FullAdder(a, b, cin, carry, sum);

    input a, b, cin;
    output carry, sum;
    
    wire   e1, e2, e3, e4, e5;

    and(e1,a,b);
    and(e2,a,cin);
    and(e3,b,cin);
    or(e4,e1,e2);
    or(carry,e3,e4);
    xor(e5,a,b);
    xor(sum,e5,cin);

endmodule

