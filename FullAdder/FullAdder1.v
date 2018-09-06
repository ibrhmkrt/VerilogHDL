//Implement the Full Adder Using Using Algorithmic Description (Behavioral Level)
module FullAdder(Sum,Cout,A,B,Cin);
	input A,B,Cin;
	output Sum,Cout;
	
	assign {Cout,Sum}=A+B+Cin;//Takes Advantage of Concatenation
endmodule
