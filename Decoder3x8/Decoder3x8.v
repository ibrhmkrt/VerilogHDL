module Decoder3x8(q,d);
	output [7:0] q;
	input [2:0] d;

	assign q[0] = ~d[2] & ~d[1] & ~d[0];
	assign q[1] = ~d[2] & ~d[1] &  d[0];
	assign q[2] = ~d[2] &  d[1] & ~d[0];
	assign q[3] = ~d[2] &  d[1] &  d[0];
	assign q[4] =  d[2] & ~d[1] & ~d[0];
	assign q[5] =  d[2] & ~d[1] &  d[0];
	assign q[6] =  d[2] &  d[1] & ~d[0];
	assign q[7] =  d[2] &  d[1] &  d[0];
endmodule