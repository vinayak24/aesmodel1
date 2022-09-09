module AES_Top_Module_N (Clk,Plain_Text_In,Key_Tx,Key_Rx,Cipher_Text,Plain_Text_Out);
    input Clk;
    input [127:0] Plain_Text_In;
    input [127:0] Key_Tx,Key_Rx;
    output[127:0] Cipher_Text,Plain_Text_Out;
    
    wire [127:0] R0,R1,R2,R3,R4,R5,R6,R7,R8,R9;
    wire [127:0] R00,R11,R22,R33,R44,R55,R66,R77,R88,R99;
    wire [127:0] Key_Out1,Key_Out2,Key_Out3,Key_Out4,Key_Out5,Key_Out6,Key_Out7,Key_Out8,Key_Out9,Key_Out10;
	 
	 //encryption 
	 
	 assign R0 = Plain_Text_In^Key_Tx;
	 
    Round_Opp  M1(.Clk(Clk),.Round_Count(4'b0000),.Data(R0),.Key_In(Key_Tx),.Key_Out(Key_Out1),.Round_Out(R1));
    Round_Opp  M2(.Clk(Clk),.Round_Count(4'b0001),.Data(R1),.Key_In(Key_Out1),.Key_Out(Key_Out2),.Round_Out(R2));
    Round_Opp  M3(.Clk(Clk),.Round_Count(4'b0010),.Data(R2),.Key_In(Key_Out2),.Key_Out(Key_Out3),.Round_Out(R3));
    Round_Opp  M4(.Clk(Clk),.Round_Count(4'b0011),.Data(R3),.Key_In(Key_Out3),.Key_Out(Key_Out4),.Round_Out(R4));
    Round_Opp  M5(.Clk(Clk),.Round_Count(4'b0100),.Data(R4),.Key_In(Key_Out4),.Key_Out(Key_Out5),.Round_Out(R5));
    Round_Opp  M6(.Clk(Clk),.Round_Count(4'b0101),.Data(R5),.Key_In(Key_Out5),.Key_Out(Key_Out6),.Round_Out(R6));
    Round_Opp  M7(.Clk(Clk),.Round_Count(4'b0110),.Data(R6),.Key_In(Key_Out6),.Key_Out(Key_Out7),.Round_Out(R7));
    Round_Opp  M8(.Clk(Clk),.Round_Count(4'b0111),.Data(R7),.Key_In(Key_Out7),.Key_Out(Key_Out8),.Round_Out(R8));
    Round_Opp  M9(.Clk(Clk),.Round_Count(4'b1000),.Data(R8),.Key_In(Key_Out8),.Key_Out(Key_Out9),.Round_Out(R9));
    Round_Last M10(.Clk(Clk),.Round_Count(4'b1001),.RIn(R9),.KeyLastIn(Key_Out9),.Key_Out(Key_Out10),.Out(Cipher_Text));

    
    
    //decryption
  	 assign R00 = Cipher_Text^Key_Out10;
	 
    Inv_Round_Opp  Mi1(.Clk(Clk),.Data(R00),.Key_In(Key_Out9),.Round_Out(R11));
    Inv_Round_Opp  Mi2(.Clk(Clk),.Data(R11),.Key_In(Key_Out8),.Round_Out(R22));
    Inv_Round_Opp  Mi3(.Clk(Clk),.Data(R22),.Key_In(Key_Out7),.Round_Out(R33));
    Inv_Round_Opp  Mi4(.Clk(Clk),.Data(R33),.Key_In(Key_Out6),.Round_Out(R44));
    Inv_Round_Opp  Mi5(.Clk(Clk),.Data(R44),.Key_In(Key_Out5),.Round_Out(R55));
    Inv_Round_Opp  Mi6(.Clk(Clk),.Data(R55),.Key_In(Key_Out4),.Round_Out(R66));
    Inv_Round_Opp  Mi7(.Clk(Clk),.Data(R66),.Key_In(Key_Out3),.Round_Out(R77));
    Inv_Round_Opp  Mi8(.Clk(Clk),.Data(R77),.Key_In(Key_Out2),.Round_Out(R88));
    Inv_Round_Opp  Mi9(.Clk(Clk),.Data(R88),.Key_In(Key_Out1),.Round_Out(R99));
    
    Inv_Round_Last Mi10(.Clk(Clk),.RIn(R99),.KeyIn(Key_Rx),.Out(Plain_Text_Out));


endmodule
