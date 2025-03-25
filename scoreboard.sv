class scoreboard;
    mailbox mon_to_sb;
    int compare_cnt;
    int expected_count;
    bit finished_processing;

    // Constructor
    function new(mailbox mon_to_sb);
      this.mon_to_sb = mon_to_sb;
      expected_count = 4; // Set the expected number of transactions
    endfunction

    task run();
      // Monitor actual output and compare with expected output
      forever begin
          transaction tr;
          mon_to_sb.get(tr);

          // Check for matches and mismatches
          case (tr.in_data)
            4'b0001: begin
               if (tr.out_data == 2'b00)
                 $display("Matched: Input: 0001, Output: 00");
               else
                 $display("Mismatched: Input: 0001, Expected: 00, Actual: %b", tr.out_data);
             end
            4'b0010: begin
               if (tr.out_data == 2'b01)
                 $display("Matched: Input: 0010, Output: 01");
               else
                 $display("Mismatched: Input: 0010, Expected: 01, Actual: %b", tr.out_data);
             end
            4'b0100: begin
               if (tr.out_data == 2'b10)
                 $display("Matched: Input: 0100, Output: 10");
               else
                 $display("Mismatched: Input: 0100, Expected: 10, Actual: %b", tr.out_data);
             end
            4'b1000: begin
               if (tr.out_data == 2'b11)
                 $display("Matched: Input: 1000, Output: 11");
               else
                 $display("Mismatched: Input: 1000, Expected: 11, Actual: %b", tr.out_data);
             end
            default: $display("Unexpected input");
        endcase

        compare_cnt++;
        if (compare_cnt == expected_count) begin
          finished_processing = 1; // Set flag when expected number of transactions is reached
          break; // Exit loop when done
        end
    end
    endtask
endclass
