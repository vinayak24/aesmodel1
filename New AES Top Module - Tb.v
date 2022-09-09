module AES_Top_Module_Tb ();
    reg Clk;
    reg [127:0] Plain_Text_In;
    reg [127:0] Key_Tx,Key_Rx;
    wire [127:0] Cipher_Text,Plain_Text_Out;



    AES_Top_Module_N M0 (Clk,Plain_Text_In,Key_Tx,Key_Rx,Cipher_Text,Plain_Text_Out);



initial
begin
Clk=0;
Key_Tx=128'h00004453454320564C53492050726F6A;
Key_Rx=128'h00004453454320564C53492050726F6A;
Plain_Text_In=        128'h00004453454320123456789012345678; 
   
end

always #5 Clk = ~Clk;

endmodule
