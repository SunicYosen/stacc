module gemm_tb();

reg clk;
reg reset;

reg [127:0]  inp_memory[0:127];
reg [2047:0] wgt_memory[0:127];
reg [511:0]  acc_memory[0:127];
reg [127:0]  out_memory[0:127];
reg [0:0]    rst_memory[0:127];
reg [31:0]   inp_addr;
reg [31:0]   wgt_addr;
reg [31:0]   acc_addr;
reg [31:0]   rst_addr;
reg [31:0]   out_addr;

wire   [127:0]  inp_v;
wire   [2047:0] wgt_v;
wire   [511:0]  acc_v;
wire            rst_f;

wire    [127:0]  inp;
wire    [1023:0] wgt0;
wire    [1023:0] wgt1;
wire    [511:0]  acc;

wire   [7:0] gemm_core_i_tensor_0_0;
wire   [7:0] gemm_core_i_tensor_0_1;
wire   [7:0] gemm_core_i_tensor_0_2;
wire   [7:0] gemm_core_i_tensor_0_3;
wire   [7:0] gemm_core_i_tensor_0_4;
wire   [7:0] gemm_core_i_tensor_0_5;
wire   [7:0] gemm_core_i_tensor_0_6;
wire   [7:0] gemm_core_i_tensor_0_7;
wire   [7:0] gemm_core_i_tensor_0_8;
wire   [7:0] gemm_core_i_tensor_0_9;
wire   [7:0] gemm_core_i_tensor_0_10;
wire   [7:0] gemm_core_i_tensor_0_11;
wire   [7:0] gemm_core_i_tensor_0_12;
wire   [7:0] gemm_core_i_tensor_0_13;
wire   [7:0] gemm_core_i_tensor_0_14;
wire   [7:0] gemm_core_i_tensor_0_15;

wire   [7:0] gemm_core_w_tensor_0_0;
wire   [7:0] gemm_core_w_tensor_0_1;
wire   [7:0] gemm_core_w_tensor_0_2;
wire   [7:0] gemm_core_w_tensor_0_3;
wire   [7:0] gemm_core_w_tensor_0_4;
wire   [7:0] gemm_core_w_tensor_0_5;
wire   [7:0] gemm_core_w_tensor_0_6;
wire   [7:0] gemm_core_w_tensor_0_7;
wire   [7:0] gemm_core_w_tensor_0_8;
wire   [7:0] gemm_core_w_tensor_0_9;
wire   [7:0] gemm_core_w_tensor_0_10;
wire   [7:0] gemm_core_w_tensor_0_11;
wire   [7:0] gemm_core_w_tensor_0_12;
wire   [7:0] gemm_core_w_tensor_0_13;
wire   [7:0] gemm_core_w_tensor_0_14;
wire   [7:0] gemm_core_w_tensor_0_15;

wire   [7:0] gemm_core_w_tensor_1_0;
wire   [7:0] gemm_core_w_tensor_1_1;
wire   [7:0] gemm_core_w_tensor_1_2;
wire   [7:0] gemm_core_w_tensor_1_3;
wire   [7:0] gemm_core_w_tensor_1_4;
wire   [7:0] gemm_core_w_tensor_1_5;
wire   [7:0] gemm_core_w_tensor_1_6;
wire   [7:0] gemm_core_w_tensor_1_7;
wire   [7:0] gemm_core_w_tensor_1_8;
wire   [7:0] gemm_core_w_tensor_1_9;
wire   [7:0] gemm_core_w_tensor_1_10;
wire   [7:0] gemm_core_w_tensor_1_11;
wire   [7:0] gemm_core_w_tensor_1_12;
wire   [7:0] gemm_core_w_tensor_1_13;
wire   [7:0] gemm_core_w_tensor_1_14;
wire   [7:0] gemm_core_w_tensor_1_15;

wire   [7:0] gemm_core_w_tensor_2_0;
wire   [7:0] gemm_core_w_tensor_2_1;
wire   [7:0] gemm_core_w_tensor_2_2;
wire   [7:0] gemm_core_w_tensor_2_3;
wire   [7:0] gemm_core_w_tensor_2_4;
wire   [7:0] gemm_core_w_tensor_2_5;
wire   [7:0] gemm_core_w_tensor_2_6;
wire   [7:0] gemm_core_w_tensor_2_7;
wire   [7:0] gemm_core_w_tensor_2_8;
wire   [7:0] gemm_core_w_tensor_2_9;
wire   [7:0] gemm_core_w_tensor_2_10;
wire   [7:0] gemm_core_w_tensor_2_11;
wire   [7:0] gemm_core_w_tensor_2_12;
wire   [7:0] gemm_core_w_tensor_2_13;
wire   [7:0] gemm_core_w_tensor_2_14;
wire   [7:0] gemm_core_w_tensor_2_15;

wire   [7:0] gemm_core_w_tensor_3_0;
wire   [7:0] gemm_core_w_tensor_3_1;
wire   [7:0] gemm_core_w_tensor_3_2;
wire   [7:0] gemm_core_w_tensor_3_3;
wire   [7:0] gemm_core_w_tensor_3_4;
wire   [7:0] gemm_core_w_tensor_3_5;
wire   [7:0] gemm_core_w_tensor_3_6;
wire   [7:0] gemm_core_w_tensor_3_7;
wire   [7:0] gemm_core_w_tensor_3_8;
wire   [7:0] gemm_core_w_tensor_3_9;
wire   [7:0] gemm_core_w_tensor_3_10;
wire   [7:0] gemm_core_w_tensor_3_11;
wire   [7:0] gemm_core_w_tensor_3_12;
wire   [7:0] gemm_core_w_tensor_3_13;
wire   [7:0] gemm_core_w_tensor_3_14;
wire   [7:0] gemm_core_w_tensor_3_15;

wire   [7:0] gemm_core_w_tensor_4_0;
wire   [7:0] gemm_core_w_tensor_4_1;
wire   [7:0] gemm_core_w_tensor_4_2;
wire   [7:0] gemm_core_w_tensor_4_3;
wire   [7:0] gemm_core_w_tensor_4_4;
wire   [7:0] gemm_core_w_tensor_4_5;
wire   [7:0] gemm_core_w_tensor_4_6;
wire   [7:0] gemm_core_w_tensor_4_7;
wire   [7:0] gemm_core_w_tensor_4_8;
wire   [7:0] gemm_core_w_tensor_4_9;
wire   [7:0] gemm_core_w_tensor_4_10;
wire   [7:0] gemm_core_w_tensor_4_11;
wire   [7:0] gemm_core_w_tensor_4_12;
wire   [7:0] gemm_core_w_tensor_4_13;
wire   [7:0] gemm_core_w_tensor_4_14;
wire   [7:0] gemm_core_w_tensor_4_15;

wire   [7:0] gemm_core_w_tensor_5_0;
wire   [7:0] gemm_core_w_tensor_5_1;
wire   [7:0] gemm_core_w_tensor_5_2;
wire   [7:0] gemm_core_w_tensor_5_3;
wire   [7:0] gemm_core_w_tensor_5_4;
wire   [7:0] gemm_core_w_tensor_5_5;
wire   [7:0] gemm_core_w_tensor_5_6;
wire   [7:0] gemm_core_w_tensor_5_7;
wire   [7:0] gemm_core_w_tensor_5_8;
wire   [7:0] gemm_core_w_tensor_5_9;
wire   [7:0] gemm_core_w_tensor_5_10;
wire   [7:0] gemm_core_w_tensor_5_11;
wire   [7:0] gemm_core_w_tensor_5_12;
wire   [7:0] gemm_core_w_tensor_5_13;
wire   [7:0] gemm_core_w_tensor_5_14;
wire   [7:0] gemm_core_w_tensor_5_15;

wire   [7:0] gemm_core_w_tensor_6_0;
wire   [7:0] gemm_core_w_tensor_6_1;
wire   [7:0] gemm_core_w_tensor_6_2;
wire   [7:0] gemm_core_w_tensor_6_3;
wire   [7:0] gemm_core_w_tensor_6_4;
wire   [7:0] gemm_core_w_tensor_6_5;
wire   [7:0] gemm_core_w_tensor_6_6;
wire   [7:0] gemm_core_w_tensor_6_7;
wire   [7:0] gemm_core_w_tensor_6_8;
wire   [7:0] gemm_core_w_tensor_6_9;
wire   [7:0] gemm_core_w_tensor_6_10;
wire   [7:0] gemm_core_w_tensor_6_11;
wire   [7:0] gemm_core_w_tensor_6_12;
wire   [7:0] gemm_core_w_tensor_6_13;
wire   [7:0] gemm_core_w_tensor_6_14;
wire   [7:0] gemm_core_w_tensor_6_15;

