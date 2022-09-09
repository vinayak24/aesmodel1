module KeyGeneration(Round_Count,Key,Key_Out);    
   input [3:0] Round_Count;
   input [127:0]Key;
   output [127:0]Key_Out;
   
   wire [31:0] W0,W1,W2,W3,SB;
         
               
       assign W0 = Key[127:96];
       assign W1 = Key[95:64];
       assign W2 = Key[63:32];
       assign W3 = Key[31:0];
       
       
       assign Key_Out[127:96]= W0 ^ SB ^ rcon(Round_Count);
       assign Key_Out[95:64] = W0 ^ SB ^ rcon(Round_Count)^ W1;
       assign Key_Out[63:32] = W0 ^ SB ^ rcon(Round_Count)^ W1 ^ W2;
       assign Key_Out[31:0]  = W0 ^ SB ^ rcon(Round_Count)^ W1 ^ W2 ^ W3;
       
       
       sbox a1(.a(W3[23:16]),.c(SB[31:24]));
       sbox a2(.a(W3[15:8]),.c(SB[23:16]));
       sbox a3(.a(W3[7:0]),.c(SB[15:8]));
       sbox a4(.a(W3[31:24]),.c(SB[7:0]));
       
       
       
     function [31:0]	rcon;
      input	[3:0]	Round_Count;
      case(Round_Count)	
         4'h0: rcon=32'h01_00_00_00;
         4'h1: rcon=32'h02_00_00_00;
         4'h2: rcon=32'h04_00_00_00;
         4'h3: rcon=32'h08_00_00_00;
         4'h4: rcon=32'h10_00_00_00;
         4'h5: rcon=32'h20_00_00_00;
         4'h6: rcon=32'h40_00_00_00;
         4'h7: rcon=32'h80_00_00_00;
         4'h8: rcon=32'h1b_00_00_00;
         4'h9: rcon=32'h36_00_00_00;
         default: rcon=32'h00_00_00_00;
       endcase

     endfunction

endmodule