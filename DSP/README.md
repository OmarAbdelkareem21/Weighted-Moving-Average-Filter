# Weighted Moving Average Filter
A Weighted Moving Average (WMA) filter is being developed using the coefficients ` H = [1 , 0.5 , 0.25 , 0.125]` , which represent the weighting applied to input data points during the averaging process. The filter is implemented in a transposed structure, a common approach in digital filter design.

This type of filter, classified as a Finite Impulse Response (FIR) filter, computes a weighted average over a fixed number of input samples. The predefined weights are applied to both current and past input values to generate the output. The filter operates at a sampling frequency of 100 MHz.

![Alt text](./Images/WF.PNG)
---
## RTL

```
{
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
}
```

---

## Simulation 

During the simulations, an input stimulus and reference output were applied. The results from the simulation aligned with the calculated values in the output file, verifying the correct operation of the filter.

![Alt text](./Images/Wave.PNG)

---
