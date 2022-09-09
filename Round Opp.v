module Round_Opp (Clk,Round_Count,Data,Key_In,Key_Out,Round_Out);
input Clk;
input [3:0]Round_Count;
input [127:0]Data;
input [127:0]Key_In;
output [127:0]Key_Out;
output [127:0]Round_Out;

wire [127:0] Sub_Bytes,Shift_Rows,Mixed_Column;

KeyGeneration t0(Round_Count,Key_In,Key_Out);
SubBytes t1(Data,Sub_Bytes);
ShiftRow t2(Sub_Bytes,Shift_Rows);
MixedColumn t3(Shift_Rows,Mixed_Column);
assign Round_Out= Key_Out^Mixed_Column;

endmodule