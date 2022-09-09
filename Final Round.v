module Round_Last(Clk,Round_Count,RIn,KeyLastIn,Key_Out,Out);
  input Clk;
  input [3:0]Round_Count;
  input [127:0]RIn;
  input [127:0]KeyLastIn;
  output [127:0]Key_Out,Out;
  wire [127:0] SubBytes,SR;
  
  KeyGeneration M0(Round_Count,KeyLastIn,Key_Out);
  SubBytes M1(RIn,SubBytes);
  ShiftRow M2(SubBytes,SR);
  assign Out= Key_Out^SR;
  
endmodule