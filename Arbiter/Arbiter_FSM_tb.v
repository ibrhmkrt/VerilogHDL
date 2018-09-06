module Arbiter_FSM_tb();
	reg clock,reset,req_0,req_1;
	wire gnt_0,gnt_1;
	
	reg [15:0] request0Vector,request1Vector;
	integer i;//loop variable

	Arbiter_FSM DUT(clock,reset,req_0,req_1,gnt_0,gnt_1);
	
	initial
	begin
		$display("Time\tPS\tRequest0\tRequest1\tNS\tGrant0\tGrant1");
		$monitor("%d\t%d\t%b\t%b\t%d\t%b\t%b",$time,DUT.present_state,req_0,req_1,DUT.next_state,gnt_0,gnt_1);
	end
	
	initial
	begin
		clock=0;
		reset=1;		
		#7 reset=0;//After catching the first rising edge of the clock			
	end
	
	always
		#5 clock=~clock;
		
	initial
	begin
		request0Vector=16'b1010_1011_1010_1001;
		request1Vector=16'b0110_1110_1011_1011;		
		for(i=0;i<16;i=i+1)
		begin
			req_0=request0Vector[i];
			req_1=request1Vector[i];
			if(i==0)
				#6;
			else
				#10;		
		end
		$finish;
	end
endmodule
