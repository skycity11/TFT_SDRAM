module	ROM_3	(
	input		[6:0]		address,
	input					clock,
	output	reg		q
);

always @(posedge clock) begin
	case(address)	
	7'd0 :   q =0;
	7'd1 :   q =0;
	7'd2 :   q =0;
	7'd3 :   q =0;
	7'd4 :   q =0;
	7'd5 :   q =0;
	7'd6 :   q =0;
	7'd7 :   q =0;
	7'd8 :   q =0;
	7'd9 :   q =0;
	7'd10 :  q =0;
	7'd11 :  q =0;
	7'd12 :  q =0;
	7'd13 :  q =0;
	7'd14 :  q =0;
	7'd15 :  q =0;
	7'd16 :  q =0;
	7'd17 :  q =0;
	7'd18 :  q =0;
	7'd19 :  q =0;
	7'd20 :  q =0;
	7'd21 :  q =0;
	7'd22 :  q =0;
	7'd23 :  q =0;
	7'd24 :  q =0;
	7'd25 :  q =0;
	7'd26 :  q =1;
	7'd27 :  q =1;
	7'd28 :  q =1;
	7'd29 :  q =1;
	7'd30 :  q =0;
	7'd31 :  q =0;
	7'd32 :  q =0;
	7'd33 :  q =1;
	7'd34 :  q =0;
	7'd35 :  q =0;
	7'd36 :  q =0;
	7'd37 :  q =0;
	7'd38 :  q =1;
	7'd39 :  q =0;
	7'd40 :  q =0;
	7'd41 :  q =1;
	7'd42 :  q =0;
	7'd43 :  q =0;
	7'd44 :  q =0;
	7'd45 :  q =0;
	7'd46 :  q =1;
	7'd47 :  q =0;
	7'd48 :  q =0;
	7'd49 :  q =0;
	7'd50 :  q =0;
	7'd51 :  q =0;
	7'd52 :  q =0;
	7'd53 :  q =0;
	7'd54 :  q =1;
	7'd55 :  q =0;
	7'd56 :  q =0;
	7'd57 :  q =0;
	7'd58 :  q =0;
	7'd59 :  q =0;
	7'd60 :  q =0;
	7'd61 :  q =1;
	7'd62 :  q =0;
	7'd63 :  q =0;
	7'd64 :  q =0;
	7'd65 :  q =0;
	7'd66 :  q =0;
	7'd67 :  q =1;
	7'd68 :  q =1;
	7'd69 :  q =0;
	7'd70 :  q =0;
	7'd71 :  q =0;
	7'd72 :  q =0;
	7'd73 :  q =0;
	7'd74 :  q =0;
	7'd75 :  q =0;
	7'd76 :  q =0;
	7'd77 :  q =1;
	7'd78 :  q =0;
	7'd79 :  q =0;
	7'd80 :  q =0;
	7'd81 :  q =0;
	7'd82 :  q =0;
	7'd83 :  q =0;
	7'd84 :  q =0;
	7'd85 :  q =0;
	7'd86 :  q =1;
	7'd87 :  q =0;
	7'd88 :  q =0;
	7'd89 :  q =1;
	7'd90 :  q =0;
	7'd91 :  q =0;
	7'd92 :  q =0;
	7'd93 :  q =0;
	7'd94 :  q =1;
	7'd95 :  q =0;
	7'd96 :  q =0;
	7'd97 :  q =1;
	7'd98 :  q =0;
	7'd99 :  q =0;
	7'd100 : q = 0;
	7'd101 : q = 0;
	7'd102 : q = 1;
	7'd103 : q = 0;
	7'd104 : q = 0;
	7'd105 : q = 0;
	7'd106 : q = 1;
	7'd107 : q = 1;
	7'd108 : q = 1;
	7'd109 : q = 1;
	7'd110 : q = 0;
	7'd111 : q = 0;
	7'd112 : q = 0;
	7'd113 : q = 0;
	7'd114 : q = 0;
	7'd115 : q = 0;
	7'd116 : q = 0;
	7'd117 : q = 0;
	7'd118 : q = 0;
	7'd119 : q = 0;
	7'd120 : q = 0;
	7'd121 : q = 0;
	7'd122 : q = 0;
	7'd123 : q = 0;
	7'd124 : q = 0;
	7'd125 : q = 0;
	7'd126 : q = 0;
	7'd127 : q = 0;
	endcase	
end

endmodule
