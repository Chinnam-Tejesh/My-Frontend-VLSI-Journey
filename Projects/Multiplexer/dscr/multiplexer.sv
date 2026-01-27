/**
*   Muntiplexer
*
*
*
*
*
*
*/

module multiplexer #(parameter int in_bitwidth = 1, parameter int in_inputs = 16, parameter int log2ofin = ($clog2(in_inputs) <= 0) ? 1 : $clog2(in_inputs)) 
                    (input logic [(in_bitwidth * in_inputs) - 1 : 0] in, input logic [log2ofin - 1 : 0] sel, output reg [in_bitwidth - 1 : 0] out);
    
    always @(*)begin
        out = in[(sel * in_bitwidth) +: in_bitwidth];
        //multiply the sel with in_bitwidth to get starting index
        //from the starting index go to MSB, in_bitwidth positions
    end
    //there is no logic that sends previous state's or specific state's output to the out. (no memory element needed to implement the expression)
    //so i choosed always @(*) not always_comb
endmodule
