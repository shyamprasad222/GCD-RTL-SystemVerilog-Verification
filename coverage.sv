class coverage;
    packet pkt;
    mailbox m2c;

    covergroup cg;  
        START: coverpoint pkt.start{
            bins start_0 = {0};
            bins start_1 = {1};
            }

        A: coverpoint pkt.A {
            bins low  = {[0:10]};
            bins med  = {[11:100]};
            bins high = {[101:255]};
            }

        B: coverpoint pkt.B{
            bins low  = {[0:10]};
            bins med  = {[11:100]};
            bins high = {[101:255]};
            }

    endgroup

     function new(mailbox m2c);
        this.m2c = m2c;
        cg = new();
    endfunction

    
      task run();
        forever begin
            m2c.get(pkt);
            cg.sample();
        end
    endtask
endclass
