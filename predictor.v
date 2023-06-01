module predictor(input wire request, result, clk, taken, output reg prediction);

// Your code
parameter n = 4;
parameter m = 1 << n;

reg [n - 1:0] last_results;

reg [1:0] array[m - 1:0];


always @(posedge clk) begin
    if (request) begin
      reg counter = array[last_results];
      if (counter[1]) prediction = 1;
      else prediction = 0;
    end else if (result) begin
        reg counter = array[last_results];
        if (taken) begin
            if (counter < 3) array[last_results] += 1;
        end else begin
            if (counter > 0) array[last_results] -= 1;
        end

        last_results = last_results << 1;
        last_results[n - 1] = taken;
    end


end



endmodule