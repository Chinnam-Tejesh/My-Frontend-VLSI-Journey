/**
*   Demultiplexer
*
*
*
*
*
*
*/
module demultiplexer #(parameter int out_bitwidth = 1, 
                       parameter int out_outputs = 16, 
                       parameter int log2ofout = ($clog2(out_outputs > 0) ? $clog2(out_outputs): 1 )
                       )(
                       input logic [out_bitwidth - 1 : 0] in, 
                       input logic [log2ofout - 1 : 0] sel, 
                       output logic [out_bitwidth - 1 : 0] outs [out_outputs - 1 : 0]);
    
    always_comb begin
        
        outs =  '{default: '0}; // aleternative to 'b0, but for unpacked identifiers.
        
        if (sel < out_outputs) outs[sel] = in;
        else out = '{default: '0}; // not needed, just being safe.

    end

endmodule
