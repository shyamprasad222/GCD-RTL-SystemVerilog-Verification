class driver;

    packet pkt;
    mailbox g2d;
    virtual intf vif;

    function new(virtual intf vif, mailbox g2d);
        this.vif = vif;
        this.g2d = g2d;
    endfunction

    task run();

        forever begin

            // Get transaction from generator
            g2d.get(pkt);

            // Wait for DUT to become idle
            @(negedge vif.clk);
            wait(vif.busy == 1'b0);

            // Drive A and B
            vif.A <= pkt.A;
            vif.B <= pkt.B;

            // Generate START pulse
            vif.start <= 1'b1;

            //$display("D: start=%0d A=%0d B=%0d",
               //      1'b1, pkt.A, pkt.B);

            // Keep start high for one clock cycle
            @(negedge vif.clk);

            // Deassert start
            vif.start <= 1'b0;

            // Wait until GCD calculation finishes
            wait(vif.done == 1'b1);

            //$display("D: DONE A=%0d B=%0d GCD=%0d",pkt.A, pkt.B, vif.gcd);

        end

    endtask

endclass                

