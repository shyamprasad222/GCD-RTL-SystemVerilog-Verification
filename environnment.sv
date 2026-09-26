class environment;
    mailbox g2d;
    mailbox m2s;
    mailbox m2c;

    generator  g1;
    driver     d1;
    monitor    m1;
    scoreboard s1;
    coverage   c1;
    virtual intf vif;

    function new(virtual intf vif);
        this.vif = vif;
        g2d = new();
        m2s = new();
        m2c = new();

        g1 = new(g2d);
        d1 = new(vif, g2d);
        m1 = new(m2s, vif, m2c);
        s1 = new(m2s);
        c1 = new(m2c);

    endfunction

    task run();
        fork
            g1.run();
            d1.run();
            m1.run();
            s1.run();
            c1.run();
        join_none

    endtask
endclass

