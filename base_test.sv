`include "package.sv"
program base_test(encoder_if vif);
  env env_o;

  initial begin
    env_o = new(vif);
    env_o.run();
  end
endprogram
