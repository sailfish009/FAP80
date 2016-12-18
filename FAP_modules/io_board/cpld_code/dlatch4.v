module dlatch4(
	input wire [3:0] data, 
	input wire LE_H,
	input wire OE_L,
	output reg [3:0] q
	);

reg [3:0] q_internal;

always @ (LE_H or OE_L)

if (OE_L == 0 && LE_H == 0) begin
	q <= q_internal;
end

else if (OE_L == 0 && LE_H == 1) begin
	q_internal <= data;
	q <= q_internal;
end

else if (OE_L == 1 && LE_H == 0) begin
	q <= 4'bzzzz;
end

else begin
	q <= 4'bzzzz;
	q_internal <= data;
end

endmodule