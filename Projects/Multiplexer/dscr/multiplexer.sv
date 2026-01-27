/**
*   Muntiplexer
*
*
*
*
*
*
*/
module multiplexer #(parameter int in_bitwidth = 1, 
                     parameter int in_inputs = 16, 
                     parameter int log2ofin = ($clog2(in_inputs) > 0) ? $clog2(in_inputs) : 1
                     )(
                     input logic [in_bitwidth - 1 : 0] ins [ in_inputs - 1 : 0], 
                     input logic [log2ofin - 1 : 0] sel, 
                     output logic [in_bitwidth - 1 : 0] out);
    
    always_comb begin
        
        out =  '{default: '0}; // aleternative to 'b0, but for unpacked identifiers.
         
        if (sel < in_inputs) out = ins[sel];
        else out = '{default: '0}; // not needed, just being safe.

    end

endmodule



/*      all input "in" bits are packed

module multiplexer #(parameter int in_bitwidth = 1, parameter int in_inputs = 16, parameter int log2ofin = ($clog2(in_inputs) <= 0) ? 1 : $clog2(in_inputs)) 
                    (input logic [(in_bitwidth * in_inputs) - 1 : 0] in, input logic [log2ofin - 1 : 0] sel, output reg [in_bitwidth - 1 : 0] out);
    
    always @(*)begin
        out = in[(sel * in_bitwidth) +: in_bitwidth];
        //multiply the sel with in_bitwidth to get starting index
        //from the starting index go to MSB, in_bitwidth positions
    end
endmodule
*/
