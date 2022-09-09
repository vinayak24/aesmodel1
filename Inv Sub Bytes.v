module Inv_SubBytes (in,out);
  input [127:0]in;
  output [127:0]out;

Inv_S_Box S1 (
    .in(in[127:120]), 
    .out(out[127:120])
    );

Inv_S_Box S2 (
    .in(in[119:112]), 
    .out(out[119:112])
    );

Inv_S_Box S3 (
    .in(in[111:104]), 
    .out(out[111:104])
    );

Inv_S_Box S4 (
    .in(in[103:96]), 
    .out(out[103:96])
    );

Inv_S_Box S5 (
    .in(in[95:88]), 
    .out(out[95:88])
    );

Inv_S_Box S6 (
    .in(in[87:80]), 
    .out(out[87:80])
    );

Inv_S_Box S7 (
    .in(in[79:72]), 
    .out(out[79:72])
    );

Inv_S_Box S8 (
    .in(in[71:64]), 
    .out(out[71:64])
    );

Inv_S_Box S9 (
    .in(in[63:56]), 
    .out(out[63:56])
    );

Inv_S_Box S10 (
    .in(in[55:48]), 
    .out(out[55:48])
    );

Inv_S_Box S11 (
    .in(in[47:40]), 
    .out(out[47:40])
    );

Inv_S_Box S12 (
    .in(in[39:32]), 
    .out(out[39:32])
    );

Inv_S_Box S13 (
    .in(in[31:24]), 
    .out(out[31:24])
    );

Inv_S_Box S14 (
    .in(in[23:16]), 
    .out(out[23:16])
    );

Inv_S_Box S15 (
    .in(in[15:8]), 
    .out(out[15:8])
    );

Inv_S_Box S16 (
    .in(in[7:0]), 
    .out(out[7:0])
    );

endmodule
