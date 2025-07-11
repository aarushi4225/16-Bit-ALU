`timescale 1ns / 1ps

module alu_tb;

reg [7:0] tb_A;
reg [7:0] tb_B;
reg [3:0] tb_sel;
reg tb_clk;
reg tb_rst; // Active-high reset signal
wire [15:0] tb_Z;

alu dut (
    .sel (tb_sel),
    .A   (tb_A),
    .B   (tb_B),
    .Z   (tb_Z),
    .clk (tb_clk),
    .rst (tb_rst)
);

initial begin
    tb_clk = 0;
    forever #5 tb_clk = ~tb_clk;
end

initial begin
    // Corrected Reset Sequence for Active-High Reset:
    tb_rst = 1; // ASSERT reset (drive HIGH to activate reset)
    tb_A   = 8'h00;
    tb_B   = 8'h00;
    tb_sel = 4'h0;

    #20; // Hold reset for 20ns

    tb_rst = 0; // DEASSERT reset (drive LOW to allow normal operation)
    @(posedge tb_clk); // Wait for the first clock edge after reset deassertion
    #1; // Small delay for signal propagation

    // --- All your test cases remain the same from here ---

    tb_sel = 4'h0;
    tb_A = 8'd10;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'h1;
    tb_A = 8'd10;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'd10;
    tb_B = 8'd255;
    @(posedge tb_clk); #1;

    tb_sel = 4'h2;
    tb_A = 8'd10;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'd15;
    tb_B = 8'd20;
    @(posedge tb_clk); #1;

    tb_sel = 4'h3;
    tb_A = 8'd10;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'h4;
    tb_A = 8'd10;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'h5;
    tb_A = 8'd10;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'h6;
    tb_A = 8'h0F;
    tb_B = 8'hAA;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'h7;
    tb_A = 8'h0F;
    tb_B = 8'hAA;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'h8;
    tb_A = 8'h0F;
    tb_B = 8'hAA;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'h9;
    tb_A = 8'h0F;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'hA;
    tb_A = 8'h0F;
    tb_B = 8'hAA;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'hB;
    tb_A = 8'h0F;
    tb_B = 8'hAA;
    @(posedge tb_clk); #1;

    tb_A = 8'd255;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'hC;
    tb_A = 8'b1000_0001;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'b0000_0010;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'hD;
    tb_A = 8'b1000_0001;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'b0000_0010;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'hE;
    tb_A = 8'd10;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'd5;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    tb_sel = 4'hF;
    tb_A = 8'd10;
    tb_B = 8'd5;
    @(posedge tb_clk); #1;

    tb_A = 8'd10;
    tb_B = 8'd10;
    @(posedge tb_clk); #1;

    $finish;
end

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);
end

endmodule