wire   [7:0] gemm_core_w_tensor_7_0;
wire   [7:0] gemm_core_w_tensor_7_1;
wire   [7:0] gemm_core_w_tensor_7_2;
wire   [7:0] gemm_core_w_tensor_7_3;
wire   [7:0] gemm_core_w_tensor_7_4;
wire   [7:0] gemm_core_w_tensor_7_5;
wire   [7:0] gemm_core_w_tensor_7_6;
wire   [7:0] gemm_core_w_tensor_7_7;
wire   [7:0] gemm_core_w_tensor_7_8;
wire   [7:0] gemm_core_w_tensor_7_9;
wire   [7:0] gemm_core_w_tensor_7_10;
wire   [7:0] gemm_core_w_tensor_7_11;
wire   [7:0] gemm_core_w_tensor_7_12;
wire   [7:0] gemm_core_w_tensor_7_13;
wire   [7:0] gemm_core_w_tensor_7_14;
wire   [7:0] gemm_core_w_tensor_7_15;

wire   [7:0] gemm_core_w_tensor_8_0;
wire   [7:0] gemm_core_w_tensor_8_1;
wire   [7:0] gemm_core_w_tensor_8_2;
wire   [7:0] gemm_core_w_tensor_8_3;
wire   [7:0] gemm_core_w_tensor_8_4;
wire   [7:0] gemm_core_w_tensor_8_5;
wire   [7:0] gemm_core_w_tensor_8_6;
wire   [7:0] gemm_core_w_tensor_8_7;
wire   [7:0] gemm_core_w_tensor_8_8;
wire   [7:0] gemm_core_w_tensor_8_9;
wire   [7:0] gemm_core_w_tensor_8_10;
wire   [7:0] gemm_core_w_tensor_8_11;
wire   [7:0] gemm_core_w_tensor_8_12;
wire   [7:0] gemm_core_w_tensor_8_13;
wire   [7:0] gemm_core_w_tensor_8_14;
wire   [7:0] gemm_core_w_tensor_8_15;

wire   [7:0] gemm_core_w_tensor_9_0;
wire   [7:0] gemm_core_w_tensor_9_1;
wire   [7:0] gemm_core_w_tensor_9_2;
wire   [7:0] gemm_core_w_tensor_9_3;
wire   [7:0] gemm_core_w_tensor_9_4;
wire   [7:0] gemm_core_w_tensor_9_5;
wire   [7:0] gemm_core_w_tensor_9_6;
wire   [7:0] gemm_core_w_tensor_9_7;
wire   [7:0] gemm_core_w_tensor_9_8;
wire   [7:0] gemm_core_w_tensor_9_9;
wire   [7:0] gemm_core_w_tensor_9_10;
wire   [7:0] gemm_core_w_tensor_9_11;
wire   [7:0] gemm_core_w_tensor_9_12;
wire   [7:0] gemm_core_w_tensor_9_13;
wire   [7:0] gemm_core_w_tensor_9_14;
wire   [7:0] gemm_core_w_tensor_9_15;

wire   [7:0] gemm_core_w_tensor_10_0;
wire   [7:0] gemm_core_w_tensor_10_1;
wire   [7:0] gemm_core_w_tensor_10_2;
wire   [7:0] gemm_core_w_tensor_10_3;
wire   [7:0] gemm_core_w_tensor_10_4;
wire   [7:0] gemm_core_w_tensor_10_5;
wire   [7:0] gemm_core_w_tensor_10_6;
wire   [7:0] gemm_core_w_tensor_10_7;
wire   [7:0] gemm_core_w_tensor_10_8;
wire   [7:0] gemm_core_w_tensor_10_9;
wire   [7:0] gemm_core_w_tensor_10_10;
wire   [7:0] gemm_core_w_tensor_10_11;
wire   [7:0] gemm_core_w_tensor_10_12;
wire   [7:0] gemm_core_w_tensor_10_13;
wire   [7:0] gemm_core_w_tensor_10_14;
wire   [7:0] gemm_core_w_tensor_10_15;

wire   [7:0] gemm_core_w_tensor_11_0;
wire   [7:0] gemm_core_w_tensor_11_1;
wire   [7:0] gemm_core_w_tensor_11_2;
wire   [7:0] gemm_core_w_tensor_11_3;
wire   [7:0] gemm_core_w_tensor_11_4;
wire   [7:0] gemm_core_w_tensor_11_5;
wire   [7:0] gemm_core_w_tensor_11_6;
wire   [7:0] gemm_core_w_tensor_11_7;
wire   [7:0] gemm_core_w_tensor_11_8;
wire   [7:0] gemm_core_w_tensor_11_9;
wire   [7:0] gemm_core_w_tensor_11_10;
wire   [7:0] gemm_core_w_tensor_11_11;
wire   [7:0] gemm_core_w_tensor_11_12;
wire   [7:0] gemm_core_w_tensor_11_13;
wire   [7:0] gemm_core_w_tensor_11_14;
wire   [7:0] gemm_core_w_tensor_11_15;

wire   [7:0] gemm_core_w_tensor_12_0;
wire   [7:0] gemm_core_w_tensor_12_1;
wire   [7:0] gemm_core_w_tensor_12_2;
wire   [7:0] gemm_core_w_tensor_12_3;
wire   [7:0] gemm_core_w_tensor_12_4;
wire   [7:0] gemm_core_w_tensor_12_5;
wire   [7:0] gemm_core_w_tensor_12_6;
wire   [7:0] gemm_core_w_tensor_12_7;
wire   [7:0] gemm_core_w_tensor_12_8;
wire   [7:0] gemm_core_w_tensor_12_9;
wire   [7:0] gemm_core_w_tensor_12_10;
wire   [7:0] gemm_core_w_tensor_12_11;
wire   [7:0] gemm_core_w_tensor_12_12;
wire   [7:0] gemm_core_w_tensor_12_13;
wire   [7:0] gemm_core_w_tensor_12_14;
wire   [7:0] gemm_core_w_tensor_12_15;

wire   [7:0] gemm_core_w_tensor_13_0;
wire   [7:0] gemm_core_w_tensor_13_1;
wire   [7:0] gemm_core_w_tensor_13_2;
wire   [7:0] gemm_core_w_tensor_13_3;
wire   [7:0] gemm_core_w_tensor_13_4;
wire   [7:0] gemm_core_w_tensor_13_5;
wire   [7:0] gemm_core_w_tensor_13_6;
wire   [7:0] gemm_core_w_tensor_13_7;
wire   [7:0] gemm_core_w_tensor_13_8;
wire   [7:0] gemm_core_w_tensor_13_9;
wire   [7:0] gemm_core_w_tensor_13_10;
wire   [7:0] gemm_core_w_tensor_13_11;
wire   [7:0] gemm_core_w_tensor_13_12;
wire   [7:0] gemm_core_w_tensor_13_13;
wire   [7:0] gemm_core_w_tensor_13_14;
wire   [7:0] gemm_core_w_tensor_13_15;

wire   [7:0] gemm_core_w_tensor_14_0;
wire   [7:0] gemm_core_w_tensor_14_1;
wire   [7:0] gemm_core_w_tensor_14_2;
wire   [7:0] gemm_core_w_tensor_14_3;
wire   [7:0] gemm_core_w_tensor_14_4;
wire   [7:0] gemm_core_w_tensor_14_5;
wire   [7:0] gemm_core_w_tensor_14_6;
wire   [7:0] gemm_core_w_tensor_14_7;
wire   [7:0] gemm_core_w_tensor_14_8;
wire   [7:0] gemm_core_w_tensor_14_9;
wire   [7:0] gemm_core_w_tensor_14_10;
wire   [7:0] gemm_core_w_tensor_14_11;
wire   [7:0] gemm_core_w_tensor_14_12;
wire   [7:0] gemm_core_w_tensor_14_13;
wire   [7:0] gemm_core_w_tensor_14_14;
wire   [7:0] gemm_core_w_tensor_14_15;

