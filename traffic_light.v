module traffic_light(
    input clk,
    input rst,
    output reg R,
    output reg Y,
    output reg G
);

    reg [1:0] state;
    reg [3:0] timer;

    parameter GREEN  = 2'b00,
              YELLOW = 2'b01,
              RED    = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= GREEN;
            timer <= 0;
        end else begin
            timer <= timer + 1;

            case (state)
                GREEN:  if (timer == 5) begin state <= YELLOW; timer <= 0; end
                YELLOW: if (timer == 2) begin state <= RED;    timer <= 0; end
                RED:    if (timer == 5) begin state <= GREEN;  timer <= 0; end
            endcase
        end
    end

    always @(*) begin
        R = 0; Y = 0; G = 0;

        case (state)
            GREEN:  G = 1;
            YELLOW: Y = 1;
            RED:    R = 1;
        endcase
    end

endmodule