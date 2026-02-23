`timescale 1ns/1ps

module traffic_light(
    input clk,
    input reset,
    input emg_north, emg_south, emg_east, emg_west,
    output reg N_red, N_yellow, N_green,
    output reg S_red, S_yellow, S_green,
    output reg E_red, E_yellow, E_green,
    output reg W_red, W_yellow, W_green
);

reg [2:0] state;
reg [31:0] counter;

parameter NS_GREEN = 3'd0,
          NS_YELLOW = 3'd1,
          EW_GREEN = 3'd2,
          EW_YELLOW = 3'd3;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= NS_GREEN;
        counter <= 0;
    end else begin
        counter <= counter + 1;

        if (counter == 32'd20) begin
            counter <= 0;
            case(state)
                NS_GREEN: state <= NS_YELLOW;
                NS_YELLOW: state <= EW_GREEN;
                EW_GREEN: state <= EW_YELLOW;
                EW_YELLOW: state <= NS_GREEN;
            endcase
        end
    end
end

always @(*) begin
    N_red=1; N_yellow=0; N_green=0;
    S_red=1; S_yellow=0; S_green=0;
    E_red=1; E_yellow=0; E_green=0;
    W_red=1; W_yellow=0; W_green=0;

    if (emg_north) begin
        N_green=1; N_red=0;
    end else if (emg_south) begin
        S_green=1; S_red=0;
    end else if (emg_east) begin
        E_green=1; E_red=0;
    end else if (emg_west) begin
        W_green=1; W_red=0;
    end else begin
        case(state)
            NS_GREEN: begin
                N_green=1; S_green=1;
                N_red=0;   S_red=0;
            end
            NS_YELLOW: begin
                N_yellow=1; S_yellow=1;
                N_red=0;    S_red=0;
            end
            EW_GREEN: begin
                E_green=1; W_green=1;
                E_red=0;   W_red=0;
            end
            EW_YELLOW: begin
                E_yellow=1; W_yellow=1;
                E_red=0;    W_red=0;
            end
        endcase
    end
end

endmodule
