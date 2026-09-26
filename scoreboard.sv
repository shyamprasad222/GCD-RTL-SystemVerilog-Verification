class scoreboard;

    packet pkt;
    mailbox m2s;

    int total_count = 0;
    int pass_count  = 0;
    int fail_count  = 0;

    int expected_transactions = 20;


    function new(mailbox m2s);
        this.m2s = m2s;
    endfunction


    task run();

        reg [7:0] a;
        reg [7:0] b;
        reg [7:0] temp;
        reg [7:0] expected;

        forever begin

            // Get completed transaction
            m2s.get(pkt);

            total_count++;

            // Copy original A and B
            a = pkt.A;
            b = pkt.B;

            // Reference GCD
            while (b != 0) begin
                temp = a % b;
                a    = b;
                b    = temp;
            end

            expected = a;

            // Compare
            if (expected == pkt.gcd) begin

                pass_count++;

                $display("PASS ====> | A=%0d | B=%0d | Expected=%0d | DUT=%0d |",
                         pkt.A, pkt.B, expected, pkt.gcd);

            end
            else begin

                fail_count++;

                $display("FAIL ====> | A=%0d | B=%0d | Expected=%0d | DUT=%0d |",
                         pkt.A, pkt.B, expected, pkt.gcd);

            end


            // After 20 completed transactions
            if (total_count == expected_transactions) begin

                $display("");
                $display("================================================");
                $display("           GCD VERIFICATION REPORT");
                $display("================================================");
                $display("Total Transactions : %0d", total_count);
                $display("Passed             : %0d", pass_count);
                $display("Failed             : %0d", fail_count);
                $display("================================================");

                if (fail_count == 0)
                    $display("STATUS : ALL TESTS PASSED");
                else
                    $display("STATUS : TESTS FAILED");

                $display("================================================");

            end

        end

    endtask

endclass
