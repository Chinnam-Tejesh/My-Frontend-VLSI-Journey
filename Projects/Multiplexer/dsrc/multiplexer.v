/**
*   Muntiplexer
*
*
*
*
*
*
*/
module multiplexer #(parameter int BITWIDTH_IN = 1,
                     parameter int INPUTS_IN = 16,
                     parameter int LOG2_OF_IN = ($clog2(INPUTS_IN) > 0) ? $clog2(INPUTS_IN) : 1
                     )(
                     input logic [BITWIDTH_IN - 1 : 0] ins [INPUTS_IN],
                     input logic [LOG2_OF_IN - 1 : 0] sel,
                     output logic [BITWIDTH_IN - 1 : 0] out);

    always_comb begin

        out =  '{default: '0}; // aleternative to 'b0, but for unpacked identifiers.

        if (sel < INPUTS_IN) out = ins[sel];
        else out = '{default: '0}; // not needed, just being safe.

    end

endmodule



/*      all input "in" bits are packed

module multiplexer #(parameter int BITWIDTH_IN = 1, parameter int INPUTS_IN = 16, parameter int LOG2_OF_IN = ($clog2(INPUTS_IN) <= 0) ? 1 : $clog2(INPUTS_IN))
                    (input logic [(BITWIDTH_IN * INPUTS_IN) - 1 : 0] in, input logic [LOG2_OF_IN - 1 : 0] sel, output reg [BITWIDTH_IN - 1 : 0] out);

    always @(*)begin
        out = in[(sel * BITWIDTH_IN) +: BITWIDTH_IN];
        //multiply the sel with BITWIDTH_IN to get starting index
        //from the starting index go to MSB, BITWIDTH_IN positions
    end
endmodule
*/
