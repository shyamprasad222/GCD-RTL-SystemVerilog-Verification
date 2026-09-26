class monitor;

    packet pkt;
    mailbox m2s;
    mailbox m2c;
    virtual intf vif;

    function new(mailbox m2s, virtual intf vif, mailbox m2c);
        this.m2s = m2s;
        this.m2c = m2c;
        this.vif = vif;
    endfunction

    task run();

        forever begin

            @(posedge vif.clk);
            #1;

            pkt = new();

            pkt.start = vif.start;
            pkt.A     = vif.A;
            pkt.B     = vif.B;
            pkt.gcd   = vif.gcd;
            pkt.done  = vif.done;
            pkt.busy  = vif.busy;

            // Send to coverage
            m2c.put(pkt);

            // Send to scoreboard ONLY when result is ready
            if (pkt.done == 1'b1)
                m2s.put(pkt);

        end

    endtask

endclass
