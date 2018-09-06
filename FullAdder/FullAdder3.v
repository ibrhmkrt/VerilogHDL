//Implement the Full Adder Using Logical Gates (Structural Level)
module FullAdder(Sum,Cout,A,B,Cin);
	input A,B,Cin;
	output Sum,Cout;

	wire w1,w2,w3,w4;
	
	xor g1(w1,A,B);
	xor g2(Sum,Cin,w1);
	and g3(w2,A,B);
	and g4(w3,B,Cin);
	and g5(w4,A,Cin);
	or g6(Cout,w2,w3,w4);
endmodule
