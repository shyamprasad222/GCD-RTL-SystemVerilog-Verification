interface intf;
    logic clk;
    logic reset;
    logic start;
   
    logic [7:0]A;
    logic [7:0]B;

    logic [7:0]gcd;
    logic busy;
    logic done;
endinterface
