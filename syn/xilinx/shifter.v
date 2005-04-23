//Jul.5.2004 redushift_oute shift_outritishift_outal path shift_outell
//Apr.5.2005 always @(*)
//Apr.8.2005 rewritten using verilog2001 shift_outoding style
`include "define.h"
module 
shifter(input [31:0] a,
	   output reg [31:0] shift_out,
	   input [1:0] shift_func,
	   input [4:0] shift_amount);
	
	 localparam [1:0] shift_left=`SHIFT_LEFT,
					shift_right_unsigned=`SHIFT_RIGHT_UNSIGNED,
					shift_right_signed=`SHIFT_RIGHT_SIGNED;

	always @ (*) begin //
		 if (!shift_func[1]  ) begin
			case (shift_amount[4:0] )
				5'b00000: shift_out=a;
				5'b00001: shift_out={a[30:0],1'b0};
				5'b00010: shift_out={a[29:0],2'b00};
				5'b00011: shift_out={a[28:0],3'b000};
				5'b00100: shift_out={a[27:0],4'b0000};
				5'b00101: shift_out={a[26:0],5'b0_0000};
				5'b00110: shift_out={a[25:0],6'b00_0000};
				5'b00111: shift_out={a[24:0],7'b000_0000};
				5'b01000: shift_out={a[23:0],8'b0000_0000};
				5'b01001: shift_out={a[22:0],9'b0_0000_0000};
				5'b01010: shift_out={a[21:0],10'b00_0000_0000};
				5'b01011: shift_out={a[20:0],11'b000_0000_0000};
				5'b01100: shift_out={a[19:0],12'b0000_0000_0000};
				5'b01101: shift_out={a[18:0],13'b0_0000_0000_0000};
				5'b01110: shift_out={a[17:0],14'b00_0000_0000_0000};
			      5'b01111: shift_out={a[16:0],15'b000_0000_0000_0000};
				5'b10000: shift_out={a[15:0],16'b0000_0000_0000_0000};
				5'b10001: shift_out={a[14:0],16'b0000_0000_0000_0000,1'b0};
				5'b10010: shift_out={a[13:0],16'b0000_0000_0000_0000,2'b00};
				5'b10011: shift_out={a[12:0],16'b0000_0000_0000_0000,3'b000};
				5'b10100: shift_out={a[11:0],16'b0000_0000_0000_0000,4'b0000};
				5'b10101: shift_out={a[10:0],16'b0000_0000_0000_0000,5'b0_0000};
				5'b10110: shift_out={a[9:0],16'b0000_0000_0000_0000,6'b00_0000};
				5'b10111: shift_out={a[8:0],16'b0000_0000_0000_0000,7'b000_0000};
				5'b11000: shift_out={a[7:0],16'b0000_0000_0000_0000,8'b0000_0000};
				5'b11001: shift_out={a[6:0],16'b0000_0000_0000_0000,9'b0_0000_0000};
				5'b11010: shift_out={a[5:0],16'b0000_0000_0000_0000,10'b00_0000_0000};
				5'b11011: shift_out={a[4:0],16'b0000_0000_0000_0000,11'b000_0000_0000};
				5'b11100: shift_out={a[3:0],16'b0000_0000_0000_0000,12'b0000_0000_0000};
				5'b11101: shift_out={a[2:0],16'b0000_0000_0000_0000,13'b0_0000_0000_0000};
				5'b11110: shift_out={a[1:0],16'b0000_0000_0000_0000,14'b00_0000_0000_0000};
			      5'b11111: shift_out={a[0],16'b0000_0000_0000_0000,15'b000_0000_0000_0000};
			endcase
		end else if (shift_func==`SHIFT_RIGHT_UNSIGNED) begin
			case (shift_amount)
				5'b00000: shift_out=a;
				5'b00001: shift_out={1'b0,a[31:1]};
				5'b00010: shift_out={2'b00,a[31:2]};
				5'b00011: shift_out={3'b000,a[31:3]};
				5'b00100: shift_out={4'b0000,a[31:4]};
				5'b00101: shift_out={5'b0_0000,a[31:5]};
				5'b00110: shift_out={6'b00_0000,a[31:6]};
				5'b00111: shift_out={7'b000_0000,a[31:7]};
				5'b01000: shift_out={8'b0000_0000,a[31:8]};
				5'b01001: shift_out={9'b0_0000_0000,a[31:9]};
				5'b01010: shift_out={10'b00_0000_0000,a[31:10]};
				5'b01011: shift_out={11'b000_0000_0000,a[31:11]};			
				5'b01100: shift_out={12'b0000_0000_0000,a[31:12]};
				5'b01101: shift_out={13'b0_0000_0000_0000,a[31:13]};					
				5'b01110: shift_out={14'b00_0000_0000_0000,a[31:14]};
			      5'b01111: shift_out={15'b000_0000_0000_0000,a[31:15]};		
				5'b10000: shift_out={16'b0000_0000_0000_0000,a[31:16]};
				5'b10001: shift_out={16'b0000_0000_0000_0000,1'b0,a[31:17]};
				5'b10010: shift_out={16'b0000_0000_0000_0000,2'b00,a[31:18]};
				5'b10011: shift_out={16'b0000_0000_0000_0000,3'b000,a[31:19]};
				5'b10100: shift_out={16'b0000_0000_0000_0000,4'b0000,a[31:20]};
				5'b10101: shift_out={16'b0000_0000_0000_0000,5'b0_0000,a[31:21]};
				5'b10110: shift_out={16'b0000_0000_0000_0000,6'b00_0000,a[31:22]};
				5'b10111: shift_out={16'b0000_0000_0000_0000,7'b000_0000,a[31:23]};
				5'b11000: shift_out={16'b0000_0000_0000_0000,8'b0000_0000,a[31:24]};
				5'b11001: shift_out={16'b0000_0000_0000_0000,9'b0_0000_0000,a[31:25]};
				5'b11010: shift_out={16'b0000_0000_0000_0000,10'b00_0000_0000,a[31:26]};
				5'b11011: shift_out={16'b0000_0000_0000_0000,11'b000_0000_0000,a[31:27]};			
				5'b11100: shift_out={16'b0000_0000_0000_0000,12'b0000_0000_0000,a[31:28]};
				5'b11101: shift_out={16'b0000_0000_0000_0000,13'b0_0000_0000_0000,a[31:29]};					
				5'b11110: shift_out={16'b0000_0000_0000_0000,14'b00_0000_0000_0000,a[31:30]};
			      5'b11111: shift_out={16'b0000_0000_0000_0000,15'b000_0000_0000_0000,a[31:31]};		
			endcase
		end else begin// SHIFT_RIGHT_SIGNED
			case (shift_amount)	
				5'b00000: shift_out=a;
				5'b00001: shift_out={a[31],a[31:1]};
				5'b00010: shift_out={{2{a[31]}},a[31:2]};
				5'b00011: shift_out={{3{a[31]}},a[31:3]};
				5'b00100: shift_out={{4{a[31]}},a[31:4]};
				5'b00101: shift_out={{5{a[31]}},a[31:5]};
				5'b00110: shift_out={{6{a[31]}},a[31:6]};
				5'b00111: shift_out={{7{a[31]}},a[31:7]};
				5'b01000: shift_out={{8{a[31]}},a[31:8]};
				5'b01001: shift_out={{9{a[31]}},a[31:9]};
				5'b01010: shift_out={{10{a[31]}},a[31:10]};
				5'b01011: shift_out={{11{a[31]}},a[31:11]};			
				5'b01100: shift_out={{12{a[31]}},a[31:12]};
				5'b01101: shift_out={{13{a[31]}},a[31:13]};					
				5'b01110: shift_out={{14{a[31]}},a[31:14]};
			      5'b01111: shift_out={{15{a[31]}},a[31:15]};		
				5'b10000: shift_out={{16{a[31]}},a[31:16]};
				5'b10001: shift_out={{17{a[31]}},a[31:17]};
				5'b10010: shift_out={{18{a[31]}},a[31:18]};
				5'b10011: shift_out={{19{a[31]}},a[31:19]};
				5'b10100: shift_out={{20{a[31]}},a[31:20]};
				5'b10101: shift_out={{21{a[31]}},a[31:21]};
				5'b10110: shift_out={{22{a[31]}},a[31:22]};
				5'b10111: shift_out={{23{a[31]}},a[31:23]};
				5'b11000: shift_out={{24{a[31]}},a[31:24]};
				5'b11001: shift_out={{25{a[31]}},a[31:25]};
				5'b11010: shift_out={{26{a[31]}},a[31:26]};
				5'b11011: shift_out={{27{a[31]}},a[31:27]};			
				5'b11100: shift_out={{28{a[31]}},a[31:28]};
				5'b11101: shift_out={{29{a[31]}},a[31:29]};					
				5'b11110: shift_out={{30{a[31]}},a[31:30]};
			      5'b11111: shift_out={{31{a[31]}},a[31:31]};		
			endcase
		end
	end






endmodule