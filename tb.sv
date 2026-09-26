`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "coverage.sv"
`include "environnment.sv"
`include "interface.sv"
`include "gcd.v"
`include "program.sv"
module tb;
intf vif();

// DUT INSTANCE
gcd dut(.clk(vif.clk),.reset(vif.reset),.start(vif.start),.A(vif.A),.B(vif.B),.gcd(vif.gcd),.done(vif.done),.busy(vif.busy));

pgm p1(vif);

//Clock generation
always #5 vif.clk = ~vif.clk;

// Reset generation
initial begin
    vif.clk   = 0;
    vif.reset = 1;

    #10;
    vif.reset = 0;
  end
endmodule
