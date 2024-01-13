module round_robin_variable_time_tb;

    reg clk,rst;
    reg [3:0] req;
    wire [3:0] out;

    round_robin_variable_time #(
        .ideal_state(3'b000),
        .state_0(3'b001),
        .state_1(3'b010),
        .state_2(3'b011),
        .state_3(3'b100)
    ) uut (
        .clk(clk),
        .rst(rst),
        .req(req),
        .out(out)
    );

    // Clock generation
    initial begin
        forever begin 
            #5 clk = ~clk;
        end
    end

    initial begin
        clk = 0;
        rst = 1;
        req = 4'b0000;
        #10 rst = 0;

        //Case 1
        req = 4'b0001; 
        #10;
        req = 4'b0010; 
        #10;
        req = 4'b0100; 
        #10;
        req = 4'b1000;
        #10;

        //Case 2
        req = 4'b1010;
        #10;
        req = 4'b0110;
        #10;
        req = 4'b1111;
        #10;
        req = 4'b1001;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule
