module FullAdder_tb();
	reg A,B,Cin;
	wire Sum,Cout;

	FullAdder DUT(Sum,Cout,A,B,Cin);

	initial
	begin
		$display("Time\tA\tB\tCin\tSum\tCout");
		$monitor("%d\t%b\t%b\t%b\t%b\t%b",$time,A,B,Cin,Sum,Cout);
	end
	
	initial
	begin
		A=0;B=0;Cin=0;
		#100 A=0;B=0;Cin=1;
		#100 A=0;B=1;Cin=0;
		#100 A=0;B=1;Cin=1;
		#100 A=1;B=0;Cin=0;
		#100 A=1;B=0;Cin=1;
		#100 A=1;B=1;Cin=0;
		#100 A=1;B=1;Cin=1;
		#100 $finish;
	end
endmodule
