module round_robin_variable_time
#(
    parameter ideal_state = 3'b000,
    parameter state_0 = 3'b001,
    parameter state_1 = 3'b010,
    parameter state_2 = 3'b011,
    parameter state_3 = 3'b100
)
(
    input clk,rst,
    input [3:0] req,
    output reg [3:0] out
);

    reg [2:0] present_state;
    reg [2:0] next_state;
    reg [1:0] count;

    always@(posedge clk) begin
        if (rst == 1'b1) begin
            present_state <= ideal_state;
            count <= 2'b00;
        end
        else begin
            present_state <= next_state;
            count <= count;
        end
    end

    always@(present_state or next_state or req) begin
        case(present_state)
            ideal_state : begin
                count = 2'b00;
                if (req[0]) begin
                    next_state = state_0;
                end
                else if (req[1]) begin
                    next_state = state_1;
                end
                else if (req[2]) begin
                    next_state = state_2;
                end
                else if (req[3]) begin
                    next_state = state_3;
                end
                else begin
                    next_state = ideal_state;
                end
            end

            state_0 : begin
                if (req[0]) begin
                    if (count == 2'b10) begin
                        if (req[1]) begin
                            count = 2'b00;
                            next_state = state_1;
                        end
                        else if (req[2]) begin
                            count = 2'b00;
                            next_state = state_2;
                        end
                        else if (req[3]) begin
                            count = 2'b00;
                            next_state = state_3;
                        end
                        else begin
                            count = 2'b00;
                            next_state = ideal_state;
                        end
                    end
                    else begin
                        count = count + 1'b1;
                        next_state = state_0;
                    end
                end
                else if (req[1]) begin
                    count = 2'b00;
                    next_state = state_1;
                end
                else if (req[2]) begin
                    count = 2'b00;
                    next_state = state_2;
                end
                else if (req[3]) begin
                    count = 2'b00;
                    next_state = state_3;
                end
                else begin
                    count = 2'b00;
                    next_state = ideal_state;
                end
            end

            state_1 : begin
                if (req[1]) begin
                    if (count == 2'b10) begin
                        if (req[2]) begin
                            count = 2'b00;
                            next_state = state_2;
                        end
                        else if (req[3]) begin
                            count = 2'b00;
                            next_state = state_3;
                        end
                        else if (req[0]) begin
                            count = 2'b00;
                            next_state = state_0;
                        end
                        else begin
                            count = 2'b00;
                            next_state = ideal_state;
                        end
                    end
                    else begin
                        count = count + 1'b1;
                        next_state = state_1;
                    end
                end
                else if (req[2]) begin
                    count = 2'b00;
                    next_state = state_2;
                end
                else if (req[3]) begin
                    count = 2'b00;
                    next_state = state_3;
                end
                else if (req[0]) begin
                    count = 2'b00;
                    next_state = state_0;
                end
                else begin
                    count = 2'b00;
                    next_state = ideal_state;
                end
            end

            state_2: begin
                if (req[2]) begin
                    if (count == 2'b10) begin
                        if (req[3]) begin
                            count = 2'b00;
                            next_state = state_3;
                        end
                        else if (req[0]) begin
                            count = 2'b00;
                            next_state = state_0;
                        end
                        else if (req[1]) begin
                            count = 2'b00;
                            next_state = state_1;
                        end
                        else begin
                            count = 2'b00;
                            next_state = ideal_state;
                        end
                    end
                    else begin
                        count = count + 1'b1;
                        next_state = state_2;
                    end
                end
                else if (req[3]) begin
                    count = 2'b00;
                    next_state = state_3;
                end
                else if (req[0]) begin
                    count = 2'b00;
                    next_state = state_0;
                end
                else if (req[1]) begin
                    count = 2'b00;
                    next_state = state_1;
                end
                else begin
                    count = 2'b00;
                    next_state = ideal_state;
                end
            end

            state_3: begin
                if (req[3]) begin
                    if (count == 2'b10) begin
                        if (req[0]) begin
                            count = 2'b00;
                            next_state = state_0;
                        end
                        else if (req[1]) begin
                            count = 2'b00;
                            next_state = state_1;
                        end
                        else if (req[2]) begin
                            count = 2'b00;
                            next_state = state_2;
                        end
                        else begin
                            count = 2'b00;
                            next_state = ideal_state;
                        end
                    end
                    else begin
                        count = count + 1'b1;
                        next_state = state_3;
                    end
                end
                else if (req[0]) begin
                    count = 2'b00;
                    next_state = state_0;
                end
                else if (req[1]) begin
                    count = 2'b00;
                    next_state = state_1;
                end
                else if (req[2]) begin
                    count = 2'b00;
                    next_state = state_2;
                end
                else begin
                    count = 2'b00;
                    next_state = ideal_state;
                end
            end

            default: begin
                count = 2'b00;
                if (req[0]) begin
                    next_state = state_0;
                end
                else if (req[1]) begin
                    next_state = state_1;
                end
                else if (req[2]) begin
                    next_state = state_2;
                end
                else if (req[3]) begin
                    next_state = state_3;
                end
                else begin
                    next_state = ideal_state;
                end
            end
        endcase
    end

    always @(posedge clk) begin
        if(rst == 1'b1) begin
            out <= 4'b0000;
        end
        else begin
            case (present_state)
                state_0: begin
                    out <= 4'b0001;
                end
                state_1: begin
                    out <= 4'b0010;
                end
                state_2: begin
                    out <= 4'b0100;
                end
                state_3: begin
                    out <= 4'b1000;
                end
                default: begin
                    out <= 4'b0000;
                end
            endcase
        end
    end

endmodule

