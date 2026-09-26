module gcd(
        input clk,
        input reset,
        input start,
        input [7:0] A,
        input [7:0] B,
        
        output reg [7:0] gcd,
        output reg       busy,
        output reg       done

);


// main three internal registers

        reg[7:0] A_reg;
        reg[7:0] B_reg;
        reg[7:0] R_reg;

// FSM states decleration
        parameter IDLE       = 3'b000;
        parameter LOAD       = 3'b001;
        parameter CALCULATE  = 3'b010;
        parameter UPDATE     = 3'b011;
        parameter CHECK      = 3'b100;
        parameter DONE       = 3'b101;

        
        reg [2:0] state;  // register for storing the the state

        always @(posedge clk or posedge reset)
        begin
            if(reset) 
            begin
                A_reg <= 8'd0;
                B_reg <= 8'd0;
                R_reg <= 8'd0;

                gcd  <= 8'd0;
                busy <= 1'b0;
                done <= 1'b0;

                state <= IDLE;
            end
            else begin
                
                case(state) // fsm logic
                
                    IDLE: begin
                        busy <= 1'b0;
                        done <= 1'b0;

                        if(start)
                            state <= LOAD;
                    end

                    LOAD: begin
                        A_reg <= A;
                        B_reg <= B;

                        busy  <= 1'b1;
                        state <= CHECK;
                    end

                    CHECK: begin
                        if(B_reg == 8'd0)
                            state <= DONE;
                        else
                        state <= CALCULATE;       
                    end

                    CALCULATE: begin
                        R_reg <= A_reg % B_reg;
                        state <= UPDATE;
                    end

                    UPDATE: begin

                        A_reg  <= B_reg;
                        B_reg  <= R_reg;

                        state <= CHECK;
                    end

                    DONE: begin
                    
                        gcd  <= A_reg;
                        busy <= 1'b0;
                        done <= 1'b1;
                        
                        state <= IDLE;
                    end
                    
                    default: begin
                        state <= IDLE;
                    end

                endcase

            end

        end

endmodule
