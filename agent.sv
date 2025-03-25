class agent;
  generator gen;
  driver drv;
  monitor mon;
  
  mailbox gen_to_drv;
  virtual  encoder_if vif;
  // Constructor
  function new(virtual encoder_if vif,mailbox mon_to_sb);
    gen_to_drv= new();
    drv = new(gen_to_drv, vif);
    mon = new(mon_to_sb, vif);
    gen = new(gen_to_drv);
  endfunction

  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
    join_any
  endtask
  
endclass
