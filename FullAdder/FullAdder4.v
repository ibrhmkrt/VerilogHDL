//Implement the Full Adder Using Procedural Assignment (Truth Table)
module FullAdder(Sum,Cout,A,B,Cin);
	input A,B,Cin;
	output Sum,Cout;
	
	reg Sum,Cout;

	always @(A or B or Cin)//always @(A|B|Cin)//always @*
		case ({A,B,Cin})
			3'b000:
				begin
					Sum=0;
					Cout=0;
				end
			3'b001:
				begin
					Sum=1;
					Cout=0;
				end
			3'b010:
				begin
					Sum=1;
					Cout=0;
				end
			3'b011:
				begin
					Sum=0;
					Cout=1;
				end
			3'b100:
				begin
					Sum=1;
					Cout=0;
				end
			3'b101:
				begin
					Sum=0;
					Cout=1;
				end
			3'b110:
				begin
					Sum=0;
					Cout=1;
				end
			3'b111:
				begin
					Sum=1;
					Cout=1;
				end
		endcase
endmodule
