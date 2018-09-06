module Arbiter_FSM(
clock,//Clock
reset,//Active High, Synchronous Reset
req_0,//Request 0
req_1,//Request 1
gnt_0,//Grant 0
gnt_1 //Grant 1
);

	//=============Input Ports===========================//
	input clock,reset,req_0,req_1;

	//=============Output Ports==========================//
	output gnt_0,gnt_1;

	//=============Output Ports Data Type================//
	reg gnt_0,gnt_1;

	//===============One Hot State Encoding==============//
	parameter IDLE=1; //3'b001;
	parameter GNT0=2; //3'b010;
	parameter GNT1=4; //3'b100 ;

	//=============State Registers=======================//
	reg [2:0] present_state;
	reg [2:0] next_state;

	//========Update Present States (Sequential)=========//
	always @(posedge clock)
		if(reset==1'b1)
			present_state<=IDLE;
		else
			present_state<=next_state;

	//===Next State and Output Logic (Combinational)=====//
	//================(Mealy Machine)====================//
	always @(present_state or req_0 or req_1)
	begin
		case(present_state)
 			IDLE: 
				if(req_0==1'b1) 
				begin
					next_state=GNT0;
					gnt_0=1;
					gnt_1=0;
				end 
 				else if(req_1==1'b1) 
 				begin
					next_state=GNT1;
					gnt_1=1; 
					gnt_0=0;
				end 
 				else 
 				begin
					next_state=IDLE;
					gnt_0=0;
					gnt_1=0;
				end
 			GNT0: 
				if(req_0==1'b1) 
 				begin
					next_state=GNT0;
					gnt_0=1;
					gnt_1=0;
				end 
				else 
				begin
					next_state=IDLE;
					gnt_0=0;
					gnt_1=0;                  			
				end
			GNT1: 
				if(req_1 == 1'b1) 
				begin
					next_state=GNT1;
					gnt_1=1;
					gnt_0=0;
				end 
				else 
				begin
					next_state=IDLE;
					gnt_0=0; 
					gnt_1=0;
				end
			default: 
				begin     		
					next_state=IDLE;
					gnt_0=0;
					gnt_1=0;
				end
 		endcase
 	end 
 endmodule
