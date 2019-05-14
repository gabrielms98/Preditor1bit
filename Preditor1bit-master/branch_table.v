`ifndef BRANCH_TABLE
`define BRANCH_TABLE

module branch_table(
  input wire clk,
  input wire[31:0] pc4,
  input wire wrt,
  input wire wrp,
  input wire [31:0] BdestIN,
  output wire[31:0] Bdest,
  input wire Pin,
  output wire P,
  output wire H,
  input wire [31:0] PC4d
);

parameter BM_DATA = "BM_DATA.txt";
parameter PRED_DATA = "PRED_DATA.txt";
reg[25:0] tag [0:15];
reg pred[0:15];
reg [31:0] dest[0:15];

initial begin
  $readmemh(BM_DATA, tag, 0, 15);
  $readmemh(PRED_DATA,pred,0,15);

  end
  always @(*) begin
    if(wrt) begin
      tag[PC4d[5:2]] = PC4d[31:6];
      dest[PC4d[5:2]] = BdestIN;
    end
    if(wrp) begin
      pred[PC4d[5:2]] = Pin;
    end
  end
  assign Bdest = (wrt) ? BdestIN : dest[pc4[5:2]][31:0];
  assign H = (tag[pc4[5:2]] == pc4[31:6]);
  assign P = (wrp) ? Pin : pred[pc4[5:2]];
endmodule

`endif
