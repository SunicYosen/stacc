// ==============================================================
// RTL GEMM
// Copyright (C) Sunic
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gemm (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        insn_raw_V,
        uop_mem_V_2_address0,
        uop_mem_V_2_ce0,
        uop_mem_V_2_q0,
        acc_mem_V_2_address0,
        acc_mem_V_2_ce0,
        acc_mem_V_2_we0,
        acc_mem_V_2_d0,
        acc_mem_V_2_q0,
        inp_mem_V_Addr_A,
        inp_mem_V_EN_A,
        inp_mem_V_WEN_A,
        inp_mem_V_Din_A,
        inp_mem_V_Dout_A,
        wgt_mem_0_V_Addr_A,
        wgt_mem_0_V_EN_A,
        wgt_mem_0_V_WEN_A,
        wgt_mem_0_V_Din_A,
        wgt_mem_0_V_Dout_A,
        wgt_mem_1_V_Addr_A,
        wgt_mem_1_V_EN_A,
        wgt_mem_1_V_WEN_A,
        wgt_mem_1_V_Din_A,
        wgt_mem_1_V_Dout_A,
        out_mem_V_Addr_A,
        out_mem_V_EN_A,
        out_mem_V_WEN_A,
        out_mem_V_Din_A,
        out_mem_V_Dout_A
);

parameter    ap_ST_fsm_state1     = 10'd1;
parameter    ap_ST_fsm_state2     = 10'd2;
parameter    ap_ST_fsm_state3     = 10'd4;
parameter    ap_ST_fsm_pp0_stage0 = 10'd8;
parameter    ap_ST_fsm_pp0_stage1 = 10'd16;
parameter    ap_ST_fsm_pp0_stage2 = 10'd32;
parameter    ap_ST_fsm_pp0_stage3 = 10'd64;
parameter    ap_ST_fsm_pp0_stage4 = 10'd128;
parameter    ap_ST_fsm_pp0_stage5 = 10'd256;
parameter    ap_ST_fsm_state11    = 10'd512;

input    ap_clk;
input    ap_rst;
input    ap_start;   // 
output   ap_done;    // 
output   ap_idle;
output   ap_ready;   // when get iter out 

input  [127:0] insn_raw_V;
output  [12:0] uop_mem_V_2_address0;
output   uop_mem_V_2_ce0;
input  [31:0] uop_mem_V_2_q0;
output  [10:0] acc_mem_V_2_address0;
output   acc_mem_V_2_ce0;
output  [63:0] acc_mem_V_2_we0;
output  [511:0] acc_mem_V_2_d0;
input  [511:0] acc_mem_V_2_q0;
output  [31:0] inp_mem_V_Addr_A;
output   inp_mem_V_EN_A;
output  [15:0] inp_mem_V_WEN_A;
output  [127:0] inp_mem_V_Din_A;
input  [127:0] inp_mem_V_Dout_A;
output  [31:0] wgt_mem_0_V_Addr_A;
output   wgt_mem_0_V_EN_A;
output  [127:0] wgt_mem_0_V_WEN_A;
output  [1023:0] wgt_mem_0_V_Din_A;
input  [1023:0] wgt_mem_0_V_Dout_A;
output  [31:0] wgt_mem_1_V_Addr_A;
output   wgt_mem_1_V_EN_A;
output  [127:0] wgt_mem_1_V_WEN_A;
output  [1023:0] wgt_mem_1_V_Din_A;
input  [1023:0] wgt_mem_1_V_Dout_A;
output  [31:0] out_mem_V_Addr_A;
output   out_mem_V_EN_A;
output  [15:0] out_mem_V_WEN_A;
output  [127:0] out_mem_V_Din_A;
input  [127:0] out_mem_V_Dout_A;  // No use

reg ap_done;
reg ap_idle;
reg ap_ready;
reg uop_mem_V_2_ce0;
reg[10:0] acc_mem_V_2_address0;
reg acc_mem_V_2_ce0;
reg[63:0] acc_mem_V_2_we0;
reg inp_mem_V_EN_A;
reg wgt_mem_0_V_EN_A;
reg wgt_mem_1_V_EN_A;
reg out_mem_V_EN_A;
reg[15:0] out_mem_V_WEN_A;

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
wire          gemm_core_done;
wire          gemm_core_in_valid;
wire          gemm_core_output_valid;
wire          gemm_core_state_done;

reg           gemm_in_valid_reg;

reg           output_valid_reg_iter0;

(* fsm_encoding = "none" *) reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg  signed [31:0] uop_iter_index_reg;
reg   [0:0] gemm_reset_reg;
wire   [13:0] iter_out_index_next_wire;
reg   [13:0] iter_out_index_next_reg;
wire    ap_CS_fsm_state2;

wire    icmp_eq_iter_out;
wire    icmp_eq_iter_in;
wire    icmp_less_uop_index_than_end_wire;
reg     icmp_less_uop_index_than_end_reg_iter1;
wire    ap_CS_fsm_state3;
wire   [13:0] iter_in_index_next_wire;
reg   [13:0] iter_in_index_next_reg;
reg   [31:0] uop_end_reg0;
wire   [11:0] dst_offset_out_wire12;
wire   [11:0] src_offset_out_wire12;
wire   [10:0] wgt_offset_out_wire11;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_CS_fsm_pp0_stage1;
reg   [31:0] output_mem_addr_reg;
reg   [10:0] acc_mem_addr_reg;
wire   [31:0] uop_next_index_wire;
reg   [31:0] uop_next_index_reg;
reg    ap_enable_reg_pp0_iter0;
wire   [11:0] dst_offset_in_wire12;
wire    ap_CS_fsm_state11;
wire   [11:0] src_offset_in_wire12;
wire   [10:0] wgt_offset_in_wire11;
reg    is_uop_index_end;

reg    [11:0] dst_offset_out_reg;
reg    [11:0] src_offset_out_reg;
reg    [10:0] wgt_offset_out_reg;
reg    [11:0] dst_offset_in_reg;
reg    [11:0] src_offset_in_reg;
reg    [10:0] wgt_offset_in_reg;
reg    [13:0] iter_in_reg;
reg    [13:0] iter_out_index_reg;
reg    signed [31:0] uop_current_index_reg;
wire   [31:0] wgt_mem_addr_wire32;
wire   [31:0] input_mem_addr_wire32;

