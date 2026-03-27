/**
*   Demultiplexer
*
*
*
*
*
*
*/
module demultiplexer #(
    parameter int BITWIDTH_OUT = 1,
    parameter int OUTPUTS_OUT  = 16,
    parameter int LOG2_OF_OUT  = (OUTPUTS_OUT > 1) ? $clog2(OUTPUTS_OUT) : 2
) (
    input  logic [BITWIDTH_OUT - 1 : 0] in,
    input  logic [ LOG2_OF_OUT - 1 : 0] sel,
    output logic [BITWIDTH_OUT - 1 : 0] outs[OUTPUTS_OUT]
);

  always_comb begin

    outs = '{default: '0};  // aleternative to 'b0, but for unpacked identifiers.

    if (sel < OUTPUTS_OUT) outs[sel] = in;
    else outs = '{default: '0};  // not needed, just being safe.

  end

endmodule
