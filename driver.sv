class driver;
  virtual encoder_if vif;
  mailbox gen_to_drv;
  transaction tr;

  // Constructor
  function new(mailbox gen_to_drv, virtual encoder_if vif);
    this.gen_to_drv = gen_to_drv;
    this.vif = vif;
  endfunction

  task run();
    // Drive input transactions to DUT
	forever begin
      @(posedge vif.clk);
      gen_to_drv.get(tr);
      vif.in_data <= tr.in_data;
      @(posedge vif.clk);
      tr.out_data <= vif.out_data;
	end

  endtask
endclass
