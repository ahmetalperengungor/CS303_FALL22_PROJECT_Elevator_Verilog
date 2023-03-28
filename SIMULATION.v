`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2023 12:16:23 AM
// Design Name: 
// Module Name: simul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SIMULATION(

    );
    reg clk,
        rst,
        
        floor_0_p,
        floor_1_p,
        floor_2_p,
        floor_3_p,
        floor_4_p,
        
        direction_1,
        direction_2,
        direction_3,
        
        floor_0_d,
        floor_1_d,
        floor_2_d,
        floor_3_d,
        floor_4_d;
        
        wire led_inside_0,
        led_inside_1,
        led_inside_2,
        led_inside_3,
        led_inside_4,
        
        led_outside_0,
        led_outside_1,
        led_outside_2,
        led_outside_3,
        led_outside_4,
        
        
   
        led_busy,
        
        
        a_out,b_out,c_out,d_out,e_out,f_out,g_out,p_out;
        
        wire [7:0]an;   
    
    top_module uut ( .clk(clk),
                .rst(rst),
                
                .floor_0_p(floor_0_p),
                .floor_1_p(floor_1_p),
                .floor_2_p(floor_2_p),
                .floor_3_p(floor_3_p),
                .floor_4_p(floor_4_p),
                
                .direction_1(direction_1),
                .direction_2(direction_2),
                .direction_3(direction_3),
                
                .floor_0_d(floor_0_d),
                .floor_1_d(floor_1_d),
                .floor_2_d(floor_2_d),
                .floor_3_d(floor_3_d),
                .floor_4_d(floor_4_d),
                
                .led_inside_0(led_inside_0),
                .led_inside_1(led_inside_1),
                .led_inside_2(led_inside_2),
                .led_inside_3(led_inside_3),
                .led_inside_4(led_inside_4),
                
                
                .led_outside_0(led_outside_0),
                .led_outside_1(led_outside_1),
                .led_outside_2(led_outside_2),
                .led_outside_3(led_outside_3),
                .led_outside_4(led_outside_4),
                
                    
                
                .led_busy(led_busy),
                 .a_out(a_out),
                 .b_out(b_out),
                 .c_out(c_out),
                 .d_out(d_out),
                 .e_out(e_out),
                 .f_out(f_out),
                 .g_out(g_out),
                 .p_out(p_out),
                 .an(an)
                 );
 always #20
 clk=~clk;
 
 
 initial begin
         clk=0;
         rst=0;
         floor_0_p=0;
         floor_1_p=0;
         floor_2_p=0;
         floor_3_p=0;
         floor_4_p=0;
         direction_1=0;
         direction_2=0;
         direction_3=0;
         floor_0_d=0;
         floor_1_d=0;
         floor_2_d=0;
         floor_3_d=0;
         floor_4_d=0;
 
 #50
 rst=1;
 #50
          
          floor_2_p=1;


#500000000
    floor_2_p=0;
    
#500000000
  #500000000
    floor_3_d=1;
#1000000000
    floor_3_d=0;
#1000000000
    floor_1_p=1;

 end                  
    
    
    
    
    
    
    
    
    

    
endmodule