wire          inst_reset;
wire   [12:0] inst_uop_begin;
wire   [13:0] inst_uop_end;
wire   [13:0] inst_iter_in_word;
wire   [13:0] inst_iter_out_word;
wire   [10:0] inst_dst_factor_out;
wire   [10:0] inst_src_factor_out;
wire   [9:0]  inst_wgt_factor_out;
wire   [10:0] inst_dst_factor_in;
wire   [10:0] inst_src_factor_in;
wire   [9:0]  inst_wgt_factor_in;

reg    [13:0] inst_iter_in_reg;
reg    [13:0] inst_iter_out_reg;

wire   [10:0] uop_dst_addr;
wire   [10:0] uop_inp_addr;
wire   [9:0] uop_wgt_addr;

wire   [10:0] weight_index_wire;
wire   [11:0] src_index_wire;
wire   [11:0] dst_index_wire;

reg    [9:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 10'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

// Instruction INPUT interface Decode
assign inst_reset          =   insn_raw_V[32'd7];
assign inst_uop_begin      = {{insn_raw_V[20:8]}};
assign inst_uop_end        = {{insn_raw_V[34:21]}};
assign inst_iter_out_word  = {{insn_raw_V[48:35]}};
assign inst_iter_in_word   = {{insn_raw_V[62:49]}};

assign inst_dst_factor_out = {{insn_raw_V[74:64]}};
assign inst_dst_factor_in  = {{insn_raw_V[85:75]}};
assign inst_src_factor_out = {{insn_raw_V[96:86]}};
assign inst_src_factor_in  = {{insn_raw_V[107:97]}};
assign inst_wgt_factor_out = {{insn_raw_V[117:108]}};
assign inst_wgt_factor_in  = {{insn_raw_V[127:118]}};

// UOP mem INPUT interface Decode
assign uop_dst_addr        =   uop_mem_V_2_q0[10:0];
assign uop_inp_addr        = {{uop_mem_V_2_q0[21:11]}};
assign uop_wgt_addr        = {{uop_mem_V_2_q0[31:22]}};

// Acc Mem INPUT interface
assign gemm_core_a_tensor_0_0  =   acc_mem_V_2_q0[31:0];
assign gemm_core_a_tensor_0_1  = {{acc_mem_V_2_q0[63:32]}};
assign gemm_core_a_tensor_0_2  = {{acc_mem_V_2_q0[95:64]}};
assign gemm_core_a_tensor_0_3  = {{acc_mem_V_2_q0[127:96]}};
assign gemm_core_a_tensor_0_4  = {{acc_mem_V_2_q0[159:128]}};
assign gemm_core_a_tensor_0_5  = {{acc_mem_V_2_q0[191:160]}};
assign gemm_core_a_tensor_0_6  = {{acc_mem_V_2_q0[223:192]}};
assign gemm_core_a_tensor_0_7  = {{acc_mem_V_2_q0[255:224]}};
assign gemm_core_a_tensor_0_8  = {{acc_mem_V_2_q0[287:256]}};
assign gemm_core_a_tensor_0_9  = {{acc_mem_V_2_q0[319:288]}};
assign gemm_core_a_tensor_0_10 = {{acc_mem_V_2_q0[351:320]}};
assign gemm_core_a_tensor_0_11 = {{acc_mem_V_2_q0[383:352]}};
assign gemm_core_a_tensor_0_12 = {{acc_mem_V_2_q0[415:384]}};
assign gemm_core_a_tensor_0_13 = {{acc_mem_V_2_q0[447:416]}};
assign gemm_core_a_tensor_0_14 = {{acc_mem_V_2_q0[479:448]}};
assign gemm_core_a_tensor_0_15 = {{acc_mem_V_2_q0[511:480]}};

// Reset
assign gemm_core_gemm_reset = gemm_reset_reg;

// Input mem INPUT interface
assign gemm_core_i_tensor_0_0  =   inp_mem_V_Dout_A[7:0];
assign gemm_core_i_tensor_0_1  = {{inp_mem_V_Dout_A[15:8]}};
assign gemm_core_i_tensor_0_2  = {{inp_mem_V_Dout_A[23:16]}};
assign gemm_core_i_tensor_0_3  = {{inp_mem_V_Dout_A[31:24]}};
assign gemm_core_i_tensor_0_4  = {{inp_mem_V_Dout_A[39:32]}};
assign gemm_core_i_tensor_0_5  = {{inp_mem_V_Dout_A[47:40]}};
assign gemm_core_i_tensor_0_6  = {{inp_mem_V_Dout_A[55:48]}};
assign gemm_core_i_tensor_0_7  = {{inp_mem_V_Dout_A[63:56]}};
assign gemm_core_i_tensor_0_8  = {{inp_mem_V_Dout_A[71:64]}};
assign gemm_core_i_tensor_0_9  = {{inp_mem_V_Dout_A[79:72]}};
assign gemm_core_i_tensor_0_10 = {{inp_mem_V_Dout_A[87:80]}};
assign gemm_core_i_tensor_0_11 = {{inp_mem_V_Dout_A[95:88]}};
assign gemm_core_i_tensor_0_12 = {{inp_mem_V_Dout_A[103:96]}};
assign gemm_core_i_tensor_0_13 = {{inp_mem_V_Dout_A[111:104]}};
assign gemm_core_i_tensor_0_14 = {{inp_mem_V_Dout_A[119:112]}};
assign gemm_core_i_tensor_0_15 = {{inp_mem_V_Dout_A[127:120]}};

// Weight mem INPUT interface
assign gemm_core_w_tensor_0_0 = wgt_mem_0_V_Dout_A[7:0];
assign gemm_core_w_tensor_0_1 = {{wgt_mem_0_V_Dout_A[15:8]}};
assign gemm_core_w_tensor_0_2 = {{wgt_mem_0_V_Dout_A[23:16]}};
assign gemm_core_w_tensor_0_3 = {{wgt_mem_0_V_Dout_A[31:24]}};
assign gemm_core_w_tensor_0_4 = {{wgt_mem_0_V_Dout_A[39:32]}};
assign gemm_core_w_tensor_0_5 = {{wgt_mem_0_V_Dout_A[47:40]}};
assign gemm_core_w_tensor_0_6 = {{wgt_mem_0_V_Dout_A[55:48]}};
assign gemm_core_w_tensor_0_7 = {{wgt_mem_0_V_Dout_A[63:56]}};
assign gemm_core_w_tensor_0_8 = wgt_mem_1_V_Dout_A[7:0];
assign gemm_core_w_tensor_0_9 = {{wgt_mem_1_V_Dout_A[15:8]}};
assign gemm_core_w_tensor_0_10 = {{wgt_mem_1_V_Dout_A[23:16]}};
assign gemm_core_w_tensor_0_11 = {{wgt_mem_1_V_Dout_A[31:24]}};
assign gemm_core_w_tensor_0_12 = {{wgt_mem_1_V_Dout_A[39:32]}};
assign gemm_core_w_tensor_0_13 = {{wgt_mem_1_V_Dout_A[47:40]}};
assign gemm_core_w_tensor_0_14 = {{wgt_mem_1_V_Dout_A[55:48]}};
assign gemm_core_w_tensor_0_15 = {{wgt_mem_1_V_Dout_A[63:56]}};

assign gemm_core_w_tensor_1_0 = {{wgt_mem_0_V_Dout_A[71:64]}};
assign gemm_core_w_tensor_1_1 = {{wgt_mem_0_V_Dout_A[79:72]}};
assign gemm_core_w_tensor_1_2 = {{wgt_mem_0_V_Dout_A[87:80]}};
assign gemm_core_w_tensor_1_3 = {{wgt_mem_0_V_Dout_A[95:88]}};
assign gemm_core_w_tensor_1_4 = {{wgt_mem_0_V_Dout_A[103:96]}};
assign gemm_core_w_tensor_1_5 = {{wgt_mem_0_V_Dout_A[111:104]}};
assign gemm_core_w_tensor_1_6 = {{wgt_mem_0_V_Dout_A[119:112]}};
assign gemm_core_w_tensor_1_7 = {{wgt_mem_0_V_Dout_A[127:120]}};
assign gemm_core_w_tensor_1_8 = {{wgt_mem_1_V_Dout_A[71:64]}};
assign gemm_core_w_tensor_1_9 = {{wgt_mem_1_V_Dout_A[79:72]}};
assign gemm_core_w_tensor_1_10 = {{wgt_mem_1_V_Dout_A[87:80]}};
assign gemm_core_w_tensor_1_11 = {{wgt_mem_1_V_Dout_A[95:88]}};
assign gemm_core_w_tensor_1_12 = {{wgt_mem_1_V_Dout_A[103:96]}};
assign gemm_core_w_tensor_1_13 = {{wgt_mem_1_V_Dout_A[111:104]}};
assign gemm_core_w_tensor_1_14 = {{wgt_mem_1_V_Dout_A[119:112]}};
assign gemm_core_w_tensor_1_15 = {{wgt_mem_1_V_Dout_A[127:120]}};

assign gemm_core_w_tensor_2_0 = {{wgt_mem_0_V_Dout_A[135:128]}};
assign gemm_core_w_tensor_2_1 = {{wgt_mem_0_V_Dout_A[143:136]}};
assign gemm_core_w_tensor_2_2 = {{wgt_mem_0_V_Dout_A[151:144]}};
assign gemm_core_w_tensor_2_3 = {{wgt_mem_0_V_Dout_A[159:152]}};
assign gemm_core_w_tensor_2_4 = {{wgt_mem_0_V_Dout_A[167:160]}};
assign gemm_core_w_tensor_2_5 = {{wgt_mem_0_V_Dout_A[175:168]}};
assign gemm_core_w_tensor_2_6 = {{wgt_mem_0_V_Dout_A[183:176]}};
assign gemm_core_w_tensor_2_7 = {{wgt_mem_0_V_Dout_A[191:184]}};
assign gemm_core_w_tensor_2_8 = {{wgt_mem_1_V_Dout_A[135:128]}};
assign gemm_core_w_tensor_2_9 = {{wgt_mem_1_V_Dout_A[143:136]}};
assign gemm_core_w_tensor_2_10 = {{wgt_mem_1_V_Dout_A[151:144]}};
assign gemm_core_w_tensor_2_11 = {{wgt_mem_1_V_Dout_A[159:152]}};
assign gemm_core_w_tensor_2_12 = {{wgt_mem_1_V_Dout_A[167:160]}};
assign gemm_core_w_tensor_2_13 = {{wgt_mem_1_V_Dout_A[175:168]}};
assign gemm_core_w_tensor_2_14 = {{wgt_mem_1_V_Dout_A[183:176]}};
assign gemm_core_w_tensor_2_15 = {{wgt_mem_1_V_Dout_A[191:184]}};

assign gemm_core_w_tensor_3_0 = {{wgt_mem_0_V_Dout_A[199:192]}};
assign gemm_core_w_tensor_3_1 = {{wgt_mem_0_V_Dout_A[207:200]}};
assign gemm_core_w_tensor_3_2 = {{wgt_mem_0_V_Dout_A[215:208]}};
assign gemm_core_w_tensor_3_3 = {{wgt_mem_0_V_Dout_A[223:216]}};
assign gemm_core_w_tensor_3_4 = {{wgt_mem_0_V_Dout_A[231:224]}};
assign gemm_core_w_tensor_3_5 = {{wgt_mem_0_V_Dout_A[239:232]}};
assign gemm_core_w_tensor_3_6 = {{wgt_mem_0_V_Dout_A[247:240]}};
assign gemm_core_w_tensor_3_7 = {{wgt_mem_0_V_Dout_A[255:248]}};
assign gemm_core_w_tensor_3_8 = {{wgt_mem_1_V_Dout_A[199:192]}};
assign gemm_core_w_tensor_3_9 = {{wgt_mem_1_V_Dout_A[207:200]}};
assign gemm_core_w_tensor_3_10 = {{wgt_mem_1_V_Dout_A[215:208]}};
assign gemm_core_w_tensor_3_11 = {{wgt_mem_1_V_Dout_A[223:216]}};
assign gemm_core_w_tensor_3_12 = {{wgt_mem_1_V_Dout_A[231:224]}};
assign gemm_core_w_tensor_3_13 = {{wgt_mem_1_V_Dout_A[239:232]}};
assign gemm_core_w_tensor_3_14 = {{wgt_mem_1_V_Dout_A[247:240]}};
assign gemm_core_w_tensor_3_15 = {{wgt_mem_1_V_Dout_A[255:248]}};

assign gemm_core_w_tensor_4_0 = {{wgt_mem_0_V_Dout_A[263:256]}};
assign gemm_core_w_tensor_4_1 = {{wgt_mem_0_V_Dout_A[271:264]}};
assign gemm_core_w_tensor_4_2 = {{wgt_mem_0_V_Dout_A[279:272]}};
assign gemm_core_w_tensor_4_3 = {{wgt_mem_0_V_Dout_A[287:280]}};
assign gemm_core_w_tensor_4_4 = {{wgt_mem_0_V_Dout_A[295:288]}};
assign gemm_core_w_tensor_4_5 = {{wgt_mem_0_V_Dout_A[303:296]}};
assign gemm_core_w_tensor_4_6 = {{wgt_mem_0_V_Dout_A[311:304]}};
assign gemm_core_w_tensor_4_7 = {{wgt_mem_0_V_Dout_A[319:312]}};
assign gemm_core_w_tensor_4_8 = {{wgt_mem_1_V_Dout_A[263:256]}};
assign gemm_core_w_tensor_4_9 = {{wgt_mem_1_V_Dout_A[271:264]}};
assign gemm_core_w_tensor_4_10 = {{wgt_mem_1_V_Dout_A[279:272]}};
assign gemm_core_w_tensor_4_11 = {{wgt_mem_1_V_Dout_A[287:280]}};
assign gemm_core_w_tensor_4_12 = {{wgt_mem_1_V_Dout_A[295:288]}};
assign gemm_core_w_tensor_4_13 = {{wgt_mem_1_V_Dout_A[303:296]}};
assign gemm_core_w_tensor_4_14 = {{wgt_mem_1_V_Dout_A[311:304]}};
assign gemm_core_w_tensor_4_15 = {{wgt_mem_1_V_Dout_A[319:312]}};

assign gemm_core_w_tensor_5_0 = {{wgt_mem_0_V_Dout_A[327:320]}};
assign gemm_core_w_tensor_5_1 = {{wgt_mem_0_V_Dout_A[335:328]}};
assign gemm_core_w_tensor_5_2 = {{wgt_mem_0_V_Dout_A[343:336]}};
assign gemm_core_w_tensor_5_3 = {{wgt_mem_0_V_Dout_A[351:344]}};
assign gemm_core_w_tensor_5_4 = {{wgt_mem_0_V_Dout_A[359:352]}};
assign gemm_core_w_tensor_5_5 = {{wgt_mem_0_V_Dout_A[367:360]}};
assign gemm_core_w_tensor_5_6 = {{wgt_mem_0_V_Dout_A[375:368]}};
assign gemm_core_w_tensor_5_7 = {{wgt_mem_0_V_Dout_A[383:376]}};
assign gemm_core_w_tensor_5_8 = {{wgt_mem_1_V_Dout_A[327:320]}};
assign gemm_core_w_tensor_5_9 = {{wgt_mem_1_V_Dout_A[335:328]}};
assign gemm_core_w_tensor_5_10 = {{wgt_mem_1_V_Dout_A[343:336]}};
assign gemm_core_w_tensor_5_11 = {{wgt_mem_1_V_Dout_A[351:344]}};
assign gemm_core_w_tensor_5_12 = {{wgt_mem_1_V_Dout_A[359:352]}};
assign gemm_core_w_tensor_5_13 = {{wgt_mem_1_V_Dout_A[367:360]}};
assign gemm_core_w_tensor_5_14 = {{wgt_mem_1_V_Dout_A[375:368]}};
assign gemm_core_w_tensor_5_15 = {{wgt_mem_1_V_Dout_A[383:376]}};

assign gemm_core_w_tensor_6_0 = {{wgt_mem_0_V_Dout_A[391:384]}};
assign gemm_core_w_tensor_6_1 = {{wgt_mem_0_V_Dout_A[399:392]}};
assign gemm_core_w_tensor_6_2 = {{wgt_mem_0_V_Dout_A[407:400]}};
assign gemm_core_w_tensor_6_3 = {{wgt_mem_0_V_Dout_A[415:408]}};
assign gemm_core_w_tensor_6_4 = {{wgt_mem_0_V_Dout_A[423:416]}};
assign gemm_core_w_tensor_6_5 = {{wgt_mem_0_V_Dout_A[431:424]}};
assign gemm_core_w_tensor_6_6 = {{wgt_mem_0_V_Dout_A[439:432]}};
assign gemm_core_w_tensor_6_7 = {{wgt_mem_0_V_Dout_A[447:440]}};
assign gemm_core_w_tensor_6_8 = {{wgt_mem_1_V_Dout_A[391:384]}};
assign gemm_core_w_tensor_6_9 = {{wgt_mem_1_V_Dout_A[399:392]}};
assign gemm_core_w_tensor_6_10 = {{wgt_mem_1_V_Dout_A[407:400]}};
assign gemm_core_w_tensor_6_11 = {{wgt_mem_1_V_Dout_A[415:408]}};
assign gemm_core_w_tensor_6_12 = {{wgt_mem_1_V_Dout_A[423:416]}};
assign gemm_core_w_tensor_6_13 = {{wgt_mem_1_V_Dout_A[431:424]}};
assign gemm_core_w_tensor_6_14 = {{wgt_mem_1_V_Dout_A[439:432]}};
assign gemm_core_w_tensor_6_15 = {{wgt_mem_1_V_Dout_A[447:440]}};

assign gemm_core_w_tensor_7_0 = {{wgt_mem_0_V_Dout_A[455:448]}};
assign gemm_core_w_tensor_7_1 = {{wgt_mem_0_V_Dout_A[463:456]}};
assign gemm_core_w_tensor_7_2 = {{wgt_mem_0_V_Dout_A[471:464]}};
assign gemm_core_w_tensor_7_3 = {{wgt_mem_0_V_Dout_A[479:472]}};
assign gemm_core_w_tensor_7_4 = {{wgt_mem_0_V_Dout_A[487:480]}};
assign gemm_core_w_tensor_7_5 = {{wgt_mem_0_V_Dout_A[495:488]}};
assign gemm_core_w_tensor_7_6 = {{wgt_mem_0_V_Dout_A[503:496]}};
assign gemm_core_w_tensor_7_7 = {{wgt_mem_0_V_Dout_A[511:504]}};
assign gemm_core_w_tensor_7_8 = {{wgt_mem_1_V_Dout_A[455:448]}};
assign gemm_core_w_tensor_7_9 = {{wgt_mem_1_V_Dout_A[463:456]}};
assign gemm_core_w_tensor_7_10 = {{wgt_mem_1_V_Dout_A[471:464]}};
assign gemm_core_w_tensor_7_11 = {{wgt_mem_1_V_Dout_A[479:472]}};
assign gemm_core_w_tensor_7_12 = {{wgt_mem_1_V_Dout_A[487:480]}};
assign gemm_core_w_tensor_7_13 = {{wgt_mem_1_V_Dout_A[495:488]}};
assign gemm_core_w_tensor_7_14 = {{wgt_mem_1_V_Dout_A[503:496]}};
assign gemm_core_w_tensor_7_15 = {{wgt_mem_1_V_Dout_A[511:504]}};

assign gemm_core_w_tensor_8_0 = {{wgt_mem_0_V_Dout_A[519:512]}};
assign gemm_core_w_tensor_8_1 = {{wgt_mem_0_V_Dout_A[527:520]}};
assign gemm_core_w_tensor_8_2 = {{wgt_mem_0_V_Dout_A[535:528]}};
assign gemm_core_w_tensor_8_3 = {{wgt_mem_0_V_Dout_A[543:536]}};
assign gemm_core_w_tensor_8_4 = {{wgt_mem_0_V_Dout_A[551:544]}};
assign gemm_core_w_tensor_8_5 = {{wgt_mem_0_V_Dout_A[559:552]}};
assign gemm_core_w_tensor_8_6 = {{wgt_mem_0_V_Dout_A[567:560]}};
assign gemm_core_w_tensor_8_7 = {{wgt_mem_0_V_Dout_A[575:568]}};
assign gemm_core_w_tensor_8_8 = {{wgt_mem_1_V_Dout_A[519:512]}};
assign gemm_core_w_tensor_8_9 = {{wgt_mem_1_V_Dout_A[527:520]}};
assign gemm_core_w_tensor_8_10 = {{wgt_mem_1_V_Dout_A[535:528]}};
assign gemm_core_w_tensor_8_11 = {{wgt_mem_1_V_Dout_A[543:536]}};
assign gemm_core_w_tensor_8_12 = {{wgt_mem_1_V_Dout_A[551:544]}};
assign gemm_core_w_tensor_8_13 = {{wgt_mem_1_V_Dout_A[559:552]}};
assign gemm_core_w_tensor_8_14 = {{wgt_mem_1_V_Dout_A[567:560]}};
assign gemm_core_w_tensor_8_15 = {{wgt_mem_1_V_Dout_A[575:568]}};

assign gemm_core_w_tensor_9_0 = {{wgt_mem_0_V_Dout_A[583:576]}};
assign gemm_core_w_tensor_9_1 = {{wgt_mem_0_V_Dout_A[591:584]}};
assign gemm_core_w_tensor_9_2 = {{wgt_mem_0_V_Dout_A[599:592]}};
assign gemm_core_w_tensor_9_3 = {{wgt_mem_0_V_Dout_A[607:600]}};
assign gemm_core_w_tensor_9_4 = {{wgt_mem_0_V_Dout_A[615:608]}};
assign gemm_core_w_tensor_9_5 = {{wgt_mem_0_V_Dout_A[623:616]}};
assign gemm_core_w_tensor_9_6 = {{wgt_mem_0_V_Dout_A[631:624]}};
assign gemm_core_w_tensor_9_7 = {{wgt_mem_0_V_Dout_A[639:632]}};
assign gemm_core_w_tensor_9_8 = {{wgt_mem_1_V_Dout_A[583:576]}};
assign gemm_core_w_tensor_9_9 = {{wgt_mem_1_V_Dout_A[591:584]}};
assign gemm_core_w_tensor_9_10 = {{wgt_mem_1_V_Dout_A[599:592]}};
assign gemm_core_w_tensor_9_11 = {{wgt_mem_1_V_Dout_A[607:600]}};
assign gemm_core_w_tensor_9_12 = {{wgt_mem_1_V_Dout_A[615:608]}};
assign gemm_core_w_tensor_9_13 = {{wgt_mem_1_V_Dout_A[623:616]}};
assign gemm_core_w_tensor_9_14 = {{wgt_mem_1_V_Dout_A[631:624]}};
assign gemm_core_w_tensor_9_15 = {{wgt_mem_1_V_Dout_A[639:632]}};

assign gemm_core_w_tensor_10_0 = {{wgt_mem_0_V_Dout_A[647:640]}};
assign gemm_core_w_tensor_10_1 = {{wgt_mem_0_V_Dout_A[655:648]}};
assign gemm_core_w_tensor_10_2 = {{wgt_mem_0_V_Dout_A[663:656]}};
assign gemm_core_w_tensor_10_3 = {{wgt_mem_0_V_Dout_A[671:664]}};
assign gemm_core_w_tensor_10_4 = {{wgt_mem_0_V_Dout_A[679:672]}};
assign gemm_core_w_tensor_10_5 = {{wgt_mem_0_V_Dout_A[687:680]}};
assign gemm_core_w_tensor_10_6 = {{wgt_mem_0_V_Dout_A[695:688]}};
assign gemm_core_w_tensor_10_7 = {{wgt_mem_0_V_Dout_A[703:696]}};
assign gemm_core_w_tensor_10_8 = {{wgt_mem_1_V_Dout_A[647:640]}};
assign gemm_core_w_tensor_10_9 = {{wgt_mem_1_V_Dout_A[655:648]}};
assign gemm_core_w_tensor_10_10 = {{wgt_mem_1_V_Dout_A[663:656]}};
assign gemm_core_w_tensor_10_11 = {{wgt_mem_1_V_Dout_A[671:664]}};
assign gemm_core_w_tensor_10_12 = {{wgt_mem_1_V_Dout_A[679:672]}};
assign gemm_core_w_tensor_10_13 = {{wgt_mem_1_V_Dout_A[687:680]}};
assign gemm_core_w_tensor_10_14 = {{wgt_mem_1_V_Dout_A[695:688]}};
assign gemm_core_w_tensor_10_15 = {{wgt_mem_1_V_Dout_A[703:696]}};

assign gemm_core_w_tensor_11_0 = {{wgt_mem_0_V_Dout_A[711:704]}};
assign gemm_core_w_tensor_11_1 = {{wgt_mem_0_V_Dout_A[719:712]}};
assign gemm_core_w_tensor_11_2 = {{wgt_mem_0_V_Dout_A[727:720]}};
assign gemm_core_w_tensor_11_3 = {{wgt_mem_0_V_Dout_A[735:728]}};
assign gemm_core_w_tensor_11_4 = {{wgt_mem_0_V_Dout_A[743:736]}};
assign gemm_core_w_tensor_11_5 = {{wgt_mem_0_V_Dout_A[751:744]}};
assign gemm_core_w_tensor_11_6 = {{wgt_mem_0_V_Dout_A[759:752]}};
assign gemm_core_w_tensor_11_7 = {{wgt_mem_0_V_Dout_A[767:760]}};
assign gemm_core_w_tensor_11_8 = {{wgt_mem_1_V_Dout_A[711:704]}};
assign gemm_core_w_tensor_11_9 = {{wgt_mem_1_V_Dout_A[719:712]}};
assign gemm_core_w_tensor_11_10 = {{wgt_mem_1_V_Dout_A[727:720]}};
assign gemm_core_w_tensor_11_11 = {{wgt_mem_1_V_Dout_A[735:728]}};
assign gemm_core_w_tensor_11_12 = {{wgt_mem_1_V_Dout_A[743:736]}};
assign gemm_core_w_tensor_11_13 = {{wgt_mem_1_V_Dout_A[751:744]}};
assign gemm_core_w_tensor_11_14 = {{wgt_mem_1_V_Dout_A[759:752]}};
assign gemm_core_w_tensor_11_15 = {{wgt_mem_1_V_Dout_A[767:760]}};

assign gemm_core_w_tensor_12_0 = {{wgt_mem_0_V_Dout_A[775:768]}};
assign gemm_core_w_tensor_12_1 = {{wgt_mem_0_V_Dout_A[783:776]}};
assign gemm_core_w_tensor_12_2 = {{wgt_mem_0_V_Dout_A[791:784]}};
assign gemm_core_w_tensor_12_3 = {{wgt_mem_0_V_Dout_A[799:792]}};
assign gemm_core_w_tensor_12_4 = {{wgt_mem_0_V_Dout_A[807:800]}};
assign gemm_core_w_tensor_12_5 = {{wgt_mem_0_V_Dout_A[815:808]}};
assign gemm_core_w_tensor_12_6 = {{wgt_mem_0_V_Dout_A[823:816]}};
assign gemm_core_w_tensor_12_7 = {{wgt_mem_0_V_Dout_A[831:824]}};
assign gemm_core_w_tensor_12_8 = {{wgt_mem_1_V_Dout_A[775:768]}};
assign gemm_core_w_tensor_12_9 = {{wgt_mem_1_V_Dout_A[783:776]}};
assign gemm_core_w_tensor_12_10 = {{wgt_mem_1_V_Dout_A[791:784]}};
assign gemm_core_w_tensor_12_11 = {{wgt_mem_1_V_Dout_A[799:792]}};
assign gemm_core_w_tensor_12_12 = {{wgt_mem_1_V_Dout_A[807:800]}};
assign gemm_core_w_tensor_12_13 = {{wgt_mem_1_V_Dout_A[815:808]}};
assign gemm_core_w_tensor_12_14 = {{wgt_mem_1_V_Dout_A[823:816]}};
assign gemm_core_w_tensor_12_15 = {{wgt_mem_1_V_Dout_A[831:824]}};

assign gemm_core_w_tensor_13_0 = {{wgt_mem_0_V_Dout_A[839:832]}};
assign gemm_core_w_tensor_13_1 = {{wgt_mem_0_V_Dout_A[847:840]}};
assign gemm_core_w_tensor_13_2 = {{wgt_mem_0_V_Dout_A[855:848]}};
assign gemm_core_w_tensor_13_3 = {{wgt_mem_0_V_Dout_A[863:856]}};
assign gemm_core_w_tensor_13_4 = {{wgt_mem_0_V_Dout_A[871:864]}};
assign gemm_core_w_tensor_13_5 = {{wgt_mem_0_V_Dout_A[879:872]}};
assign gemm_core_w_tensor_13_6 = {{wgt_mem_0_V_Dout_A[887:880]}};
assign gemm_core_w_tensor_13_7 = {{wgt_mem_0_V_Dout_A[895:888]}};
assign gemm_core_w_tensor_13_8 = {{wgt_mem_1_V_Dout_A[839:832]}};
assign gemm_core_w_tensor_13_9 = {{wgt_mem_1_V_Dout_A[847:840]}};
assign gemm_core_w_tensor_13_10 = {{wgt_mem_1_V_Dout_A[855:848]}};
assign gemm_core_w_tensor_13_11 = {{wgt_mem_1_V_Dout_A[863:856]}};
assign gemm_core_w_tensor_13_12 = {{wgt_mem_1_V_Dout_A[871:864]}};
assign gemm_core_w_tensor_13_13 = {{wgt_mem_1_V_Dout_A[879:872]}};
assign gemm_core_w_tensor_13_14 = {{wgt_mem_1_V_Dout_A[887:880]}};
assign gemm_core_w_tensor_13_15 = {{wgt_mem_1_V_Dout_A[895:888]}};

assign gemm_core_w_tensor_14_0 = {{wgt_mem_0_V_Dout_A[903:896]}};
assign gemm_core_w_tensor_14_1 = {{wgt_mem_0_V_Dout_A[911:904]}};
assign gemm_core_w_tensor_14_2 = {{wgt_mem_0_V_Dout_A[919:912]}};
assign gemm_core_w_tensor_14_3 = {{wgt_mem_0_V_Dout_A[927:920]}};
assign gemm_core_w_tensor_14_4 = {{wgt_mem_0_V_Dout_A[935:928]}};
assign gemm_core_w_tensor_14_5 = {{wgt_mem_0_V_Dout_A[943:936]}};
assign gemm_core_w_tensor_14_6 = {{wgt_mem_0_V_Dout_A[951:944]}};
assign gemm_core_w_tensor_14_7 = {{wgt_mem_0_V_Dout_A[959:952]}};
assign gemm_core_w_tensor_14_8 = {{wgt_mem_1_V_Dout_A[903:896]}};
assign gemm_core_w_tensor_14_9 = {{wgt_mem_1_V_Dout_A[911:904]}};
assign gemm_core_w_tensor_14_10 = {{wgt_mem_1_V_Dout_A[919:912]}};
assign gemm_core_w_tensor_14_11 = {{wgt_mem_1_V_Dout_A[927:920]}};
assign gemm_core_w_tensor_14_12 = {{wgt_mem_1_V_Dout_A[935:928]}};
assign gemm_core_w_tensor_14_13 = {{wgt_mem_1_V_Dout_A[943:936]}};
assign gemm_core_w_tensor_14_14 = {{wgt_mem_1_V_Dout_A[951:944]}};
assign gemm_core_w_tensor_14_15 = {{wgt_mem_1_V_Dout_A[959:952]}};

assign gemm_core_w_tensor_15_0 = {{wgt_mem_0_V_Dout_A[967:960]}};
assign gemm_core_w_tensor_15_1 = {{wgt_mem_0_V_Dout_A[975:968]}};
assign gemm_core_w_tensor_15_2 = {{wgt_mem_0_V_Dout_A[983:976]}};
assign gemm_core_w_tensor_15_3 = {{wgt_mem_0_V_Dout_A[991:984]}};
assign gemm_core_w_tensor_15_4 = {{wgt_mem_0_V_Dout_A[999:992]}};
assign gemm_core_w_tensor_15_5 = {{wgt_mem_0_V_Dout_A[1007:1000]}};
assign gemm_core_w_tensor_15_6 = {{wgt_mem_0_V_Dout_A[1015:1008]}};
assign gemm_core_w_tensor_15_7 = {{wgt_mem_0_V_Dout_A[1023:1016]}};
assign gemm_core_w_tensor_15_8 = {{wgt_mem_1_V_Dout_A[967:960]}};
assign gemm_core_w_tensor_15_9 = {{wgt_mem_1_V_Dout_A[975:968]}};
assign gemm_core_w_tensor_15_10 = {{wgt_mem_1_V_Dout_A[983:976]}};
assign gemm_core_w_tensor_15_11 = {{wgt_mem_1_V_Dout_A[991:984]}};
assign gemm_core_w_tensor_15_12 = {{wgt_mem_1_V_Dout_A[999:992]}};
assign gemm_core_w_tensor_15_13 = {{wgt_mem_1_V_Dout_A[1007:1000]}};
assign gemm_core_w_tensor_15_14 = {{wgt_mem_1_V_Dout_A[1015:1008]}};
assign gemm_core_w_tensor_15_15 = {{wgt_mem_1_V_Dout_A[1023:1016]}};

gemm_core gemm_core(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
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

// State Machine
always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (ap_start == 1'b1) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin  //
            if (icmp_eq_iter_out == 1'b1) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (icmp_eq_iter_in == 1'b1) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((icmp_less_uop_index_than_end_wire == 1'b1) | (ap_enable_reg_pp0_iter0 == 1'b0)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if ((icmp_less_uop_index_than_end_wire == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) begin
                ap_NS_fsm = ap_ST_fsm_state11;  // get to uop end
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage2;
        end

        ap_ST_fsm_pp0_stage2 : begin
            if(gemm_core_output_valid) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
            else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end

        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end

        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

always @ (posedge ap_clk) begin           // set ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == is_uop_index_end) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((icmp_eq_iter_in == 1'b0) & (1'b1 == ap_CS_fsm_state3))) begin // when state3 set 1
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

// iter out loop
always @ (posedge ap_clk) begin  // 
    if (((icmp_eq_iter_in == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        iter_out_index_reg <= iter_out_index_next_reg;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        iter_out_index_reg <= 14'd0;
    end
end

assign iter_out_index_next_wire    = (iter_out_index_reg + 14'd1);

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        inst_iter_out_reg   <= inst_iter_out_word;
    end
end

assign icmp_eq_iter_out         = ((iter_out_index_reg == inst_iter_out_reg) ? 1'b1 : 1'b0);  //

// iter in loop
always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        iter_in_reg <= iter_in_index_next_reg;
    end else if (((icmp_eq_iter_out == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
        iter_in_reg <= 14'd0;
    end
end

assign iter_in_index_next_wire     = (iter_in_reg  + 14'd1);

always @ (posedge ap_clk) begin
    if (((icmp_eq_iter_out == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
        inst_iter_in_reg <= inst_iter_in_word;
    end
end

assign icmp_eq_iter_in = ((iter_in_reg == inst_iter_in_reg)  ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    if (output_valid_reg_iter0 & (icmp_less_uop_index_than_end_reg_iter1 == 1'b1)) begin
        uop_iter_index_reg <= uop_next_index_reg;
    end else if (((icmp_eq_iter_in == 1'b0) & (1'b1 == ap_CS_fsm_state3))) begin
        uop_iter_index_reg <= inst_uop_begin;
    end
end

always @ (posedge ap_clk) begin  // uop next index
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (gemm_core_output_valid) & (icmp_less_uop_index_than_end_reg_iter1 == 1'b1))) begin
        uop_next_index_reg <= uop_next_index_wire;
    end
end

assign uop_next_index_wire  = ($signed(32'd1) + $signed(uop_iter_index_reg));  // next uop index

// dst offset
always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        dst_offset_in_reg <= dst_offset_in_wire12;
    end else if (((icmp_eq_iter_out == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
        dst_offset_in_reg <= dst_offset_out_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_eq_iter_in == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        dst_offset_out_reg <= dst_offset_out_wire12;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        dst_offset_out_reg <= 12'd0;
    end
end

assign dst_index_wire                = (uop_dst_addr + dst_offset_in_reg);
assign dst_offset_in_wire12          = (inst_dst_factor_in  + dst_offset_in_reg);
assign dst_offset_out_wire12         = (inst_dst_factor_out + dst_offset_out_reg);

// src offset
always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        src_offset_in_reg <= src_offset_in_wire12;
    end else if (((icmp_eq_iter_out == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
        src_offset_in_reg <= src_offset_out_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_eq_iter_in == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        src_offset_out_reg <= src_offset_out_wire12;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        src_offset_out_reg <= 12'd0;
    end
end

assign src_index_wire                = (uop_inp_addr + src_offset_in_reg);
assign src_offset_in_wire12          = (inst_src_factor_in + src_offset_in_reg);
assign src_offset_out_wire12         = (inst_src_factor_out + src_offset_out_reg);

// wgt offset
always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        wgt_offset_in_reg <= wgt_offset_in_wire11;
    end else if (((icmp_eq_iter_out == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
        wgt_offset_in_reg <= wgt_offset_out_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_eq_iter_in == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        wgt_offset_out_reg <= wgt_offset_out_wire11;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        wgt_offset_out_reg <= 11'd0;
    end
end

assign weight_index_wire            = (uop_wgt_addr + wgt_offset_in_reg);
assign wgt_offset_in_wire11         = (inst_wgt_factor_in + wgt_offset_in_reg);
assign wgt_offset_out_wire11        = (inst_wgt_factor_out + wgt_offset_out_reg);

// out addr
always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_less_uop_index_than_end_reg_iter1 == 1'b1))) begin
        acc_mem_addr_reg              <= dst_index_wire;
        output_mem_addr_reg[11 : 0]   <= dst_index_wire;
    end
end

// gemm_reset 
always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        gemm_reset_reg      <= inst_reset;
    end
end

// 
always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_less_uop_index_than_end_reg_iter1 <= icmp_less_uop_index_than_end_wire;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        iter_in_index_next_reg <= iter_in_index_next_wire;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        iter_out_index_next_reg <= iter_out_index_next_wire;
    end
end

// UOP END
always @ (posedge ap_clk) begin
    if (((icmp_eq_iter_in == 1'b0) & (1'b1 == ap_CS_fsm_state3))) begin
        uop_end_reg0[13 : 0] <= inst_uop_end;
    end
end

always @ (*) begin  // uop index get to uop end
    if ((icmp_less_uop_index_than_end_wire == 1'b0)) begin
        is_uop_index_end = 1'b1;
    end else begin
        is_uop_index_end = 1'b0;
    end
end

always @ (*) begin
    if (output_valid_reg_iter0  & (icmp_less_uop_index_than_end_reg_iter1 == 1'b1)) begin
        uop_current_index_reg = uop_next_index_reg;
    end else begin
        uop_current_index_reg = uop_iter_index_reg;
    end
end


// State flags
assign ap_CS_fsm_state1     = ap_CS_fsm[32'd0];
assign ap_CS_fsm_state2     = ap_CS_fsm[32'd1];
assign ap_CS_fsm_state3     = ap_CS_fsm[32'd2];
assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd3];
assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd4];
assign ap_CS_fsm_state11    = ap_CS_fsm[32'd9];

assign icmp_less_uop_index_than_end_wire   = ((uop_current_index_reg <  uop_end_reg0) ? 1'b1 : 1'b0); // 1 for not end

// UOP mem OUTPUT interface
assign uop_mem_V_2_address0 = uop_current_index_reg;

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        uop_mem_V_2_ce0 = 1'b1;
    end else begin
        uop_mem_V_2_ce0 = 1'b0;
    end
end

// Acc mem OUTPUT interface
always @ (*) begin
    if (output_valid_reg_iter0) begin
        acc_mem_V_2_address0 = acc_mem_addr_reg;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        acc_mem_V_2_address0 = dst_index_wire;
    end else begin
        acc_mem_V_2_address0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | output_valid_reg_iter0) begin
        acc_mem_V_2_ce0 = 1'b1;
    end else begin
        acc_mem_V_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (output_valid_reg_iter0) begin
        acc_mem_V_2_we0 = 64'd18446744073709551615; // all 1
    end else begin
        acc_mem_V_2_we0 = 64'd0;
    end
end

assign acc_mem_V_2_d0   = {{{{{{{{{{{{{{{{gemm_core_acc_out_15}, {gemm_core_acc_out_14}}, {gemm_core_acc_out_13}}, {gemm_core_acc_out_12}}, {gemm_core_acc_out_11}}, {gemm_core_acc_out_10}}, {gemm_core_acc_out_9}}, {gemm_core_acc_out_8}}, {gemm_core_acc_out_7}}, {gemm_core_acc_out_6}}, {gemm_core_acc_out_5}}, {gemm_core_acc_out_4}}, {gemm_core_acc_out_3}}, {gemm_core_acc_out_2}}, {gemm_core_acc_out_1}}, {gemm_core_acc_out_0}};

// INP mem OUTPUT interface
assign input_mem_addr_wire32 = src_index_wire;

assign inp_mem_V_Addr_A      = input_mem_addr_wire32 << 32'd4;
assign inp_mem_V_Din_A       = 128'd0;
assign inp_mem_V_WEN_A       = 16'd0;

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        inp_mem_V_EN_A = 1'b1;
    end else begin
        inp_mem_V_EN_A = 1'b0;
    end
end

// WGT mem OUTPUT interface
// wgt mem addr
assign wgt_mem_addr_wire32  = weight_index_wire;

assign wgt_mem_0_V_Addr_A   = wgt_mem_addr_wire32 << 32'd7;
assign wgt_mem_0_V_Din_A    = 1024'd0;
assign wgt_mem_0_V_WEN_A    = 128'd0;

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        wgt_mem_0_V_EN_A = 1'b1;
    end else begin
        wgt_mem_0_V_EN_A = 1'b0;
    end
end

assign wgt_mem_1_V_Addr_A   = wgt_mem_addr_wire32 << 32'd7;
assign wgt_mem_1_V_Din_A    = 1024'd0;
assign wgt_mem_1_V_WEN_A    = 128'd0;

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        wgt_mem_1_V_EN_A = 1'b1;
    end else begin
        wgt_mem_1_V_EN_A = 1'b0;
    end
end

always @(posedge ap_clk) begin
    if (ap_rst) begin
        output_valid_reg_iter0 <= 1'b0;
    end
    else if(gemm_core_output_valid) begin
        output_valid_reg_iter0 <= 1'b1;
    end
    else begin
        output_valid_reg_iter0 <= 1'b0;
    end

end

// out mem OUTPUT interface
assign out_mem_V_Addr_A = output_mem_addr_reg << 32'd4;

always @ (*) begin
    if (output_valid_reg_iter0) begin
        out_mem_V_EN_A = 1'b1;
    end else begin
        out_mem_V_EN_A = 1'b0;
    end
end

always @ (*) begin
    if (output_valid_reg_iter0) begin
        out_mem_V_WEN_A = 16'd65535;
    end else begin
        out_mem_V_WEN_A = 16'd0;
    end
end

assign out_mem_V_Din_A  = {{{{{{{{{{{{{{{{gemm_core_output_15}, {gemm_core_output_14}}, {gemm_core_output_13}}, {gemm_core_output_12}}, {gemm_core_output_11}}, {gemm_core_output_10}}, {gemm_core_output_9}}, {gemm_core_output_8}}, {gemm_core_output_7}}, {gemm_core_output_6}}, {gemm_core_output_5}}, {gemm_core_output_4}}, {gemm_core_output_3}}, {gemm_core_output_2}}, {gemm_core_output_1}}, {gemm_core_output_0}};

// ap done OUTPUT interface
always @ (*) begin
    if ((((icmp_eq_iter_out == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

// ap idle OUTPUT interface
always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

// ap ready OUTPUT interface
always @ (*) begin  // iter out done
    if (((icmp_eq_iter_out == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

// in_valid
always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        gemm_in_valid_reg = 1'b1;
    end else begin
        gemm_in_valid_reg = 1'b0;
    end
end

assign gemm_core_in_valid = gemm_in_valid_reg;

// Const
always @ (posedge ap_clk) begin
    uop_end_reg0[31:14]        <= 18'b000000000000000000;
    output_mem_addr_reg[31:12] <= 20'b00000000000000000000;
end

endmodule //gemm
