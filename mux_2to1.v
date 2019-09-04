module mux_2to1(in0, in1, sel, out);
    input  in0, in1, sel;
    output out;
 
    wire nsel;
    wire a0, a1;
 
    not not1(nsel, sel);
    and and1(a0, in0, nsel);
    and and2(a1, in1, sel);
    or  or1 (out, a0, a1);
endmodule