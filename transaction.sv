class transaction;
    // Define transaction variables
    bit [3:0] in_data;
    bit [1:0] out_data;

    // Constraint to limit input data to valid values
    constraint ip_c {
        in_data >= 4'b0001; // Minimum valid input
        in_data <= 4'b1000; // Maximum valid input
    }
endclass