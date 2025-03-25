class env;
  agent agt;
  scoreboard sb;
  mailbox mon_to_sb;
  
  // Constructor
  function new(virtual encoder_if vif); // Declare encoder_if as a virtual interface
    mon_to_sb= new();
    agt = new(vif,mon_to_sb);
    sb=new(mon_to_sb);
  endfunction
  // Define environment tasks
  task run();
    fork
      agt.run();
      sb.run();
    join_any
    wait(sb.finished_processing);
    $finish;
  endtask
endclass
