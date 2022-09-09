module Inv_Round_Opp (Clk,Data,Key_In,Round_Out);
input Clk;
input [127:0]Data;
input [127:0]Key_In;
output [127:0]Round_Out;

wire [127:0] ISub_Bytes,IShift_Rows,Add_Round;

//KeyGeneration t0(Round_Count,Key_In,Key_Out);

Inv_ShiftRow t2(Data,IShift_Rows);
Inv_SubBytes t1(IShift_Rows,ISub_Bytes);
assign Add_Round= Key_In^ISub_Bytes;
Inv_MixedColumn t3(Add_Round,Round_Out);

endmodule