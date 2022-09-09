module Inv_MixedColumn (DataIn,DataOut);
  input [127:0] DataIn;
  output [127:0] DataOut;
  
S_Inv_mixcolumn_word word1 (
    .a(DataIn[127:120]), 
    .b(DataIn[119:112]), 
    .c(DataIn[111:104]), 
    .d(DataIn[103:96]), 
    .out(DataOut[127:96])
    );

S_Inv_mixcolumn_word word2 (
    .a(DataIn[95:88]), 
    .b(DataIn[87:80]), 
    .c(DataIn[79:72]), 
    .d(DataIn[71:64]), 
    .out(DataOut[95:64])
    );


S_Inv_mixcolumn_word word3 (
    .a(DataIn[63:56]), 
    .b(DataIn[55:48]), 
    .c(DataIn[47:40]), 
    .d(DataIn[39:32]), 
    .out(DataOut[63:32])
    );


S_Inv_mixcolumn_word word4 (
    .a(DataIn[31:24]), 
    .b(DataIn[23:16]), 
    .c(DataIn[15:8]), 
    .d(DataIn[7:0]), 
    .out(DataOut[31:0])
    );

endmodule


module S_Inv_mixcolumn_word(a,b,c,d,out);
  input [7:0]a,b,c,d;
  output [31:0]out;
  
S_Inv_Mix_Column byte0 (
    .a(a), 
    .b(b), 
    .c(c), 
    .d(d), 
    .Dec(out[31:24])
    );
    
    
S_Inv_Mix_Column byte1 (
    .a(b), 
    .b(c), 
    .c(d), 
    .d(a), 
    .Dec(out[23:16])
    );


S_Inv_Mix_Column byte2 (
    .a(c), 
    .b(d), 
    .c(a), 
    .d(b), 
    .Dec(out[15:8])
    );


S_Inv_Mix_Column byte3 (
    .a(d), 
    .b(a), 
    .c(b), 
    .d(c), 
    .Dec(out[7:0])
    );

endmodule




module S_Inv_Mix_Column(a,b,c,d,Dec);
  input [7:0]a,b,c,d;
  output [7:0]Dec;
  wire [7:0]w1,w2,w3,w4,w5,w6,w7,w8,s1,s2,Enc;
   
assign w1=a^b;
assign w2=a^c;
assign w3=c^d;
assign s1=b^w3;

S_X_time xtime1  (
    .in(w1), 
    .out(w4)
    );

S_X_time xtime2  (
    .in(w3), 
    .out(w5)
    );
assign s2=w2^w5;
assign w6=s2^w4;
S_X_time xtime3  (
    .in(w6), 
    .out(w7)
    );
S_X_time xtime4  (
    .in(w7), 
    .out(w8)
    );
assign Enc=s1^w4;
assign Dec=w8^Enc;

endmodule


module S_X_time(in,out);
  input [7:0]in;
  output [7:0]out;
  xor x1(out[4],in[7],in[3]);
  xor x2(out[3],in[7],in[2]);
  xor x3(out[1],in[7],in[0]);
  assign out[0]=in[7];
  assign out[2]=in[1];
  assign out[5]=in[4]; 
  assign out[6]=in[5];
  assign out[7]=in[6]; 
endmodule