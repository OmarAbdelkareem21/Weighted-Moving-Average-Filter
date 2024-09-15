`timescale 1ns/100ps
module FilterRTL_tb #(parameter RegWidth = 4 , parameter N = 8)();


	 reg  [7 : 0] Xn ;
	 reg CLK ;
	 reg RST ;
	
	 wire [7 : 0] Yn ; 
	 
integer clock = 5 ;


FilterRTL FilMod (
	
	.Xn(Xn) ,
	.CLK(CLK),
	.RST(RST) ,
	
	.Yn(Yn)
);
always #(clock) CLK = ! CLK ;


integer n ;

reg [N:0] input_file [100:0];
reg [N:0] output_file [100:0];

task rest ;
begin

	RST = 1'd1;
	#1
	RST = 1'D0;
	#1;
	RST = 1'D1;
end
endtask

integer i = 0 ;

integer  c = 0 ;

initial 
begin

	$readmemh("input1.txt",input_file);
    $readmemh("output1.txt",output_file);

	CLK = 0;
    rest ();


 
	for (i = 0 ; i < 100 ; i = i +1)
	begin
		Xn = input_file[i];
		#10;
		
		if (Yn != output_file[i])
			begin
				$display ("Hellp");
			end
		else
			c =c +1 ;	
	end
	
	if (c == 100)
		$display ("Successful Operations");
	else 
		$display ("Failed Operations");
$stop;
end 



endmodule 