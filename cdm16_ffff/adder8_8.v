
module fulladder(a,b,cin,sum,cout);
        input a,b,cin;
        output sum,cout;
        assign sum=(a^b)^cin;
        assign cout=(a&b) || (a^b)&cin ;
endmodule

module blockSize8(a,b,cin,sum,cout);
	input [7:0] a,b;
	input cin;
	output [7:0] sum;
	output cout;
	wire x1,x2,x3,x4,x5,x6,x7,x8,y1,y2,y3,y4,y5,y6,y7,y8;
	assign x1 = a[0];
	assign x2 = a[1];
	assign x3 = a[2];
	assign x4 = a[3];
	assign x5 = a[4];
	assign x6 = a[5];
	assign x7 = a[6];
	assign x8 = a[7];
	assign y1 = b[0];
	assign y2 = b[1];
	assign y3 = b[2];
	assign y4 = b[3];
	assign y5 = b[4];
	assign y6 = b[5];
	assign y7 = b[6];
	assign y8 = b[7];
	assign cout =((x8^y8)&&(x7^y7)&&(x6|y6)&& ((x5&y5)||(x4&y4)||(x3&y3)||(x2&y2)||(x1&y1))) || (x6&y6)&&(x7^y7)&&(x8^y8) || (x7&y7)&&(x8^y8) || (x8&&y8);
	wire c[7:0];
	fulladder f0(a[0],b[0],cin,sum[0],c[0]);
	fulladder f1(a[1],b[1],c[0],sum[1],c[1]);
	fulladder f2(a[2],b[2],c[1],sum[2],c[2]);
	fulladder f3(a[3],b[3],c[2],sum[3],c[3]);
	fulladder f4(a[4],b[4],c[3],sum[4],c[4]);
	fulladder f5(a[5],b[5],c[4],sum[5],c[5]);
	fulladder f6(a[6],b[6],c[5],sum[6],c[6]);
	fulladder f7(a[7],b[7],c[6],sum[7],c[7]);
endmodule

module adder8_8(a,b,sum);
	input [7:0]a,b;
	output [7:0] sum;
	wire c0;
	blockSize8 b0(a[7:0],b[7:0],1'b0,sum[7:0],c0);
	//assign sum[8] = c0;
endmodule