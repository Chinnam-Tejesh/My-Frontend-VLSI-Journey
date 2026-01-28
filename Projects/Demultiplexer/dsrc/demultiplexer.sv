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
    parameter int OUT_BITWIDTH = 1,
    parameter int OUT_OUTPUTS  = 16,
    parameter int LOG2_OF_OUT  = ($clog2(OUT_OUTPUTS > 0) ? $clog2(OUT_OUTPUTS) : 1)
) (
    input  logic [OUT_BITWIDTH - 1 : 0] in,
    input  logic [ LOG2_OF_OUT - 1 : 0] sel,
    output logic [OUT_BITWIDTH - 1 : 0] outs[OUT_OUTPUTS]
);

  always_comb begin

    outs = '{default: '0};  // aleternative to 'b0, but for unpacked identifiers.

    if (sel < out_outputs) outs[sel] = in;
    else out = '{default: '0};  // not needed, just being safe.

  end

endmodule
