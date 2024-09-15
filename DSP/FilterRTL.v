module FilterRTL #(parameter RegWidth = 4)(
	
	input wire [7 : 0] Xn ,
	input wire CLK ,
	input wire RST ,
	
	output wire [7 : 0] Yn
);


reg [7 : 0] Delay  [3 : 0] ;

integer i ; 

always @(posedge CLK or negedge RST)
begin
	if (!RST)
		begin
		for (i = 0 ; i < 4 ; i = i +1)
			begin
				Delay [i]<= 'd0;
			end
		end
	else
		begin
			Delay [0] <= Xn ;
			for (i = 1 ; i < 4 ; i = i + 1)
				begin
					Delay [i] <= Delay[i - 1] ;
				end
		end
end

assign Yn = Delay [0] + (Delay[1] >> 1) + (Delay[2] >> 2) + (Delay[3] >> 3) ;


endmodule 