wire   [7:0] gemm_core_w_tensor_15_0;
wire   [7:0] gemm_core_w_tensor_15_1;
wire   [7:0] gemm_core_w_tensor_15_2;
wire   [7:0] gemm_core_w_tensor_15_3;
wire   [7:0] gemm_core_w_tensor_15_4;
wire   [7:0] gemm_core_w_tensor_15_5;
wire   [7:0] gemm_core_w_tensor_15_6;
wire   [7:0] gemm_core_w_tensor_15_7;
wire   [7:0] gemm_core_w_tensor_15_8;
wire   [7:0] gemm_core_w_tensor_15_9;
wire   [7:0] gemm_core_w_tensor_15_10;
wire   [7:0] gemm_core_w_tensor_15_11;
wire   [7:0] gemm_core_w_tensor_15_12;
wire   [7:0] gemm_core_w_tensor_15_13;
wire   [7:0] gemm_core_w_tensor_15_14;
wire   [7:0] gemm_core_w_tensor_15_15;

wire   [31:0] gemm_core_a_tensor_0_0;
wire   [31:0] gemm_core_a_tensor_0_1;
wire   [31:0] gemm_core_a_tensor_0_2;
wire   [31:0] gemm_core_a_tensor_0_3;
wire   [31:0] gemm_core_a_tensor_0_4;
wire   [31:0] gemm_core_a_tensor_0_5;
wire   [31:0] gemm_core_a_tensor_0_6;
wire   [31:0] gemm_core_a_tensor_0_7;
wire   [31:0] gemm_core_a_tensor_0_8;
wire   [31:0] gemm_core_a_tensor_0_9;
wire   [31:0] gemm_core_a_tensor_0_10;
wire   [31:0] gemm_core_a_tensor_0_11;
wire   [31:0] gemm_core_a_tensor_0_12;
wire   [31:0] gemm_core_a_tensor_0_13;
wire   [31:0] gemm_core_a_tensor_0_14;
wire   [31:0] gemm_core_a_tensor_0_15;

wire   [31:0] gemm_core_acc_out_0;
wire   [31:0] gemm_core_acc_out_1;
wire   [31:0] gemm_core_acc_out_2;
wire   [31:0] gemm_core_acc_out_3;
wire   [31:0] gemm_core_acc_out_4;
wire   [31:0] gemm_core_acc_out_5;
wire   [31:0] gemm_core_acc_out_6;
wire   [31:0] gemm_core_acc_out_7;
wire   [31:0] gemm_core_acc_out_8;
wire   [31:0] gemm_core_acc_out_9;
wire   [31:0] gemm_core_acc_out_10;
wire   [31:0] gemm_core_acc_out_11;
wire   [31:0] gemm_core_acc_out_12;
wire   [31:0] gemm_core_acc_out_13;
wire   [31:0] gemm_core_acc_out_14;
wire   [31:0] gemm_core_acc_out_15;

wire   [7:0]  gemm_core_output_0;
wire   [7:0]  gemm_core_output_1;
wire   [7:0]  gemm_core_output_2;
wire   [7:0]  gemm_core_output_3;
wire   [7:0]  gemm_core_output_4;
wire   [7:0]  gemm_core_output_5;
wire   [7:0]  gemm_core_output_6;
wire   [7:0]  gemm_core_output_7;
wire   [7:0]  gemm_core_output_8;
wire   [7:0]  gemm_core_output_9;
wire   [7:0]  gemm_core_output_10;
wire   [7:0]  gemm_core_output_11;
wire   [7:0]  gemm_core_output_12;
wire   [7:0]  gemm_core_output_13;
wire   [7:0]  gemm_core_output_14;
wire   [7:0]  gemm_core_output_15;

wire          gemm_core_gemm_reset;
wire          gemm_core_in_valid;
wire          gemm_core_output_valid;

wire          gemm_reset;
reg           data_valid;

reg           computing_flag;

initial $readmemh("/home/sun/File/TVM/projects/stacc/gemm/src/inp.dat", inp_memory);
initial $readmemh("/home/sun/File/TVM/projects/stacc/gemm/src/wgt.dat", wgt_memory);
initial $readmemh("/home/sun/File/TVM/projects/stacc/gemm/src/acc.dat", acc_memory);
initial $readmemb("/home/sun/File/TVM/projects/stacc/gemm/src/rst.dat", rst_memory);

initial begin
    clk       = 0;
    reset     = 1;
    inp_addr  = 32'h0000_0000;
    wgt_addr  = 32'h0000_0000;
    out_addr  = 32'h0000_0000;
    acc_addr  = 32'h0000_0000;
    rst_addr  = 32'h0000_0000;
    #10 reset = 0;
    #20000 $finish;
end

always #2 clk = ~clk;
assign ap_clk = clk;
assign ap_rst_n = ~reset;


always@(posedge clk) begin
    if(reset)begin
        inp_addr <= 32'h0000_0000;
    end
    else if(gemm_core_output_valid) begin
        inp_addr <= inp_addr + 1'b1;
    end
    else begin
        inp_addr <= inp_addr;
    end
end

always@(posedge clk) begin
    if(reset)begin
        wgt_addr <= 32'h0000_0000;
    end
    else if(gemm_core_output_valid) begin
        wgt_addr <= wgt_addr + 1'b1;
    end
    else begin
        wgt_addr <= wgt_addr;
    end
end

always@(posedge clk) begin
    if(reset)begin
        acc_addr <= 32'h0000_0000;
    end
    else if(gemm_core_output_valid) begin
        acc_addr <= acc_addr + 1'b1;
    end
    else begin
        acc_addr <= acc_addr;
    end
end

always@(posedge clk) begin
    if(reset)begin
        rst_addr <= 32'h0000_0000;
    end
    else if(gemm_core_output_valid) begin
        rst_addr <= rst_addr + 1'b1;
    end
    else begin
        rst_addr <= rst_addr;
    end
end

always@(posedge clk) begin
    if(reset)begin
        out_addr <= 32'h0000_0000;
    end
    else if(gemm_core_output_valid) begin
        out_addr <= out_addr + 1'b1;
    end
    else begin
        out_addr <= out_addr;
    end
end

