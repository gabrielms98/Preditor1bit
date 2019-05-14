`ifndef BRANCH_UNIT
`define BRANCH_UNIT


module branch_unit(
    input wire c,
    input wire b,
    input wire P,
    input wire Hd,
    input wire H,
    input wire Wrt_f,
    input wire Wrp_f,
    input wire Pd,


    output wire  flush_s1,
    output wire [1:0] mux_f

);


    reg flush;
    reg [1:0] muxpc = 2'b10;
    reg Wrt;
    reg Wrp;

  always @(*) begin
      if((b == 1'b0) && (H == 1'b0)) begin
        muxpc <= 2'b00;
        Wrt <= 1'b0;
        Wrp <= 1'b0;
        flush<= 1'b0;
      end else if((b==1'b0)&&(H==1'b1)&&P==1'b0) begin
        muxpc<=2'b00;
        Wrt<=1'b0;
        Wrp<=1'b0;
        flush<=1'b0;
      end else if((b==1'b0)&&(H==1'b0)&&P==1'b1) begin
        muxpc<=2'b01;
        Wrt<=1'b0;
        Wrp<=1'b0;
        flush<=1'b0;
      end else if((b==1'b1)&&(H==1'b0)&&(Hd==1'b0)&&(c==1'b0)) begin
        muxpc<=2'b00;
        Wrt<=1'b1;
        Wrp<=1'b1;
        flush<=1'b0;
      end else if((b==1'b1)&&(H==1'b0)&&(Hd==1'b0)&&(c==1'b1)) begin
        muxpc<=2'b11;
        Wrt<=1'b1;
        Wrp<=1'b1;
        flush<=1'b1;
      end else if((b==1'b1)&&(H==1'b0)&&(Hd==1'b1)&&(c==1'b0)&&(Pd==1'b0)) begin
        muxpc<=2'b00;
        Wrt<=1'b0;
        Wrp<=1'b0;
        flush<=1'b0;
      end else if((b==1'b1)&&(H==1'b0)&&(Hd==1'b1)&&(c==1'b1)&&(Pd==1'b1)) begin
        muxpc<=2'b00;
        Wrt<=1'b0;
        Wrp<=1'b0;
        flush<=1'b0;
      end else if((b==1'b1)&&(H==1'b0)&&(Hd==1'b1)&&(c==1'b1)&&(Pd==1'b0)) begin
        muxpc<=2'b11;
        Wrt<=1'b0;
        Wrp<=1'b1;
        flush<=1'b1;
      end else if((b==1'b1)&&(H==1'b0)&&(Hd==1'b1)&&(c==1'b0)&&(Pd==1'b1)) begin
        muxpc<=2'b10;
        Wrt<=1'b0;
        Wrp<=1'b1;
        flush<=1'b1;
      end

    end

    assign mux_f = muxpc;
    assign flush_s1 = flush;
    assign Wrt_f = Wrt;
    assign Wrp_f = Wrp;

endmodule

`endif
