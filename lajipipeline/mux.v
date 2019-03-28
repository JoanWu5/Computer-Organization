module mux4alu1 (d0, d1, d2, s, y);
    
    input  [31:0] d0, d1, d2;
    input  [1:0] s;
    output [31:0] y;
    
    reg [31:0] y_r;
    
    always @( * ) begin
        case ( s )
            2'b00: y_r = d0;
            2'b01: y_r = d1;
            2'b10: y_r = d2;
            default: ;
        endcase             
    end 
    
    assign y = y_r;
        
endmodule

module mux4alu2 (d0, d1, d2,s, y);
    
    input  [31:0] d0, d1, d2;
    input  [1:0] s;
    output [31:0] y;
    
    reg [31:0] y_r;
    
    always @( * ) begin
        case ( s )
            2'b00: y_r = d0;
            2'b01: y_r = d1;
            2'b10: y_r = d2;
            default: ;
        endcase             
    end 
    
    assign y = y_r;
        
endmodule

module mux2compare1 (d0, d1, s, y);
    
    input  [31:0] d0, d1;
    input  s;
    output [31:0] y;
    
    reg [31:0] y_r;
    
    always @( * ) begin
        case ( s )
            0: y_r = d0;
            1: y_r = d1;
            default: ;
        endcase             
    end 
    
    assign y = y_r;
        
endmodule

module mux2compare2 (d0, d1,s, y);
    
    input  [31:0] d0, d1;
    input  s;
    output [31:0] y;
    
    reg [31:0] y_r;
    
    always @( * ) begin
        case ( s )
            0: y_r = d0;
            1: y_r = d1;
            default: ;
        endcase             
    end 
    
    assign y = y_r;
        
endmodule
