class generator;
    packet pkt;
    mailbox g2d;

    function new(mailbox g2d);
        this.g2d = g2d;
    endfunction

    task run();
        repeat(20) begin

            pkt=new();

    if(pkt.randomize()) begin
        $display("Randomize Done");
        g2d.put(pkt);
    end

    else
        $display("Randomization Faild");
end
endtask

endclass

         

