class generator;
  mailbox gen_to_drv;
  transaction tr;

  // Constructor
  function new(mailbox gen_to_drv);
    this.gen_to_drv = gen_to_drv;
  endfunction

  task run();
    // Generate stimulus transactions
    for (int i = 0; i <= 4; i++) begin
      // Create a new transaction
      tr = new();
      // Set the desired input data values
      case (i)
        1: tr.in_data = 4'b0001;
        2: tr.in_data = 4'b0010;
        3: tr.in_data = 4'b0100;
        4: tr.in_data = 4'b1000;
      endcase
      gen_to_drv.put(tr);
      #1;
    end
  endtask
endclass
