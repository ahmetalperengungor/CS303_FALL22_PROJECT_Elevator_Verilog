`timescale 1ns / 1ps

module elevator(

input clk_50hz, rst,

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
floor_4_d,

output reg led_inside_0,
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

reg [7:0] a,b,c,d,e,f,g,p
);
//***********Your code goes here**************//
parameter IDLE = 2'b00;
parameter UP = 2'b01;
parameter DOWN = 2'b10;
parameter limit = 8'b11111010; // for 5 seconds


reg dummy = 0;
reg dummy2 = 0;

reg [7:0] timer = 8'b00000000;
reg [2:0] current_floor_info = 3'b000;

reg [1:0] STATE = IDLE; 
reg [1:0] NEXT_STATE = IDLE;

reg [4:0] queue = 5'b00000;
reg [2:0] wanted_floor_info = 3'b111; // starting floor 7



initial begin
    led_outside_0 = 0;
    led_outside_1 = 0;
    led_outside_2 = 0;
    led_outside_3 = 0;
    led_outside_4 = 0;
    led_inside_0 = 0;
    led_inside_1 = 0;
    led_inside_2 = 0;
    led_inside_3 = 0;
    led_inside_4 = 0;
    led_busy = 0;
    a = 1;
    b = 1;
    c = 1;
    d = 1;
    e = 1;
    f = 1;
    g = 1;
    p = 1;
    
end



// state transition 
always @(posedge clk_50hz)
begin
    if(rst==0) begin
        STATE<=IDLE;
    end
    else begin
        STATE<=NEXT_STATE;
    end
end




// main part
always @(posedge clk_50hz)
begin
    // if reseted
    if(rst==0) begin
        timer=0;
        current_floor_info = 0;
    end
    else begin
        // if not reset but also 5 seconds passed
        if(timer == limit) begin
            timer = 0;
            case(STATE)
                IDLE:
                begin
                    dummy2 = dummy2;
                end
                UP:
                begin
                
                    if(led_busy)
                    begin
                        if(current_floor_info == wanted_floor_info)
                        begin
                            NEXT_STATE = IDLE;
                            led_busy = 0;    
                            wanted_floor_info = 7;
                                               
                        end
                        else
                        begin
                            dummy2 = dummy2;
                            led_busy = 0;
                            queue[current_floor_info] = 0;
                        end

                    end
                    else 
                    begin
                        current_floor_info = current_floor_info + 1;
                        if(wanted_floor_info == current_floor_info)
                        begin
                            led_busy = 1;
                            if(current_floor_info == 1) begin
                                 led_outside_1 = 0;
                                 led_inside_1 = 0;
                            end
                            
                            else if(current_floor_info == 2) begin
                                led_outside_2 = 0;
                                led_inside_2 = 0;
                            end
                                                        
                            else if(current_floor_info == 3) begin
                                   led_outside_3 = 0;
                                   led_inside_3 = 0;
                            end
                            
                            else if(current_floor_info == 0) begin
                                   led_outside_0 = 0;
                                   led_inside_0 = 0;
                            end    
                            
                            else if(current_floor_info == 4) begin
                                   led_outside_4 = 0;
                                   led_inside_4 = 0;
                            end                                                  
                            else begin
                                dummy2 = dummy2;
                            end 
                          
                          
                          
                        end
                        else
                        begin
                            if(queue[current_floor_info] == 1)
                            begin
                                led_busy = 1;
                                
                                if(current_floor_info == 1) begin
                                     led_outside_1 = 0;
                                     led_inside_1 = 0;
                                end
                                
                                else if(current_floor_info == 2) begin
                                    led_outside_2 = 0;
                                    led_inside_2 = 0;
                                end
                                                            
                                else if(current_floor_info == 3) begin
                                       led_outside_3 = 0;
                                       led_inside_3 = 0;
                                end
                                else begin
                                    dummy2 = dummy2;
                                end 
                            end
                            else
                            begin
                                dummy2 = dummy2;
                            end
                          
                        end
                    end
                end
                DOWN:
                begin
                    if(led_busy)
                    begin
                        if(current_floor_info == wanted_floor_info)
                        begin
                            
                            NEXT_STATE = IDLE;
                            led_busy = 0;    
                            wanted_floor_info = 7;                   
                        end
                        else
                        begin
                        
                            dummy2 = dummy2;
                            led_busy = 0;
                            queue[current_floor_info] = 0;
                        end
                    end
                    else 
                    begin
                        current_floor_info = current_floor_info - 1;
                        if(wanted_floor_info == current_floor_info)
                        begin
                            led_busy = 1;
                            if(current_floor_info == 1) begin
                                 led_outside_1 = 0;
                                 led_inside_1 = 0;
                            end
                            
                            else if(current_floor_info == 2) begin
                                led_outside_2 = 0;
                                led_inside_2 = 0;
                            end
                                                        
                            else if(current_floor_info == 3) begin
                                   led_outside_3 = 0;
                                   led_inside_3 = 0;
                            end
                            
                            else if(current_floor_info == 0) begin
                                   led_outside_0 = 0;
                                   led_inside_0 = 0;
                            end    
                            
                            else if(current_floor_info == 4) begin
                                   led_outside_4 = 0;
                                   led_inside_4 = 0;
                            end                                                  
                            else begin
                                dummy2 = dummy2;
                            end 

                        end
                        else
                        begin
                            if(queue[current_floor_info] == 1)
                            begin
                                led_busy = 1;
                                
                                if(current_floor_info == 1) begin
                                     led_outside_1 = 0;
                                     led_inside_1 = 0;
                                end
                                
                                else if(current_floor_info == 2) begin
                                    led_outside_2 = 0;
                                    led_inside_2 = 0;
                                end
                                                            
                                else if(current_floor_info == 3) begin
                                       led_outside_3 = 0;
                                       led_inside_3 = 0;
                                end
                                else begin
                                    dummy2 = dummy2;
                                end 
                            end
                            else
                            begin
                                dummy2 = dummy2;
                            end
                          
                        end
                    end
                end
                default:
                begin
                    dummy2 = dummy2;
                end
            endcase
        end
        // if 5 seconds have not passed yet, increase timer by 1
        else begin
             timer = timer + 1;
        end
    end

//main part

// floor 0 outside buttons

if (floor_0_p == 1) begin
    if(current_floor_info!=0)
    begin
        if(wanted_floor_info ==7)
        begin
            timer = 0;
            wanted_floor_info = 0;
            NEXT_STATE = DOWN;
            led_outside_0 = 1;
        end
        else
        begin
           dummy2 = dummy2;
        end
    end
    else
    begin
        dummy2 = dummy2;
    end
end
else begin
    dummy2 = dummy2;
end


//floor 1 outside buttons
if (floor_1_p == 1) begin
    if(wanted_floor_info == 7)
    begin
        if(current_floor_info!=1)
        begin
            timer = 0;
            wanted_floor_info = 1;
            led_outside_1 = 1;
            if(current_floor_info>1)
            begin
                NEXT_STATE = DOWN;            
            end
            else
            begin
                NEXT_STATE = UP;
            end
        end
        else
        begin
            dummy2 = dummy2;
        end
    end
    else 
    begin
        if(direction_1 == 1)
        begin
            if(wanted_floor_info>1 & current_floor_info<1)
            begin
                queue[1] = 1;
                led_outside_1 = 1;
            end
            else
            begin
                dummy2 = dummy2;    
            end
       end
       else
       begin
            if(wanted_floor_info<1 & current_floor_info>1)
               begin
                   queue[1] = 1;
                   led_outside_1 = 1;
               end
               else
               begin
                   dummy2 = dummy2;    
               end           
       end
    end
end
else begin
    dummy2 = dummy2;
end


// floor 2 outside buttons
    if (floor_2_p == 1) begin
        if(wanted_floor_info == 7)
        begin
            if(current_floor_info!=2)
                begin
                    timer = 0;
                    wanted_floor_info = 2;
                    led_outside_2 = 1;
                    if(current_floor_info>2)
                    begin
                        NEXT_STATE = DOWN;            
                    end
                    else
                    begin
                        NEXT_STATE = UP;
                    end
                end
                else
                begin
                    dummy2 = dummy2;
                end           
        end
        else 
        begin
            if(direction_2 == 1)
            begin
                if(wanted_floor_info>2 & current_floor_info<2)
                begin
                    queue[2] = 1;
                    led_outside_2 = 1;
                end
                else
                begin
                    dummy2 = dummy2; 
                end
           end
           else
           begin
                if(wanted_floor_info<2 & current_floor_info>2)
                   begin
                       queue[2] = 1;
                       led_outside_2 = 1;
                   end
                   else
                   begin
                      dummy2 = dummy2;   
                   end           
           end
        end
    end
    else begin
        dummy2 = dummy2;
    end
//floor 3 outside buttons
if (floor_3_p == 1) begin
    if(wanted_floor_info == 7)
    begin
        if(current_floor_info!=3)
            begin
                timer = 0;
                wanted_floor_info = 3;
                led_outside_3 = 1;
                if(current_floor_info>3)
                begin
                    NEXT_STATE = DOWN;            
                end
                else
                begin
                    NEXT_STATE = UP;
                end
            end
            else
            begin
                dummy2 = dummy2;
            end          
    end
    else 
    begin
        if(direction_3 == 1)
        begin
            if(wanted_floor_info>3 & current_floor_info<3)
            begin
                queue[3] = 1;
                led_outside_3 = 1;
            end
            else
            begin
                dummy2 = dummy2;  
            end
       end
       else
       begin
            if(wanted_floor_info<3 & current_floor_info>3)
               begin
                   queue[3] = 1;
                   led_outside_3 = 1;
               end
               else
               begin
                  dummy2 = dummy2;   
               end           
       end
    end
end
else begin
    dummy2 = dummy2;
end   

// floor 4 outside buttons
if (floor_4_p == 1) begin
    if(current_floor_info!=4)
    begin
        if(wanted_floor_info ==7)
        begin
            timer = 0;
            wanted_floor_info = 4;
            NEXT_STATE = UP;
            led_outside_4 = 1;
        end
        else
        begin
            dummy2 = dummy2;
        end
    end
    else
    begin
        dummy2 = dummy2;
    end
end
else begin
    dummy2 = dummy2;
end

// floor 0 inside buttons

if(floor_0_d == 1) 
begin
    if(current_floor_info!=0)
    begin
        if(wanted_floor_info == 7) // == 7 means idle
        begin
            timer = 0;
            wanted_floor_info = 0;
            led_inside_0 = 1;
            NEXT_STATE = DOWN;
        end
        else
        begin
            dummy2 = dummy2;
        end
    end 
    else
    begin
        dummy2 = dummy2;  
    end
end
else
begin
    dummy2 = dummy2;
end 
   
// floor 1 inside buttons
if(floor_1_d == 1)
begin
    if(wanted_floor_info == 7)
    begin
        if(current_floor_info!=1)
        begin
            timer = 0;
            led_inside_1 = 1;
            wanted_floor_info = 1;
            if(current_floor_info<1)
            begin
                NEXT_STATE = UP;
            end
            else
            begin
                NEXT_STATE = DOWN;
            end
        end
        else
        begin
            dummy2 = dummy2;
        end
     
    end
    else
    begin
        if(wanted_floor_info>current_floor_info)
        begin
            if(wanted_floor_info>1 & current_floor_info<1)
            begin
                queue[1] = 1;
                led_inside_1 = 1;
            end
            else
            begin
                dummy2 = dummy2;    
            end
       end
       else
       begin
            if(wanted_floor_info<1 & current_floor_info>1)
            begin
               queue[1] = 1;
               led_inside_1 = 1;
           end
           else
           begin
               dummy2 = dummy2;    
           end           
       end
    end     
end
else
begin
    dummy2 = dummy2;
end
    
// floor 2 inside buttons
if(floor_2_d == 1)
begin
    if(wanted_floor_info == 7)
    begin
        if(current_floor_info!=2)
        begin
            timer = 0;
            wanted_floor_info = 2;
            led_inside_2 = 1;
            if(current_floor_info<2)
            begin
                NEXT_STATE = UP;
            end
            else
            begin
                NEXT_STATE = DOWN;
            end
        end
        else
        begin
            dummy2 = dummy2;
        end
     
    end
    else
    begin
        if(wanted_floor_info>current_floor_info)
        begin
            if(wanted_floor_info>2 & current_floor_info<2)
            begin
                queue[2] = 1;
                led_inside_2 = 1;
            end
            else
            begin
                dummy2 = dummy2;   
            end
       end
       else
       begin
            if(wanted_floor_info<2 & current_floor_info>2)
            begin
               queue[2] = 1;
               led_inside_2 = 1;
           end
           else
           begin
               dummy2 = dummy2;    
           end           
       end
    end     
end
else
begin
    dummy2 = dummy2;
end 
    
// floor 3 inside buttons
if(floor_3_d == 1)
begin
    if(wanted_floor_info == 7)
    begin
        if(current_floor_info!=3)
        begin
            timer = 0;
            wanted_floor_info = 3;
            led_inside_3 = 1;
            if(current_floor_info<3)
            begin
                NEXT_STATE = UP;
            end
            else
            begin
                NEXT_STATE = DOWN;
            end
        end
        else
        begin
            dummy2 = dummy2;
        end
     
    end
    else
    begin
        if(wanted_floor_info>current_floor_info)
        begin
            if(wanted_floor_info>3 & current_floor_info<3)
            begin
                queue[3] = 1;
                led_inside_3 = 1;
            end
            else
            begin
               dummy2 = dummy2; 
            end
       end
       else
       begin
            if(wanted_floor_info<3 & current_floor_info>3)
            begin
               queue[3] = 1;
               led_inside_3 = 1;
           end
           else
           begin
               dummy2 = dummy2;
           end           
       end
    end     
end
else
begin
  dummy2 = dummy2;
end     
    
// floor 4 inside buttons
if(floor_4_d == 1) 
begin
   if(current_floor_info!=4)
   begin 
        if(wanted_floor_info == 7) // == 7 means idle
        begin
            timer = 0;
            wanted_floor_info = 4;
            led_inside_4 = 1;
            NEXT_STATE = UP;
        end
        else
        begin
            dummy2 = dummy2;
        end
    end
    else
    begin
        dummy2 = dummy2;
    end
end 
else
begin
   dummy2 = dummy2;
end 
 
 
  
    
end



// SSD OUTPUT PART
always @(posedge clk_50hz)
    case(STATE)
        IDLE:
            if(current_floor_info == 0) begin
                 a = 8'b11110110;
                 b = 8'b11001110;
                 c = 8'b11001110;
                 d = 8'b11101010;
                 e = 8'b11100010;
                 f = 8'b11110010;
                 g = 8'b11100111;
                 p = 8'b11111111;
            end
            else if(current_floor_info == 1) begin
                 a = 8'b11110111;
                 b = 8'b11001110;
                 c = 8'b11001110;
                 d = 8'b11101011;
                 e = 8'b11100011;
                 f = 8'b11110011;
                 g = 8'b11100111;
                 p = 8'b11111111;
            end 
            else if(current_floor_info == 2) begin
                 a = 8'b11110110;
                 b = 8'b11001110;
                 c = 8'b11001111;
                 d = 8'b11101010;
                 e = 8'b11100010;
                 f = 8'b11110011;
                 g = 8'b11100110;
                 p = 8'b11111111;
            end       
            else if(current_floor_info == 3) begin
                 a = 8'b11110110;
                 b = 8'b11001110;
                 c = 8'b11001110;
                 d = 8'b11101010;
                 e = 8'b11100011;
                 f = 8'b11110011;
                 g = 8'b11100110;
                 p = 8'b11111111;
            end  
            else if(current_floor_info == 4) begin
                 a = 8'b11110111;
                 b = 8'b11001110;
                 c = 8'b11001110;
                 d = 8'b11101011;
                 e = 8'b11100011;
                 f = 8'b11110010;
                 g = 8'b11100110;
                 p = 8'b11111111;
            end     
            else begin
                dummy = dummy;
            end
        UP:
            if(current_floor_info == 0) begin
                 a = 8'b11100110;
                 b = 8'b11001110;
                 c = 8'b11011110;
                 d = 8'b11011010;
                 e = 8'b11010010;
                 f = 8'b11000010;
                 g = 8'b11100111;
                 p = 8'b11111111;
            end
            else if(current_floor_info == 1) begin
                 a = 8'b11100111;
                 b = 8'b11001110;
                 c = 8'b11011110;
                 d = 8'b11011011;
                 e = 8'b11010011;
                 f = 8'b11000011;
                 g = 8'b11100111;
                 p = 8'b11111111;
            end 
            else if(current_floor_info == 2) begin
                 a = 8'b11100110;
                 b = 8'b11001110;
                 c = 8'b11011111;
                 d = 8'b11011010;
                 e = 8'b11010010;
                 f = 8'b11000011;
                 g = 8'b11100110;
                 p = 8'b11111111;
            end       
            else if(current_floor_info == 3) begin
                 a = 8'b11100110;
                 b = 8'b11001110;
                 c = 8'b11011110;
                 d = 8'b11011010;
                 e = 8'b11010011;
                 f = 8'b11000011;
                 g = 8'b11100110;
                 p = 8'b11111111;
            end  
            else if(current_floor_info == 4) begin
                 a = 8'b11100111;
                 b = 8'b11001110;
                 c = 8'b11011110;
                 d = 8'b11011011;
                 e = 8'b11010011;
                 f = 8'b11000010;
                 g = 8'b11100110;
                 p = 8'b11111111;
            end     
            else begin
                dummy = dummy;
            end            
// DOWN

        DOWN:
            if(current_floor_info == 0) begin
                 a = 8'b11110110;
                 b = 8'b11011110;
                 c = 8'b11001110;
                 d = 8'b11001010;
                 e = 8'b11000010;
                 f = 8'b11110010;
                 g = 8'b11000111;
                 p = 8'b11111111;
            end
            else if(current_floor_info == 1) begin
                 a = 8'b11110111;
                 b = 8'b11011110;
                 c = 8'b11001110;
                 d = 8'b11001011;
                 e = 8'b11000011;
                 f = 8'b11110011;
                 g = 8'b11000111;
                 p = 8'b11111111;
            end 
            else if(current_floor_info == 2) begin
                 a = 8'b11110110;
                 b = 8'b11011110;
                 c = 8'b11001111;
                 d = 8'b11001010;
                 e = 8'b11000010;
                 f = 8'b11110011;
                 g = 8'b11000110;
                 p = 8'b11111111;
            end       
            else if(current_floor_info == 3) begin
                 a = 8'b11110110;
                 b = 8'b11011110;
                 c = 8'b11001110;
                 d = 8'b11001010;
                 e = 8'b11000011;
                 f = 8'b11110011;
                 g = 8'b11000110;
                 p = 8'b11111111;
            end  
            else if(current_floor_info == 4) begin
                 a = 8'b11110111;
                 b = 8'b11011110;
                 c = 8'b11001110;
                 d = 8'b11001011;
                 e = 8'b11000011;
                 f = 8'b11110010;
                 g = 8'b11000110;
                 p = 8'b11111111;
            end     
            else begin
                dummy = dummy;
            end
    

        default:
            dummy = dummy;
    endcase 


//***********Your code goes here**************//
endmodule
