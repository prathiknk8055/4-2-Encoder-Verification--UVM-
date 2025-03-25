module encoder(
    input logic clk,
    input logic reset,
  input logic [3:0]in_data,
    output logic [1:0] out_data
);

    // Sequential logic to encode input data
always @(posedge clk, posedge reset) begin
  if (reset) begin
    out_data <= 2'b00; // Reset to initial state
  end
  else begin
    case (in_data)
      4'b0001: out_data <= 2'b00;
      4'b0010: out_data <= 2'b01;
      4'b0100: out_data <= 2'b10;
      4'b1000: out_data <= 2'b11;
      default: out_data <= 2'bxx; // Reset to default state
     endcase
  end
end

endmodule