always@(*) begin
    if(reset) begin
        computing_flag <= 1'b0;
    end
    else if(data_valid == 1'b1) begin
        computing_flag <= 1'b1;
    end
    else if(gemm_core_output_valid) begin
        computing_flag <= 1'b0;
    end
    else begin
        computing_flag <= computing_flag;
    end
end

always@(posedge clk) begin
    if(reset) begin
        data_valid <= 1'b0;
    end
    else if(computing_flag == 1'b0) begin
        data_valid <= 1'b1;
    end
    else begin
        data_valid <= 1'b0;
    end
end

assign inp_v = inp_memory[inp_addr];
assign wgt_v = wgt_memory[wgt_addr];
assign acc_v = acc_memory[acc_addr];
assign rst_f = rst_memory[rst_addr];

assign  inp  = inp_v;
assign  wgt0 = wgt_v[1023:0];
assign  wgt1 = wgt_v[2047:1024];
assign  acc  = acc_v;
assign  gemm_reset = rst_f;

// Acc Mem INPUT interface
assign gemm_core_a_tensor_0_0  =   acc[31:0];
assign gemm_core_a_tensor_0_1  = {{acc[63:32]}};
assign gemm_core_a_tensor_0_2  = {{acc[95:64]}};
assign gemm_core_a_tensor_0_3  = {{acc[127:96]}};
assign gemm_core_a_tensor_0_4  = {{acc[159:128]}};
assign gemm_core_a_tensor_0_5  = {{acc[191:160]}};
assign gemm_core_a_tensor_0_6  = {{acc[223:192]}};
assign gemm_core_a_tensor_0_7  = {{acc[255:224]}};
assign gemm_core_a_tensor_0_8  = {{acc[287:256]}};
assign gemm_core_a_tensor_0_9  = {{acc[319:288]}};
assign gemm_core_a_tensor_0_10 = {{acc[351:320]}};
assign gemm_core_a_tensor_0_11 = {{acc[383:352]}};
assign gemm_core_a_tensor_0_12 = {{acc[415:384]}};
assign gemm_core_a_tensor_0_13 = {{acc[447:416]}};
assign gemm_core_a_tensor_0_14 = {{acc[479:448]}};
assign gemm_core_a_tensor_0_15 = {{acc[511:480]}};

// Input mem INPUT interface
assign gemm_core_i_tensor_0_0  =   inp[7:0];
assign gemm_core_i_tensor_0_1  = {{inp[15:8]}};
assign gemm_core_i_tensor_0_2  = {{inp[23:16]}};
assign gemm_core_i_tensor_0_3  = {{inp[31:24]}};
assign gemm_core_i_tensor_0_4  = {{inp[39:32]}};
assign gemm_core_i_tensor_0_5  = {{inp[47:40]}};
assign gemm_core_i_tensor_0_6  = {{inp[55:48]}};
assign gemm_core_i_tensor_0_7  = {{inp[63:56]}};
assign gemm_core_i_tensor_0_8  = {{inp[71:64]}};
assign gemm_core_i_tensor_0_9  = {{inp[79:72]}};
assign gemm_core_i_tensor_0_10 = {{inp[87:80]}};
assign gemm_core_i_tensor_0_11 = {{inp[95:88]}};
assign gemm_core_i_tensor_0_12 = {{inp[103:96]}};
assign gemm_core_i_tensor_0_13 = {{inp[111:104]}};
assign gemm_core_i_tensor_0_14 = {{inp[119:112]}};
assign gemm_core_i_tensor_0_15 = {{inp[127:120]}};

// Weight mem INPUT interface
assign gemm_core_w_tensor_0_0 = wgt0[7:0];
assign gemm_core_w_tensor_0_1 = {{wgt0[15:8]}};
assign gemm_core_w_tensor_0_2 = {{wgt0[23:16]}};
assign gemm_core_w_tensor_0_3 = {{wgt0[31:24]}};
assign gemm_core_w_tensor_0_4 = {{wgt0[39:32]}};
assign gemm_core_w_tensor_0_5 = {{wgt0[47:40]}};
assign gemm_core_w_tensor_0_6 = {{wgt0[55:48]}};
assign gemm_core_w_tensor_0_7 = {{wgt0[63:56]}};
assign gemm_core_w_tensor_0_8 = wgt1[7:0];
assign gemm_core_w_tensor_0_9 = {{wgt1[15:8]}};
assign gemm_core_w_tensor_0_10 = {{wgt1[23:16]}};
assign gemm_core_w_tensor_0_11 = {{wgt1[31:24]}};
assign gemm_core_w_tensor_0_12 = {{wgt1[39:32]}};
assign gemm_core_w_tensor_0_13 = {{wgt1[47:40]}};
assign gemm_core_w_tensor_0_14 = {{wgt1[55:48]}};
assign gemm_core_w_tensor_0_15 = {{wgt1[63:56]}};

assign gemm_core_w_tensor_1_0 = {{wgt0[71:64]}};
assign gemm_core_w_tensor_1_1 = {{wgt0[79:72]}};
assign gemm_core_w_tensor_1_2 = {{wgt0[87:80]}};
assign gemm_core_w_tensor_1_3 = {{wgt0[95:88]}};
assign gemm_core_w_tensor_1_4 = {{wgt0[103:96]}};
assign gemm_core_w_tensor_1_5 = {{wgt0[111:104]}};
assign gemm_core_w_tensor_1_6 = {{wgt0[119:112]}};
assign gemm_core_w_tensor_1_7 = {{wgt0[127:120]}};
assign gemm_core_w_tensor_1_8 = {{wgt1[71:64]}};
assign gemm_core_w_tensor_1_9 = {{wgt1[79:72]}};
assign gemm_core_w_tensor_1_10 = {{wgt1[87:80]}};
assign gemm_core_w_tensor_1_11 = {{wgt1[95:88]}};
assign gemm_core_w_tensor_1_12 = {{wgt1[103:96]}};
assign gemm_core_w_tensor_1_13 = {{wgt1[111:104]}};
assign gemm_core_w_tensor_1_14 = {{wgt1[119:112]}};
assign gemm_core_w_tensor_1_15 = {{wgt1[127:120]}};

assign gemm_core_w_tensor_2_0 = {{wgt0[135:128]}};
assign gemm_core_w_tensor_2_1 = {{wgt0[143:136]}};
assign gemm_core_w_tensor_2_2 = {{wgt0[151:144]}};
assign gemm_core_w_tensor_2_3 = {{wgt0[159:152]}};
assign gemm_core_w_tensor_2_4 = {{wgt0[167:160]}};
assign gemm_core_w_tensor_2_5 = {{wgt0[175:168]}};
assign gemm_core_w_tensor_2_6 = {{wgt0[183:176]}};
assign gemm_core_w_tensor_2_7 = {{wgt0[191:184]}};
assign gemm_core_w_tensor_2_8 = {{wgt1[135:128]}};
assign gemm_core_w_tensor_2_9 = {{wgt1[143:136]}};
assign gemm_core_w_tensor_2_10 = {{wgt1[151:144]}};
assign gemm_core_w_tensor_2_11 = {{wgt1[159:152]}};
assign gemm_core_w_tensor_2_12 = {{wgt1[167:160]}};
assign gemm_core_w_tensor_2_13 = {{wgt1[175:168]}};
assign gemm_core_w_tensor_2_14 = {{wgt1[183:176]}};
assign gemm_core_w_tensor_2_15 = {{wgt1[191:184]}};

assign gemm_core_w_tensor_3_0 = {{wgt0[199:192]}};
assign gemm_core_w_tensor_3_1 = {{wgt0[207:200]}};
assign gemm_core_w_tensor_3_2 = {{wgt0[215:208]}};
assign gemm_core_w_tensor_3_3 = {{wgt0[223:216]}};
assign gemm_core_w_tensor_3_4 = {{wgt0[231:224]}};
assign gemm_core_w_tensor_3_5 = {{wgt0[239:232]}};
assign gemm_core_w_tensor_3_6 = {{wgt0[247:240]}};
assign gemm_core_w_tensor_3_7 = {{wgt0[255:248]}};
assign gemm_core_w_tensor_3_8 = {{wgt1[199:192]}};
assign gemm_core_w_tensor_3_9 = {{wgt1[207:200]}};
assign gemm_core_w_tensor_3_10 = {{wgt1[215:208]}};
assign gemm_core_w_tensor_3_11 = {{wgt1[223:216]}};
assign gemm_core_w_tensor_3_12 = {{wgt1[231:224]}};
assign gemm_core_w_tensor_3_13 = {{wgt1[239:232]}};
assign gemm_core_w_tensor_3_14 = {{wgt1[247:240]}};
assign gemm_core_w_tensor_3_15 = {{wgt1[255:248]}};

assign gemm_core_w_tensor_4_0 = {{wgt0[263:256]}};
assign gemm_core_w_tensor_4_1 = {{wgt0[271:264]}};
assign gemm_core_w_tensor_4_2 = {{wgt0[279:272]}};
assign gemm_core_w_tensor_4_3 = {{wgt0[287:280]}};
assign gemm_core_w_tensor_4_4 = {{wgt0[295:288]}};
assign gemm_core_w_tensor_4_5 = {{wgt0[303:296]}};
assign gemm_core_w_tensor_4_6 = {{wgt0[311:304]}};
assign gemm_core_w_tensor_4_7 = {{wgt0[319:312]}};
assign gemm_core_w_tensor_4_8 = {{wgt1[263:256]}};
assign gemm_core_w_tensor_4_9 = {{wgt1[271:264]}};
assign gemm_core_w_tensor_4_10 = {{wgt1[279:272]}};
assign gemm_core_w_tensor_4_11 = {{wgt1[287:280]}};
assign gemm_core_w_tensor_4_12 = {{wgt1[295:288]}};
assign gemm_core_w_tensor_4_13 = {{wgt1[303:296]}};
assign gemm_core_w_tensor_4_14 = {{wgt1[311:304]}};
assign gemm_core_w_tensor_4_15 = {{wgt1[319:312]}};

assign gemm_core_w_tensor_5_0 = {{wgt0[327:320]}};
assign gemm_core_w_tensor_5_1 = {{wgt0[335:328]}};
assign gemm_core_w_tensor_5_2 = {{wgt0[343:336]}};
assign gemm_core_w_tensor_5_3 = {{wgt0[351:344]}};
assign gemm_core_w_tensor_5_4 = {{wgt0[359:352]}};
assign gemm_core_w_tensor_5_5 = {{wgt0[367:360]}};
assign gemm_core_w_tensor_5_6 = {{wgt0[375:368]}};
assign gemm_core_w_tensor_5_7 = {{wgt0[383:376]}};
assign gemm_core_w_tensor_5_8 = {{wgt1[327:320]}};
assign gemm_core_w_tensor_5_9 = {{wgt1[335:328]}};
assign gemm_core_w_tensor_5_10 = {{wgt1[343:336]}};
assign gemm_core_w_tensor_5_11 = {{wgt1[351:344]}};
assign gemm_core_w_tensor_5_12 = {{wgt1[359:352]}};
assign gemm_core_w_tensor_5_13 = {{wgt1[367:360]}};
assign gemm_core_w_tensor_5_14 = {{wgt1[375:368]}};
assign gemm_core_w_tensor_5_15 = {{wgt1[383:376]}};

assign gemm_core_w_tensor_6_0 = {{wgt0[391:384]}};
assign gemm_core_w_tensor_6_1 = {{wgt0[399:392]}};
assign gemm_core_w_tensor_6_2 = {{wgt0[407:400]}};
assign gemm_core_w_tensor_6_3 = {{wgt0[415:408]}};
assign gemm_core_w_tensor_6_4 = {{wgt0[423:416]}};
assign gemm_core_w_tensor_6_5 = {{wgt0[431:424]}};
assign gemm_core_w_tensor_6_6 = {{wgt0[439:432]}};
assign gemm_core_w_tensor_6_7 = {{wgt0[447:440]}};
assign gemm_core_w_tensor_6_8 = {{wgt1[391:384]}};
assign gemm_core_w_tensor_6_9 = {{wgt1[399:392]}};
assign gemm_core_w_tensor_6_10 = {{wgt1[407:400]}};
assign gemm_core_w_tensor_6_11 = {{wgt1[415:408]}};
assign gemm_core_w_tensor_6_12 = {{wgt1[423:416]}};
assign gemm_core_w_tensor_6_13 = {{wgt1[431:424]}};
assign gemm_core_w_tensor_6_14 = {{wgt1[439:432]}};
assign gemm_core_w_tensor_6_15 = {{wgt1[447:440]}};

assign gemm_core_w_tensor_7_0 = {{wgt0[455:448]}};
assign gemm_core_w_tensor_7_1 = {{wgt0[463:456]}};
assign gemm_core_w_tensor_7_2 = {{wgt0[471:464]}};
assign gemm_core_w_tensor_7_3 = {{wgt0[479:472]}};
assign gemm_core_w_tensor_7_4 = {{wgt0[487:480]}};
assign gemm_core_w_tensor_7_5 = {{wgt0[495:488]}};
assign gemm_core_w_tensor_7_6 = {{wgt0[503:496]}};
assign gemm_core_w_tensor_7_7 = {{wgt0[511:504]}};
assign gemm_core_w_tensor_7_8 = {{wgt1[455:448]}};
assign gemm_core_w_tensor_7_9 = {{wgt1[463:456]}};
assign gemm_core_w_tensor_7_10 = {{wgt1[471:464]}};
assign gemm_core_w_tensor_7_11 = {{wgt1[479:472]}};
assign gemm_core_w_tensor_7_12 = {{wgt1[487:480]}};
assign gemm_core_w_tensor_7_13 = {{wgt1[495:488]}};
assign gemm_core_w_tensor_7_14 = {{wgt1[503:496]}};
assign gemm_core_w_tensor_7_15 = {{wgt1[511:504]}};

assign gemm_core_w_tensor_8_0 = {{wgt0[519:512]}};
assign gemm_core_w_tensor_8_1 = {{wgt0[527:520]}};
assign gemm_core_w_tensor_8_2 = {{wgt0[535:528]}};
assign gemm_core_w_tensor_8_3 = {{wgt0[543:536]}};
assign gemm_core_w_tensor_8_4 = {{wgt0[551:544]}};
assign gemm_core_w_tensor_8_5 = {{wgt0[559:552]}};
assign gemm_core_w_tensor_8_6 = {{wgt0[567:560]}};
assign gemm_core_w_tensor_8_7 = {{wgt0[575:568]}};
assign gemm_core_w_tensor_8_8 = {{wgt1[519:512]}};
assign gemm_core_w_tensor_8_9 = {{wgt1[527:520]}};
assign gemm_core_w_tensor_8_10 = {{wgt1[535:528]}};
assign gemm_core_w_tensor_8_11 = {{wgt1[543:536]}};
assign gemm_core_w_tensor_8_12 = {{wgt1[551:544]}};
assign gemm_core_w_tensor_8_13 = {{wgt1[559:552]}};
assign gemm_core_w_tensor_8_14 = {{wgt1[567:560]}};
assign gemm_core_w_tensor_8_15 = {{wgt1[575:568]}};

assign gemm_core_w_tensor_9_0 = {{wgt0[583:576]}};
assign gemm_core_w_tensor_9_1 = {{wgt0[591:584]}};
assign gemm_core_w_tensor_9_2 = {{wgt0[599:592]}};
assign gemm_core_w_tensor_9_3 = {{wgt0[607:600]}};
assign gemm_core_w_tensor_9_4 = {{wgt0[615:608]}};
assign gemm_core_w_tensor_9_5 = {{wgt0[623:616]}};
assign gemm_core_w_tensor_9_6 = {{wgt0[631:624]}};
assign gemm_core_w_tensor_9_7 = {{wgt0[639:632]}};
assign gemm_core_w_tensor_9_8 = {{wgt1[583:576]}};
assign gemm_core_w_tensor_9_9 = {{wgt1[591:584]}};
assign gemm_core_w_tensor_9_10 = {{wgt1[599:592]}};
assign gemm_core_w_tensor_9_11 = {{wgt1[607:600]}};
assign gemm_core_w_tensor_9_12 = {{wgt1[615:608]}};
assign gemm_core_w_tensor_9_13 = {{wgt1[623:616]}};
assign gemm_core_w_tensor_9_14 = {{wgt1[631:624]}};
assign gemm_core_w_tensor_9_15 = {{wgt1[639:632]}};

assign gemm_core_w_tensor_10_0 = {{wgt0[647:640]}};
assign gemm_core_w_tensor_10_1 = {{wgt0[655:648]}};
assign gemm_core_w_tensor_10_2 = {{wgt0[663:656]}};
assign gemm_core_w_tensor_10_3 = {{wgt0[671:664]}};
assign gemm_core_w_tensor_10_4 = {{wgt0[679:672]}};
assign gemm_core_w_tensor_10_5 = {{wgt0[687:680]}};
assign gemm_core_w_tensor_10_6 = {{wgt0[695:688]}};
assign gemm_core_w_tensor_10_7 = {{wgt0[703:696]}};
assign gemm_core_w_tensor_10_8 = {{wgt1[647:640]}};
assign gemm_core_w_tensor_10_9 = {{wgt1[655:648]}};
assign gemm_core_w_tensor_10_10 = {{wgt1[663:656]}};
assign gemm_core_w_tensor_10_11 = {{wgt1[671:664]}};
assign gemm_core_w_tensor_10_12 = {{wgt1[679:672]}};
assign gemm_core_w_tensor_10_13 = {{wgt1[687:680]}};
assign gemm_core_w_tensor_10_14 = {{wgt1[695:688]}};
assign gemm_core_w_tensor_10_15 = {{wgt1[703:696]}};

assign gemm_core_w_tensor_11_0 = {{wgt0[711:704]}};
assign gemm_core_w_tensor_11_1 = {{wgt0[719:712]}};
assign gemm_core_w_tensor_11_2 = {{wgt0[727:720]}};
assign gemm_core_w_tensor_11_3 = {{wgt0[735:728]}};
assign gemm_core_w_tensor_11_4 = {{wgt0[743:736]}};
assign gemm_core_w_tensor_11_5 = {{wgt0[751:744]}};
assign gemm_core_w_tensor_11_6 = {{wgt0[759:752]}};
assign gemm_core_w_tensor_11_7 = {{wgt0[767:760]}};
assign gemm_core_w_tensor_11_8 = {{wgt1[711:704]}};
assign gemm_core_w_tensor_11_9 = {{wgt1[719:712]}};
assign gemm_core_w_tensor_11_10 = {{wgt1[727:720]}};
assign gemm_core_w_tensor_11_11 = {{wgt1[735:728]}};
assign gemm_core_w_tensor_11_12 = {{wgt1[743:736]}};
assign gemm_core_w_tensor_11_13 = {{wgt1[751:744]}};
assign gemm_core_w_tensor_11_14 = {{wgt1[759:752]}};
assign gemm_core_w_tensor_11_15 = {{wgt1[767:760]}};

assign gemm_core_w_tensor_12_0 = {{wgt0[775:768]}};
assign gemm_core_w_tensor_12_1 = {{wgt0[783:776]}};
assign gemm_core_w_tensor_12_2 = {{wgt0[791:784]}};
assign gemm_core_w_tensor_12_3 = {{wgt0[799:792]}};
assign gemm_core_w_tensor_12_4 = {{wgt0[807:800]}};
assign gemm_core_w_tensor_12_5 = {{wgt0[815:808]}};
assign gemm_core_w_tensor_12_6 = {{wgt0[823:816]}};
assign gemm_core_w_tensor_12_7 = {{wgt0[831:824]}};
assign gemm_core_w_tensor_12_8 = {{wgt1[775:768]}};
assign gemm_core_w_tensor_12_9 = {{wgt1[783:776]}};
assign gemm_core_w_tensor_12_10 = {{wgt1[791:784]}};
assign gemm_core_w_tensor_12_11 = {{wgt1[799:792]}};
assign gemm_core_w_tensor_12_12 = {{wgt1[807:800]}};
assign gemm_core_w_tensor_12_13 = {{wgt1[815:808]}};
assign gemm_core_w_tensor_12_14 = {{wgt1[823:816]}};
assign gemm_core_w_tensor_12_15 = {{wgt1[831:824]}};

assign gemm_core_w_tensor_13_0 = {{wgt0[839:832]}};
assign gemm_core_w_tensor_13_1 = {{wgt0[847:840]}};
assign gemm_core_w_tensor_13_2 = {{wgt0[855:848]}};
assign gemm_core_w_tensor_13_3 = {{wgt0[863:856]}};
assign gemm_core_w_tensor_13_4 = {{wgt0[871:864]}};
assign gemm_core_w_tensor_13_5 = {{wgt0[879:872]}};
assign gemm_core_w_tensor_13_6 = {{wgt0[887:880]}};
assign gemm_core_w_tensor_13_7 = {{wgt0[895:888]}};
assign gemm_core_w_tensor_13_8 = {{wgt1[839:832]}};
assign gemm_core_w_tensor_13_9 = {{wgt1[847:840]}};
assign gemm_core_w_tensor_13_10 = {{wgt1[855:848]}};
assign gemm_core_w_tensor_13_11 = {{wgt1[863:856]}};
assign gemm_core_w_tensor_13_12 = {{wgt1[871:864]}};
assign gemm_core_w_tensor_13_13 = {{wgt1[879:872]}};
assign gemm_core_w_tensor_13_14 = {{wgt1[887:880]}};
assign gemm_core_w_tensor_13_15 = {{wgt1[895:888]}};

assign gemm_core_w_tensor_14_0 = {{wgt0[903:896]}};
assign gemm_core_w_tensor_14_1 = {{wgt0[911:904]}};
assign gemm_core_w_tensor_14_2 = {{wgt0[919:912]}};
assign gemm_core_w_tensor_14_3 = {{wgt0[927:920]}};
assign gemm_core_w_tensor_14_4 = {{wgt0[935:928]}};
assign gemm_core_w_tensor_14_5 = {{wgt0[943:936]}};
assign gemm_core_w_tensor_14_6 = {{wgt0[951:944]}};
assign gemm_core_w_tensor_14_7 = {{wgt0[959:952]}};
assign gemm_core_w_tensor_14_8 = {{wgt1[903:896]}};
assign gemm_core_w_tensor_14_9 = {{wgt1[911:904]}};
assign gemm_core_w_tensor_14_10 = {{wgt1[919:912]}};
assign gemm_core_w_tensor_14_11 = {{wgt1[927:920]}};
assign gemm_core_w_tensor_14_12 = {{wgt1[935:928]}};
assign gemm_core_w_tensor_14_13 = {{wgt1[943:936]}};
assign gemm_core_w_tensor_14_14 = {{wgt1[951:944]}};
assign gemm_core_w_tensor_14_15 = {{wgt1[959:952]}};

assign gemm_core_w_tensor_15_0 = {{wgt0[967:960]}};
assign gemm_core_w_tensor_15_1 = {{wgt0[975:968]}};
assign gemm_core_w_tensor_15_2 = {{wgt0[983:976]}};
assign gemm_core_w_tensor_15_3 = {{wgt0[991:984]}};
assign gemm_core_w_tensor_15_4 = {{wgt0[999:992]}};
assign gemm_core_w_tensor_15_5 = {{wgt0[1007:1000]}};
assign gemm_core_w_tensor_15_6 = {{wgt0[1015:1008]}};
assign gemm_core_w_tensor_15_7 = {{wgt0[1023:1016]}};
assign gemm_core_w_tensor_15_8 = {{wgt1[967:960]}};
assign gemm_core_w_tensor_15_9 = {{wgt1[975:968]}};
assign gemm_core_w_tensor_15_10 = {{wgt1[983:976]}};
assign gemm_core_w_tensor_15_11 = {{wgt1[991:984]}};
assign gemm_core_w_tensor_15_12 = {{wgt1[999:992]}};
assign gemm_core_w_tensor_15_13 = {{wgt1[1007:1000]}};
assign gemm_core_w_tensor_15_14 = {{wgt1[1015:1008]}};
assign gemm_core_w_tensor_15_15 = {{wgt1[1023:1016]}};

assign gemm_core_in_valid       = data_valid;
assign gemm_core_gemm_reset     = gemm_reset;

gemm_core gemm_core(
    .ap_clk(clk),
    .ap_rst(reset),
    .i_0(gemm_core_i_tensor_0_0),
    .i_1(gemm_core_i_tensor_0_1),
    .i_2(gemm_core_i_tensor_0_2),
    .i_3(gemm_core_i_tensor_0_3),
    .i_4(gemm_core_i_tensor_0_4),
    .i_5(gemm_core_i_tensor_0_5),
    .i_6(gemm_core_i_tensor_0_6),
    .i_7(gemm_core_i_tensor_0_7),
    .i_8(gemm_core_i_tensor_0_8),
    .i_9(gemm_core_i_tensor_0_9),
    .i_a(gemm_core_i_tensor_0_10),
    .i_b(gemm_core_i_tensor_0_11),
    .i_c(gemm_core_i_tensor_0_12),
    .i_d(gemm_core_i_tensor_0_13),
    .i_e(gemm_core_i_tensor_0_14),
    .i_f(gemm_core_i_tensor_0_15),
    .w_00(gemm_core_w_tensor_0_0),
    .w_01(gemm_core_w_tensor_0_1),
    .w_02(gemm_core_w_tensor_0_2),
    .w_03(gemm_core_w_tensor_0_3),
    .w_04(gemm_core_w_tensor_0_4),
    .w_05(gemm_core_w_tensor_0_5),
    .w_06(gemm_core_w_tensor_0_6),
    .w_07(gemm_core_w_tensor_0_7),
    .w_08(gemm_core_w_tensor_0_8),
    .w_09(gemm_core_w_tensor_0_9),
    .w_0a(gemm_core_w_tensor_0_10),
    .w_0b(gemm_core_w_tensor_0_11),
    .w_0c(gemm_core_w_tensor_0_12),
    .w_0d(gemm_core_w_tensor_0_13),
    .w_0e(gemm_core_w_tensor_0_14),
    .w_0f(gemm_core_w_tensor_0_15),
    .w_10(gemm_core_w_tensor_1_0),
    .w_11(gemm_core_w_tensor_1_1),
    .w_12(gemm_core_w_tensor_1_2),
    .w_13(gemm_core_w_tensor_1_3),
    .w_14(gemm_core_w_tensor_1_4),
    .w_15(gemm_core_w_tensor_1_5),
    .w_16(gemm_core_w_tensor_1_6),
    .w_17(gemm_core_w_tensor_1_7),
    .w_18(gemm_core_w_tensor_1_8),
    .w_19(gemm_core_w_tensor_1_9),
    .w_1a(gemm_core_w_tensor_1_10),
    .w_1b(gemm_core_w_tensor_1_11),
    .w_1c(gemm_core_w_tensor_1_12),
    .w_1d(gemm_core_w_tensor_1_13),
    .w_1e(gemm_core_w_tensor_1_14),
    .w_1f(gemm_core_w_tensor_1_15),
    .w_20(gemm_core_w_tensor_2_0),
    .w_21(gemm_core_w_tensor_2_1),
    .w_22(gemm_core_w_tensor_2_2),
    .w_23(gemm_core_w_tensor_2_3),
    .w_24(gemm_core_w_tensor_2_4),
    .w_25(gemm_core_w_tensor_2_5),
    .w_26(gemm_core_w_tensor_2_6),
    .w_27(gemm_core_w_tensor_2_7),
    .w_28(gemm_core_w_tensor_2_8),
    .w_29(gemm_core_w_tensor_2_9),
    .w_2a(gemm_core_w_tensor_2_10),
    .w_2b(gemm_core_w_tensor_2_11),
    .w_2c(gemm_core_w_tensor_2_12),
    .w_2d(gemm_core_w_tensor_2_13),
    .w_2e(gemm_core_w_tensor_2_14),
    .w_2f(gemm_core_w_tensor_2_15),
    .w_30(gemm_core_w_tensor_3_0),
    .w_31(gemm_core_w_tensor_3_1),
    .w_32(gemm_core_w_tensor_3_2),
    .w_33(gemm_core_w_tensor_3_3),
    .w_34(gemm_core_w_tensor_3_4),
    .w_35(gemm_core_w_tensor_3_5),
    .w_36(gemm_core_w_tensor_3_6),
    .w_37(gemm_core_w_tensor_3_7),
    .w_38(gemm_core_w_tensor_3_8),
    .w_39(gemm_core_w_tensor_3_9),
    .w_3a(gemm_core_w_tensor_3_10),
    .w_3b(gemm_core_w_tensor_3_11),
    .w_3c(gemm_core_w_tensor_3_12),
    .w_3d(gemm_core_w_tensor_3_13),
    .w_3e(gemm_core_w_tensor_3_14),
    .w_3f(gemm_core_w_tensor_3_15),
    .w_40(gemm_core_w_tensor_4_0),
    .w_41(gemm_core_w_tensor_4_1),
    .w_42(gemm_core_w_tensor_4_2),
    .w_43(gemm_core_w_tensor_4_3),
    .w_44(gemm_core_w_tensor_4_4),
    .w_45(gemm_core_w_tensor_4_5),
    .w_46(gemm_core_w_tensor_4_6),
    .w_47(gemm_core_w_tensor_4_7),
    .w_48(gemm_core_w_tensor_4_8),
    .w_49(gemm_core_w_tensor_4_9),
    .w_4a(gemm_core_w_tensor_4_10),
    .w_4b(gemm_core_w_tensor_4_11),
    .w_4c(gemm_core_w_tensor_4_12),
    .w_4d(gemm_core_w_tensor_4_13),
    .w_4e(gemm_core_w_tensor_4_14),
    .w_4f(gemm_core_w_tensor_4_15),
    .w_50(gemm_core_w_tensor_5_0),
    .w_51(gemm_core_w_tensor_5_1),
    .w_52(gemm_core_w_tensor_5_2),
    .w_53(gemm_core_w_tensor_5_3),
    .w_54(gemm_core_w_tensor_5_4),
    .w_55(gemm_core_w_tensor_5_5),
    .w_56(gemm_core_w_tensor_5_6),
    .w_57(gemm_core_w_tensor_5_7),
    .w_58(gemm_core_w_tensor_5_8),
    .w_59(gemm_core_w_tensor_5_9),
    .w_5a(gemm_core_w_tensor_5_10),
    .w_5b(gemm_core_w_tensor_5_11),
    .w_5c(gemm_core_w_tensor_5_12),
    .w_5d(gemm_core_w_tensor_5_13),
    .w_5e(gemm_core_w_tensor_5_14),
    .w_5f(gemm_core_w_tensor_5_15),
    .w_60(gemm_core_w_tensor_6_0),
    .w_61(gemm_core_w_tensor_6_1),
    .w_62(gemm_core_w_tensor_6_2),
    .w_63(gemm_core_w_tensor_6_3),
    .w_64(gemm_core_w_tensor_6_4),
    .w_65(gemm_core_w_tensor_6_5),
    .w_66(gemm_core_w_tensor_6_6),
    .w_67(gemm_core_w_tensor_6_7),
    .w_68(gemm_core_w_tensor_6_8),
    .w_69(gemm_core_w_tensor_6_9),
    .w_6a(gemm_core_w_tensor_6_10),
    .w_6b(gemm_core_w_tensor_6_11),
    .w_6c(gemm_core_w_tensor_6_12),
    .w_6d(gemm_core_w_tensor_6_13),
    .w_6e(gemm_core_w_tensor_6_14),
    .w_6f(gemm_core_w_tensor_6_15),
    .w_70(gemm_core_w_tensor_7_0),
    .w_71(gemm_core_w_tensor_7_1),
    .w_72(gemm_core_w_tensor_7_2),
    .w_73(gemm_core_w_tensor_7_3),
    .w_74(gemm_core_w_tensor_7_4),
    .w_75(gemm_core_w_tensor_7_5),
    .w_76(gemm_core_w_tensor_7_6),
    .w_77(gemm_core_w_tensor_7_7),
    .w_78(gemm_core_w_tensor_7_8),
    .w_79(gemm_core_w_tensor_7_9),
    .w_7a(gemm_core_w_tensor_7_10),
    .w_7b(gemm_core_w_tensor_7_11),
    .w_7c(gemm_core_w_tensor_7_12),
    .w_7d(gemm_core_w_tensor_7_13),
    .w_7e(gemm_core_w_tensor_7_14),
    .w_7f(gemm_core_w_tensor_7_15),
    .w_80(gemm_core_w_tensor_8_0),
    .w_81(gemm_core_w_tensor_8_1),
    .w_82(gemm_core_w_tensor_8_2),
    .w_83(gemm_core_w_tensor_8_3),
    .w_84(gemm_core_w_tensor_8_4),
    .w_85(gemm_core_w_tensor_8_5),
    .w_86(gemm_core_w_tensor_8_6),
    .w_87(gemm_core_w_tensor_8_7),
    .w_88(gemm_core_w_tensor_8_8),
    .w_89(gemm_core_w_tensor_8_9),
    .w_8a(gemm_core_w_tensor_8_10),
    .w_8b(gemm_core_w_tensor_8_11),
    .w_8c(gemm_core_w_tensor_8_12),
    .w_8d(gemm_core_w_tensor_8_13),
    .w_8e(gemm_core_w_tensor_8_14),
    .w_8f(gemm_core_w_tensor_8_15),
    .w_90(gemm_core_w_tensor_9_0),
    .w_91(gemm_core_w_tensor_9_1),
    .w_92(gemm_core_w_tensor_9_2),
    .w_93(gemm_core_w_tensor_9_3),
    .w_94(gemm_core_w_tensor_9_4),
    .w_95(gemm_core_w_tensor_9_5),
    .w_96(gemm_core_w_tensor_9_6),
    .w_97(gemm_core_w_tensor_9_7),
    .w_98(gemm_core_w_tensor_9_8),
    .w_99(gemm_core_w_tensor_9_9),
    .w_9a(gemm_core_w_tensor_9_10),
    .w_9b(gemm_core_w_tensor_9_11),
    .w_9c(gemm_core_w_tensor_9_12),
    .w_9d(gemm_core_w_tensor_9_13),
    .w_9e(gemm_core_w_tensor_9_14),
    .w_9f(gemm_core_w_tensor_9_15),
    .w_a0(gemm_core_w_tensor_10_0),
    .w_a1(gemm_core_w_tensor_10_1),
    .w_a2(gemm_core_w_tensor_10_2),
    .w_a3(gemm_core_w_tensor_10_3),
    .w_a4(gemm_core_w_tensor_10_4),
    .w_a5(gemm_core_w_tensor_10_5),
    .w_a6(gemm_core_w_tensor_10_6),
    .w_a7(gemm_core_w_tensor_10_7),
    .w_a8(gemm_core_w_tensor_10_8),
    .w_a9(gemm_core_w_tensor_10_9),
    .w_aa(gemm_core_w_tensor_10_10),
    .w_ab(gemm_core_w_tensor_10_11),
    .w_ac(gemm_core_w_tensor_10_12),
    .w_ad(gemm_core_w_tensor_10_13),
    .w_ae(gemm_core_w_tensor_10_14),
    .w_af(gemm_core_w_tensor_10_15),
    .w_b0(gemm_core_w_tensor_11_0),
    .w_b1(gemm_core_w_tensor_11_1),
    .w_b2(gemm_core_w_tensor_11_2),
    .w_b3(gemm_core_w_tensor_11_3),
    .w_b4(gemm_core_w_tensor_11_4),
    .w_b5(gemm_core_w_tensor_11_5),
    .w_b6(gemm_core_w_tensor_11_6),
    .w_b7(gemm_core_w_tensor_11_7),
    .w_b8(gemm_core_w_tensor_11_8),
    .w_b9(gemm_core_w_tensor_11_9),
    .w_ba(gemm_core_w_tensor_11_10),
    .w_bb(gemm_core_w_tensor_11_11),
    .w_bc(gemm_core_w_tensor_11_12),
    .w_bd(gemm_core_w_tensor_11_13),
    .w_be(gemm_core_w_tensor_11_14),
    .w_bf(gemm_core_w_tensor_11_15),
    .w_c0(gemm_core_w_tensor_12_0),
    .w_c1(gemm_core_w_tensor_12_1),
    .w_c2(gemm_core_w_tensor_12_2),
    .w_c3(gemm_core_w_tensor_12_3),
    .w_c4(gemm_core_w_tensor_12_4),
    .w_c5(gemm_core_w_tensor_12_5),
    .w_c6(gemm_core_w_tensor_12_6),
    .w_c7(gemm_core_w_tensor_12_7),
    .w_c8(gemm_core_w_tensor_12_8),
    .w_c9(gemm_core_w_tensor_12_9),
    .w_ca(gemm_core_w_tensor_12_10),
    .w_cb(gemm_core_w_tensor_12_11),
    .w_cc(gemm_core_w_tensor_12_12),
    .w_cd(gemm_core_w_tensor_12_13),
    .w_ce(gemm_core_w_tensor_12_14),
    .w_cf(gemm_core_w_tensor_12_15),
    .w_d0(gemm_core_w_tensor_13_0),
    .w_d1(gemm_core_w_tensor_13_1),
    .w_d2(gemm_core_w_tensor_13_2),
    .w_d3(gemm_core_w_tensor_13_3),
    .w_d4(gemm_core_w_tensor_13_4),
    .w_d5(gemm_core_w_tensor_13_5),
    .w_d6(gemm_core_w_tensor_13_6),
    .w_d7(gemm_core_w_tensor_13_7),
    .w_d8(gemm_core_w_tensor_13_8),
    .w_d9(gemm_core_w_tensor_13_9),
    .w_da(gemm_core_w_tensor_13_10),
    .w_db(gemm_core_w_tensor_13_11),
    .w_dc(gemm_core_w_tensor_13_12),
    .w_dd(gemm_core_w_tensor_13_13),
    .w_de(gemm_core_w_tensor_13_14),
    .w_df(gemm_core_w_tensor_13_15),
    .w_e0(gemm_core_w_tensor_14_0),
    .w_e1(gemm_core_w_tensor_14_1),
    .w_e2(gemm_core_w_tensor_14_2),
    .w_e3(gemm_core_w_tensor_14_3),
    .w_e4(gemm_core_w_tensor_14_4),
    .w_e5(gemm_core_w_tensor_14_5),
    .w_e6(gemm_core_w_tensor_14_6),
    .w_e7(gemm_core_w_tensor_14_7),
    .w_e8(gemm_core_w_tensor_14_8),
    .w_e9(gemm_core_w_tensor_14_9),
    .w_ea(gemm_core_w_tensor_14_10),
    .w_eb(gemm_core_w_tensor_14_11),
    .w_ec(gemm_core_w_tensor_14_12),
    .w_ed(gemm_core_w_tensor_14_13),
    .w_ee(gemm_core_w_tensor_14_14),
    .w_ef(gemm_core_w_tensor_14_15),
    .w_f0(gemm_core_w_tensor_15_0),
    .w_f1(gemm_core_w_tensor_15_1),
    .w_f2(gemm_core_w_tensor_15_2),
    .w_f3(gemm_core_w_tensor_15_3),
    .w_f4(gemm_core_w_tensor_15_4),
    .w_f5(gemm_core_w_tensor_15_5),
    .w_f6(gemm_core_w_tensor_15_6),
    .w_f7(gemm_core_w_tensor_15_7),
    .w_f8(gemm_core_w_tensor_15_8),
    .w_f9(gemm_core_w_tensor_15_9),
    .w_fa(gemm_core_w_tensor_15_10),
    .w_fb(gemm_core_w_tensor_15_11),
    .w_fc(gemm_core_w_tensor_15_12),
    .w_fd(gemm_core_w_tensor_15_13),
    .w_fe(gemm_core_w_tensor_15_14),
    .w_ff(gemm_core_w_tensor_15_15),

    .a_0(gemm_core_a_tensor_0_0),
    .a_1(gemm_core_a_tensor_0_1),
    .a_2(gemm_core_a_tensor_0_2),
    .a_3(gemm_core_a_tensor_0_3),
    .a_4(gemm_core_a_tensor_0_4),
    .a_5(gemm_core_a_tensor_0_5),
    .a_6(gemm_core_a_tensor_0_6),
    .a_7(gemm_core_a_tensor_0_7),
    .a_8(gemm_core_a_tensor_0_8),
    .a_9(gemm_core_a_tensor_0_9),
    .a_a(gemm_core_a_tensor_0_10),
    .a_b(gemm_core_a_tensor_0_11),
    .a_c(gemm_core_a_tensor_0_12),
    .a_d(gemm_core_a_tensor_0_13),
    .a_e(gemm_core_a_tensor_0_14),
    .a_f(gemm_core_a_tensor_0_15),

    .a_out_0(gemm_core_acc_out_0),
    .a_out_1(gemm_core_acc_out_1),
    .a_out_2(gemm_core_acc_out_2),
    .a_out_3(gemm_core_acc_out_3),
    .a_out_4(gemm_core_acc_out_4),
    .a_out_5(gemm_core_acc_out_5),
    .a_out_6(gemm_core_acc_out_6),
    .a_out_7(gemm_core_acc_out_7),
    .a_out_8(gemm_core_acc_out_8),
    .a_out_9(gemm_core_acc_out_9),
    .a_out_a(gemm_core_acc_out_10),
    .a_out_b(gemm_core_acc_out_11),
    .a_out_c(gemm_core_acc_out_12),
    .a_out_d(gemm_core_acc_out_13),
    .a_out_e(gemm_core_acc_out_14),
    .a_out_f(gemm_core_acc_out_15),

    .o_0(gemm_core_output_0),
    .o_1(gemm_core_output_1),
    .o_2(gemm_core_output_2),
    .o_3(gemm_core_output_3),
    .o_4(gemm_core_output_4),
    .o_5(gemm_core_output_5),
    .o_6(gemm_core_output_6),
    .o_7(gemm_core_output_7),
    .o_8(gemm_core_output_8),
    .o_9(gemm_core_output_9),
    .o_a(gemm_core_output_10),
    .o_b(gemm_core_output_11),
    .o_c(gemm_core_output_12),
    .o_d(gemm_core_output_13),
    .o_e(gemm_core_output_14),
    .o_f(gemm_core_output_15),

    .gemm_reset(gemm_core_gemm_reset),
    .in_valid(gemm_core_in_valid),
    .output_valid(gemm_core_output_valid)
);

endmodule