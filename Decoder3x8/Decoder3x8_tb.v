module Decoder3x8_tb;
	wire [7:0] q;
	reg [2:0] d;
	
	Decoder3x8 dut(q,d);
      	
    initial
	begin
		    d[2]=0; d[1]=0; d[0]=0;
		#10 d[2]=0; d[1]=0; d[0]=1;
		#10 d[2]=0; d[1]=1; d[0]=0;
		#10 d[2]=0; d[1]=1; d[0]=1;
		#10 d[2]=1; d[1]=0; d[0]=0;
		#10 d[2]=1; d[1]=0; d[0]=1;
		#10 d[2]=1; d[1]=1; d[0]=0;
		#10 d[2]=1; d[1]=1; d[0]=1;
		#10 $finish;
	end
endmodule
