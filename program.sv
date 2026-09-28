program pgm(intf vif);
    environment env;
    initial begin
        env = new(vif);
        env.run();
        wait(env.s1.total_count >= 20);// for ignoring no of displays
        $display("===== ALL 20 TRANSACTIONS COMPLETED =====");
        $finish;
    end
endprogram
