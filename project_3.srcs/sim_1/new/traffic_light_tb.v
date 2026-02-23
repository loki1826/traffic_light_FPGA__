`timescale 1ns/1ps

module traffic_light_tb;

    reg clk;
    reg reset;
    reg emg_north, emg_south, emg_east, emg_west;

    wire N_red, N_yellow, N_green;
    wire S_red, S_yellow, S_green;
    wire E_red, E_yellow, E_green;
    wire W_red, W_yellow, W_green;

    traffic_light dut (
        .clk(clk),
        .reset(reset),
        .emg_north(emg_north),
        .emg_south(emg_south),
        .emg_east(emg_east),
        .emg_west(emg_west),
        .N_red(N_red), .N_yellow(N_yellow), .N_green(N_green),
        .S_red(S_red), .S_yellow(S_yellow), .S_green(S_green),
        .E_red(E_red), .E_yellow(E_yellow), .E_green(E_green),
        .W_red(W_red), .W_yellow(W_yellow), .W_green(W_green)
    );

    // 10 ns clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        emg_north = 0;
        emg_south = 0;
        emg_east  = 0;
        emg_west  = 0;

        #20 reset = 0;

        #100 emg_east = 1;
        #50  emg_east = 0;

        #100 emg_north = 1;
        #50  emg_north = 0;

        #200 $stop;
    end

endmodule
