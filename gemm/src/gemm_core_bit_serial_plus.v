module lopd(input  [7:0] in_data,
              output       zero_flag,
              output [2:0] lo_position);

wire node0;
wire node1;
wire node2;
wire node3;
wire node4;
wire node5;
wire node6;
wire node7;
wire node8;
wire node9;
wire nodea;
wire nodeb;
wire nodec;
wire noded;
wire nodee;
wire nodef;
wire node10;
wire node11;

assign node0 = in_data[0] | in_data[1];
assign node1 = node0 | node4;
assign node2 = !node1;
assign node3 = nodea & node2;

assign node4 = in_data[2] | in_data[3];
assign node5 = !node4;
assign node6 = in_data[1] & node5;
assign node7 = node6 | in_data[3];

assign node8 = in_data[4] | in_data[5];
assign node9 = node8 | nodeb;
assign nodea = !node9;

assign nodeb = in_data[6] | in_data[7];
assign nodec = !nodeb;
assign noded = in_data[5] & nodec;
assign nodee = in_data[7] | noded;
assign nodef = !nodea;
assign node10 = nodea ? node4 : nodeb;
assign node11 = nodea ? node7 : nodee;

assign lo_position = {nodef, node10, node11};
assign zero_flag  = node3;

endmodule

module gemm_core(
    input ap_clk,
    input ap_rst,
    input [7:0] i_0,
    input [7:0] i_1,
    input [7:0] i_2,
    input [7:0] i_3,
    input [7:0] i_4,
    input [7:0] i_5,
    input [7:0] i_6,
    input [7:0] i_7,
    input [7:0] i_8,
    input [7:0] i_9,
    input [7:0] i_a,
    input [7:0] i_b,
    input [7:0] i_c,
    input [7:0] i_d,
    input [7:0] i_e,
    input [7:0] i_f,

    input [7:0] w_00,
	input [7:0] w_01,
	input [7:0] w_02,
	input [7:0] w_03,
	input [7:0] w_04,
	input [7:0] w_05,
	input [7:0] w_06,
	input [7:0] w_07,
	input [7:0] w_08,
	input [7:0] w_09,
	input [7:0] w_0a,
	input [7:0] w_0b,
	input [7:0] w_0c,
	input [7:0] w_0d,
	input [7:0] w_0e,
	input [7:0] w_0f,
	input [7:0] w_10,
	input [7:0] w_11,
	input [7:0] w_12,
	input [7:0] w_13,
	input [7:0] w_14,
	input [7:0] w_15,
	input [7:0] w_16,
	input [7:0] w_17,
	input [7:0] w_18,
	input [7:0] w_19,
	input [7:0] w_1a,
	input [7:0] w_1b,
	input [7:0] w_1c,
	input [7:0] w_1d,
	input [7:0] w_1e,
	input [7:0] w_1f,
	input [7:0] w_20,
	input [7:0] w_21,
	input [7:0] w_22,
	input [7:0] w_23,
	input [7:0] w_24,
	input [7:0] w_25,
	input [7:0] w_26,
	input [7:0] w_27,
	input [7:0] w_28,
	input [7:0] w_29,
	input [7:0] w_2a,
	input [7:0] w_2b,
	input [7:0] w_2c,
	input [7:0] w_2d,
	input [7:0] w_2e,
	input [7:0] w_2f,
	input [7:0] w_30,
	input [7:0] w_31,
	input [7:0] w_32,
	input [7:0] w_33,
	input [7:0] w_34,
	input [7:0] w_35,
	input [7:0] w_36,
	input [7:0] w_37,
	input [7:0] w_38,
	input [7:0] w_39,
	input [7:0] w_3a,
	input [7:0] w_3b,
	input [7:0] w_3c,
	input [7:0] w_3d,
	input [7:0] w_3e,
	input [7:0] w_3f,
	input [7:0] w_40,
	input [7:0] w_41,
	input [7:0] w_42,
	input [7:0] w_43,
	input [7:0] w_44,
	input [7:0] w_45,
	input [7:0] w_46,
	input [7:0] w_47,
	input [7:0] w_48,
	input [7:0] w_49,
	input [7:0] w_4a,
	input [7:0] w_4b,
	input [7:0] w_4c,
	input [7:0] w_4d,
	input [7:0] w_4e,
	input [7:0] w_4f,
	input [7:0] w_50,
	input [7:0] w_51,
	input [7:0] w_52,
	input [7:0] w_53,
	input [7:0] w_54,
	input [7:0] w_55,
	input [7:0] w_56,
	input [7:0] w_57,
	input [7:0] w_58,
	input [7:0] w_59,
	input [7:0] w_5a,
	input [7:0] w_5b,
	input [7:0] w_5c,
	input [7:0] w_5d,
	input [7:0] w_5e,
	input [7:0] w_5f,
	input [7:0] w_60,
	input [7:0] w_61,
	input [7:0] w_62,
	input [7:0] w_63,
	input [7:0] w_64,
	input [7:0] w_65,
	input [7:0] w_66,
	input [7:0] w_67,
	input [7:0] w_68,
	input [7:0] w_69,
	input [7:0] w_6a,
	input [7:0] w_6b,
	input [7:0] w_6c,
	input [7:0] w_6d,
	input [7:0] w_6e,
	input [7:0] w_6f,
	input [7:0] w_70,
	input [7:0] w_71,
	input [7:0] w_72,
	input [7:0] w_73,
	input [7:0] w_74,
	input [7:0] w_75,
	input [7:0] w_76,
	input [7:0] w_77,
	input [7:0] w_78,
	input [7:0] w_79,
	input [7:0] w_7a,
	input [7:0] w_7b,
	input [7:0] w_7c,
	input [7:0] w_7d,
	input [7:0] w_7e,
	input [7:0] w_7f,

	input [7:0] w_80,
	input [7:0] w_81,
	input [7:0] w_82,
	input [7:0] w_83,
	input [7:0] w_84,
	input [7:0] w_85,
	input [7:0] w_86,
	input [7:0] w_87,
	input [7:0] w_88,
	input [7:0] w_89,
	input [7:0] w_8a,
	input [7:0] w_8b,
	input [7:0] w_8c,
	input [7:0] w_8d,
	input [7:0] w_8e,
	input [7:0] w_8f,
	input [7:0] w_90,
	input [7:0] w_91,
	input [7:0] w_92,
	input [7:0] w_93,
	input [7:0] w_94,
	input [7:0] w_95,
	input [7:0] w_96,
	input [7:0] w_97,
	input [7:0] w_98,
	input [7:0] w_99,
	input [7:0] w_9a,
	input [7:0] w_9b,
	input [7:0] w_9c,
	input [7:0] w_9d,
	input [7:0] w_9e,
	input [7:0] w_9f,
	input [7:0] w_a0,
	input [7:0] w_a1,
	input [7:0] w_a2,
	input [7:0] w_a3,
	input [7:0] w_a4,
	input [7:0] w_a5,
	input [7:0] w_a6,
	input [7:0] w_a7,
	input [7:0] w_a8,
	input [7:0] w_a9,
	input [7:0] w_aa,
	input [7:0] w_ab,
	input [7:0] w_ac,
	input [7:0] w_ad,
	input [7:0] w_ae,
	input [7:0] w_af,
	input [7:0] w_b0,
	input [7:0] w_b1,
	input [7:0] w_b2,
	input [7:0] w_b3,
	input [7:0] w_b4,
	input [7:0] w_b5,
	input [7:0] w_b6,
	input [7:0] w_b7,
	input [7:0] w_b8,
	input [7:0] w_b9,
	input [7:0] w_ba,
	input [7:0] w_bb,
	input [7:0] w_bc,
	input [7:0] w_bd,
	input [7:0] w_be,
	input [7:0] w_bf,
	input [7:0] w_c0,
	input [7:0] w_c1,
	input [7:0] w_c2,
	input [7:0] w_c3,
	input [7:0] w_c4,
	input [7:0] w_c5,
	input [7:0] w_c6,
	input [7:0] w_c7,
	input [7:0] w_c8,
	input [7:0] w_c9,
	input [7:0] w_ca,
	input [7:0] w_cb,
	input [7:0] w_cc,
	input [7:0] w_cd,
	input [7:0] w_ce,
	input [7:0] w_cf,
	input [7:0] w_d0,
	input [7:0] w_d1,
	input [7:0] w_d2,
	input [7:0] w_d3,
	input [7:0] w_d4,
	input [7:0] w_d5,
	input [7:0] w_d6,
	input [7:0] w_d7,
	input [7:0] w_d8,
	input [7:0] w_d9,
	input [7:0] w_da,
	input [7:0] w_db,
	input [7:0] w_dc,
	input [7:0] w_dd,
	input [7:0] w_de,
	input [7:0] w_df,
	input [7:0] w_e0,
	input [7:0] w_e1,
	input [7:0] w_e2,
	input [7:0] w_e3,
	input [7:0] w_e4,
	input [7:0] w_e5,
	input [7:0] w_e6,
	input [7:0] w_e7,
	input [7:0] w_e8,
	input [7:0] w_e9,
	input [7:0] w_ea,
	input [7:0] w_eb,
	input [7:0] w_ec,
	input [7:0] w_ed,
	input [7:0] w_ee,
	input [7:0] w_ef,
	input [7:0] w_f0,
	input [7:0] w_f1,
	input [7:0] w_f2,
	input [7:0] w_f3,
	input [7:0] w_f4,
	input [7:0] w_f5,
	input [7:0] w_f6,
	input [7:0] w_f7,
	input [7:0] w_f8,
	input [7:0] w_f9,
	input [7:0] w_fa,
	input [7:0] w_fb,
	input [7:0] w_fc,
	input [7:0] w_fd,
	input [7:0] w_fe,
	input [7:0] w_ff,

    input [31:0] a_0,
	input [31:0] a_1,
	input [31:0] a_2,
	input [31:0] a_3,
	input [31:0] a_4,
	input [31:0] a_5,
	input [31:0] a_6,
	input [31:0] a_7,
	input [31:0] a_8,
	input [31:0] a_9,
	input [31:0] a_a,
	input [31:0] a_b,
	input [31:0] a_c,
	input [31:0] a_d,
	input [31:0] a_e,
	input [31:0] a_f,

    // acc result
    output [31:0] a_out_0,
    output [31:0] a_out_1,
    output [31:0] a_out_2,
    output [31:0] a_out_3,
    output [31:0] a_out_4,
    output [31:0] a_out_5,
    output [31:0] a_out_6,
    output [31:0] a_out_7,
    output [31:0] a_out_8,
    output [31:0] a_out_9,
    output [31:0] a_out_a,
    output [31:0] a_out_b,
    output [31:0] a_out_c,
    output [31:0] a_out_d,
    output [31:0] a_out_e,
    output [31:0] a_out_f,

    // out result
    output [7:0] o_0,
    output [7:0] o_1,
    output [7:0] o_2,
    output [7:0] o_3,
    output [7:0] o_4,
    output [7:0] o_5,
    output [7:0] o_6,
    output [7:0] o_7,
    output [7:0] o_8,
    output [7:0] o_9,
    output [7:0] o_a,
    output [7:0] o_b,
    output [7:0] o_c,
    output [7:0] o_d,
    output [7:0] o_e,
    output [7:0] o_f,

    input           gemm_reset,
    input           in_valid,
    output          output_valid,
    output          state_done);

parameter IDLE = 3'b001;
parameter WORK = 3'b010;
parameter DONE = 3'b100;

wire clk = ap_clk;
wire rst = ap_rst;

// #region ACC
reg [31:0] acc_0;
reg [31:0] acc_1;
reg [31:0] acc_2;
reg [31:0] acc_3;
reg [31:0] acc_4;
reg [31:0] acc_5;
reg [31:0] acc_6;
reg [31:0] acc_7;
reg [31:0] acc_8;
reg [31:0] acc_9;
reg [31:0] acc_a;
reg [31:0] acc_b;
reg [31:0] acc_c;
reg [31:0] acc_d;
reg [31:0] acc_e;
reg [31:0] acc_f;
// #endregion

// #region Input
reg [7:0] input_0;
reg [7:0] input_1;
reg [7:0] input_2;
reg [7:0] input_3;
reg [7:0] input_4;
reg [7:0] input_5;
reg [7:0] input_6;
reg [7:0] input_7;
reg [7:0] input_8;
reg [7:0] input_9;
reg [7:0] input_a;
reg [7:0] input_b;
reg [7:0] input_c;
reg [7:0] input_d;
reg [7:0] input_e;
reg [7:0] input_f;
// #endregion

// #region Weight
reg [7:0] weight_00;
reg [7:0] weight_01;
reg [7:0] weight_02;
reg [7:0] weight_03;
reg [7:0] weight_04;
reg [7:0] weight_05;
reg [7:0] weight_06;
reg [7:0] weight_07;
reg [7:0] weight_08;
reg [7:0] weight_09;
reg [7:0] weight_0a;
reg [7:0] weight_0b;
reg [7:0] weight_0c;
reg [7:0] weight_0d;
reg [7:0] weight_0e;
reg [7:0] weight_0f;

reg [7:0] weight_10;
reg [7:0] weight_11;
reg [7:0] weight_12;
reg [7:0] weight_13;
reg [7:0] weight_14;
reg [7:0] weight_15;
reg [7:0] weight_16;
reg [7:0] weight_17;
reg [7:0] weight_18;
reg [7:0] weight_19;
reg [7:0] weight_1a;
reg [7:0] weight_1b;
reg [7:0] weight_1c;
reg [7:0] weight_1d;
reg [7:0] weight_1e;
reg [7:0] weight_1f;

reg [7:0] weight_20;
reg [7:0] weight_21;
reg [7:0] weight_22;
reg [7:0] weight_23;
reg [7:0] weight_24;
reg [7:0] weight_25;
reg [7:0] weight_26;
reg [7:0] weight_27;
reg [7:0] weight_28;
reg [7:0] weight_29;
reg [7:0] weight_2a;
reg [7:0] weight_2b;
reg [7:0] weight_2c;
reg [7:0] weight_2d;
reg [7:0] weight_2e;
reg [7:0] weight_2f;

reg [7:0] weight_30;
reg [7:0] weight_31;
reg [7:0] weight_32;
reg [7:0] weight_33;
reg [7:0] weight_34;
reg [7:0] weight_35;
reg [7:0] weight_36;
reg [7:0] weight_37;
reg [7:0] weight_38;
reg [7:0] weight_39;
reg [7:0] weight_3a;
reg [7:0] weight_3b;
reg [7:0] weight_3c;
reg [7:0] weight_3d;
reg [7:0] weight_3e;
reg [7:0] weight_3f;

reg [7:0] weight_40;
reg [7:0] weight_41;
reg [7:0] weight_42;
reg [7:0] weight_43;
reg [7:0] weight_44;
reg [7:0] weight_45;
reg [7:0] weight_46;
reg [7:0] weight_47;
reg [7:0] weight_48;
reg [7:0] weight_49;
reg [7:0] weight_4a;
reg [7:0] weight_4b;
reg [7:0] weight_4c;
reg [7:0] weight_4d;
reg [7:0] weight_4e;
reg [7:0] weight_4f;

reg [7:0] weight_50;
reg [7:0] weight_51;
reg [7:0] weight_52;
reg [7:0] weight_53;
reg [7:0] weight_54;
reg [7:0] weight_55;
reg [7:0] weight_56;
reg [7:0] weight_57;
reg [7:0] weight_58;
reg [7:0] weight_59;
reg [7:0] weight_5a;
reg [7:0] weight_5b;
reg [7:0] weight_5c;
reg [7:0] weight_5d;
reg [7:0] weight_5e;
reg [7:0] weight_5f;

reg [7:0] weight_60;
reg [7:0] weight_61;
reg [7:0] weight_62;
reg [7:0] weight_63;
reg [7:0] weight_64;
reg [7:0] weight_65;
reg [7:0] weight_66;
reg [7:0] weight_67;
reg [7:0] weight_68;
reg [7:0] weight_69;
reg [7:0] weight_6a;
reg [7:0] weight_6b;
reg [7:0] weight_6c;
reg [7:0] weight_6d;
reg [7:0] weight_6e;
reg [7:0] weight_6f;

reg [7:0] weight_70;
reg [7:0] weight_71;
reg [7:0] weight_72;
reg [7:0] weight_73;
reg [7:0] weight_74;
reg [7:0] weight_75;
reg [7:0] weight_76;
reg [7:0] weight_77;
reg [7:0] weight_78;
reg [7:0] weight_79;
reg [7:0] weight_7a;
reg [7:0] weight_7b;
reg [7:0] weight_7c;
reg [7:0] weight_7d;
reg [7:0] weight_7e;
reg [7:0] weight_7f;

reg [7:0] weight_80;
reg [7:0] weight_81;
reg [7:0] weight_82;
reg [7:0] weight_83;
reg [7:0] weight_84;
reg [7:0] weight_85;
reg [7:0] weight_86;
reg [7:0] weight_87;
reg [7:0] weight_88;
reg [7:0] weight_89;
reg [7:0] weight_8a;
reg [7:0] weight_8b;
reg [7:0] weight_8c;
reg [7:0] weight_8d;
reg [7:0] weight_8e;
reg [7:0] weight_8f;

reg [7:0] weight_90;
reg [7:0] weight_91;
reg [7:0] weight_92;
reg [7:0] weight_93;
reg [7:0] weight_94;
reg [7:0] weight_95;
reg [7:0] weight_96;
reg [7:0] weight_97;
reg [7:0] weight_98;
reg [7:0] weight_99;
reg [7:0] weight_9a;
reg [7:0] weight_9b;
reg [7:0] weight_9c;
reg [7:0] weight_9d;
reg [7:0] weight_9e;
reg [7:0] weight_9f;

reg [7:0] weight_a0;
reg [7:0] weight_a1;
reg [7:0] weight_a2;
reg [7:0] weight_a3;
reg [7:0] weight_a4;
reg [7:0] weight_a5;
reg [7:0] weight_a6;
reg [7:0] weight_a7;
reg [7:0] weight_a8;
reg [7:0] weight_a9;
reg [7:0] weight_aa;
reg [7:0] weight_ab;
reg [7:0] weight_ac;
reg [7:0] weight_ad;
reg [7:0] weight_ae;
reg [7:0] weight_af;

reg [7:0] weight_b0;
reg [7:0] weight_b1;
reg [7:0] weight_b2;
reg [7:0] weight_b3;
reg [7:0] weight_b4;
reg [7:0] weight_b5;
reg [7:0] weight_b6;
reg [7:0] weight_b7;
reg [7:0] weight_b8;
reg [7:0] weight_b9;
reg [7:0] weight_ba;
reg [7:0] weight_bb;
reg [7:0] weight_bc;
reg [7:0] weight_bd;
reg [7:0] weight_be;
reg [7:0] weight_bf;

reg [7:0] weight_c0;
reg [7:0] weight_c1;
reg [7:0] weight_c2;
reg [7:0] weight_c3;
reg [7:0] weight_c4;
reg [7:0] weight_c5;
reg [7:0] weight_c6;
reg [7:0] weight_c7;
reg [7:0] weight_c8;
reg [7:0] weight_c9;
reg [7:0] weight_ca;
reg [7:0] weight_cb;
reg [7:0] weight_cc;
reg [7:0] weight_cd;
reg [7:0] weight_ce;
reg [7:0] weight_cf;

reg [7:0] weight_d0;
reg [7:0] weight_d1;
reg [7:0] weight_d2;
reg [7:0] weight_d3;
reg [7:0] weight_d4;
reg [7:0] weight_d5;
reg [7:0] weight_d6;
reg [7:0] weight_d7;
reg [7:0] weight_d8;
reg [7:0] weight_d9;
reg [7:0] weight_da;
reg [7:0] weight_db;
reg [7:0] weight_dc;
reg [7:0] weight_dd;
reg [7:0] weight_de;
reg [7:0] weight_df;

reg [7:0] weight_e0;
reg [7:0] weight_e1;
reg [7:0] weight_e2;
reg [7:0] weight_e3;
reg [7:0] weight_e4;
reg [7:0] weight_e5;
reg [7:0] weight_e6;
reg [7:0] weight_e7;
reg [7:0] weight_e8;
reg [7:0] weight_e9;
reg [7:0] weight_ea;
reg [7:0] weight_eb;
reg [7:0] weight_ec;
reg [7:0] weight_ed;
reg [7:0] weight_ee;
reg [7:0] weight_ef;

reg [7:0] weight_f0;
reg [7:0] weight_f1;
reg [7:0] weight_f2;
reg [7:0] weight_f3;
reg [7:0] weight_f4;
reg [7:0] weight_f5;
reg [7:0] weight_f6;
reg [7:0] weight_f7;
reg [7:0] weight_f8;
reg [7:0] weight_f9;
reg [7:0] weight_fa;
reg [7:0] weight_fb;
reg [7:0] weight_fc;
reg [7:0] weight_fd;
reg [7:0] weight_fe;
reg [7:0] weight_ff;
// #endregion

reg       input_valid;          // Input valid iter1
reg       current_input_valid;  // Input valid iter2
reg       add1_valid;           // Input valid iter3
reg       acc_valid;            //
reg       out_valid;            //

wire signed [15:0] weight_ext_00;
wire signed [15:0] weight_ext_01;
wire signed [15:0] weight_ext_02;
wire signed [15:0] weight_ext_03;
wire signed [15:0] weight_ext_04;
wire signed [15:0] weight_ext_05;
wire signed [15:0] weight_ext_06;
wire signed [15:0] weight_ext_07;
wire signed [15:0] weight_ext_08;
wire signed [15:0] weight_ext_09;
wire signed [15:0] weight_ext_0a;
wire signed [15:0] weight_ext_0b;
wire signed [15:0] weight_ext_0c;
wire signed [15:0] weight_ext_0d;
wire signed [15:0] weight_ext_0e;
wire signed [15:0] weight_ext_0f;
wire signed [15:0] weight_ext_10;
wire signed [15:0] weight_ext_11;
wire signed [15:0] weight_ext_12;
wire signed [15:0] weight_ext_13;
wire signed [15:0] weight_ext_14;
wire signed [15:0] weight_ext_15;
wire signed [15:0] weight_ext_16;
wire signed [15:0] weight_ext_17;
wire signed [15:0] weight_ext_18;
wire signed [15:0] weight_ext_19;
wire signed [15:0] weight_ext_1a;
wire signed [15:0] weight_ext_1b;
wire signed [15:0] weight_ext_1c;
wire signed [15:0] weight_ext_1d;
wire signed [15:0] weight_ext_1e;
wire signed [15:0] weight_ext_1f;
wire signed [15:0] weight_ext_20;
wire signed [15:0] weight_ext_21;
wire signed [15:0] weight_ext_22;
wire signed [15:0] weight_ext_23;
wire signed [15:0] weight_ext_24;
wire signed [15:0] weight_ext_25;
wire signed [15:0] weight_ext_26;
wire signed [15:0] weight_ext_27;
wire signed [15:0] weight_ext_28;
wire signed [15:0] weight_ext_29;
wire signed [15:0] weight_ext_2a;
wire signed [15:0] weight_ext_2b;
wire signed [15:0] weight_ext_2c;
wire signed [15:0] weight_ext_2d;
wire signed [15:0] weight_ext_2e;
wire signed [15:0] weight_ext_2f;
wire signed [15:0] weight_ext_30;
wire signed [15:0] weight_ext_31;
wire signed [15:0] weight_ext_32;
wire signed [15:0] weight_ext_33;
wire signed [15:0] weight_ext_34;
wire signed [15:0] weight_ext_35;
wire signed [15:0] weight_ext_36;
wire signed [15:0] weight_ext_37;
wire signed [15:0] weight_ext_38;
wire signed [15:0] weight_ext_39;
wire signed [15:0] weight_ext_3a;
wire signed [15:0] weight_ext_3b;
wire signed [15:0] weight_ext_3c;
wire signed [15:0] weight_ext_3d;
wire signed [15:0] weight_ext_3e;
wire signed [15:0] weight_ext_3f;
wire signed [15:0] weight_ext_40;
wire signed [15:0] weight_ext_41;
wire signed [15:0] weight_ext_42;
wire signed [15:0] weight_ext_43;
wire signed [15:0] weight_ext_44;
wire signed [15:0] weight_ext_45;
wire signed [15:0] weight_ext_46;
wire signed [15:0] weight_ext_47;
wire signed [15:0] weight_ext_48;
wire signed [15:0] weight_ext_49;
wire signed [15:0] weight_ext_4a;
wire signed [15:0] weight_ext_4b;
wire signed [15:0] weight_ext_4c;
wire signed [15:0] weight_ext_4d;
wire signed [15:0] weight_ext_4e;
wire signed [15:0] weight_ext_4f;
wire signed [15:0] weight_ext_50;
wire signed [15:0] weight_ext_51;
wire signed [15:0] weight_ext_52;
wire signed [15:0] weight_ext_53;
wire signed [15:0] weight_ext_54;
wire signed [15:0] weight_ext_55;
wire signed [15:0] weight_ext_56;
wire signed [15:0] weight_ext_57;
wire signed [15:0] weight_ext_58;
wire signed [15:0] weight_ext_59;
wire signed [15:0] weight_ext_5a;
wire signed [15:0] weight_ext_5b;
wire signed [15:0] weight_ext_5c;
wire signed [15:0] weight_ext_5d;
wire signed [15:0] weight_ext_5e;
wire signed [15:0] weight_ext_5f;
wire signed [15:0] weight_ext_60;
wire signed [15:0] weight_ext_61;
wire signed [15:0] weight_ext_62;
wire signed [15:0] weight_ext_63;
wire signed [15:0] weight_ext_64;
wire signed [15:0] weight_ext_65;
wire signed [15:0] weight_ext_66;
wire signed [15:0] weight_ext_67;
wire signed [15:0] weight_ext_68;
wire signed [15:0] weight_ext_69;
wire signed [15:0] weight_ext_6a;
wire signed [15:0] weight_ext_6b;
wire signed [15:0] weight_ext_6c;
wire signed [15:0] weight_ext_6d;
wire signed [15:0] weight_ext_6e;
wire signed [15:0] weight_ext_6f;
wire signed [15:0] weight_ext_70;
wire signed [15:0] weight_ext_71;
wire signed [15:0] weight_ext_72;
wire signed [15:0] weight_ext_73;
wire signed [15:0] weight_ext_74;
wire signed [15:0] weight_ext_75;
wire signed [15:0] weight_ext_76;
wire signed [15:0] weight_ext_77;
wire signed [15:0] weight_ext_78;
wire signed [15:0] weight_ext_79;
wire signed [15:0] weight_ext_7a;
wire signed [15:0] weight_ext_7b;
wire signed [15:0] weight_ext_7c;
wire signed [15:0] weight_ext_7d;
wire signed [15:0] weight_ext_7e;
wire signed [15:0] weight_ext_7f;
wire signed [15:0] weight_ext_80;
wire signed [15:0] weight_ext_81;
wire signed [15:0] weight_ext_82;
wire signed [15:0] weight_ext_83;
wire signed [15:0] weight_ext_84;
wire signed [15:0] weight_ext_85;
wire signed [15:0] weight_ext_86;
wire signed [15:0] weight_ext_87;
wire signed [15:0] weight_ext_88;
wire signed [15:0] weight_ext_89;
wire signed [15:0] weight_ext_8a;
wire signed [15:0] weight_ext_8b;
wire signed [15:0] weight_ext_8c;
wire signed [15:0] weight_ext_8d;
wire signed [15:0] weight_ext_8e;
wire signed [15:0] weight_ext_8f;
wire signed [15:0] weight_ext_90;
wire signed [15:0] weight_ext_91;
wire signed [15:0] weight_ext_92;
wire signed [15:0] weight_ext_93;
wire signed [15:0] weight_ext_94;
wire signed [15:0] weight_ext_95;
wire signed [15:0] weight_ext_96;
wire signed [15:0] weight_ext_97;
wire signed [15:0] weight_ext_98;
wire signed [15:0] weight_ext_99;
wire signed [15:0] weight_ext_9a;
wire signed [15:0] weight_ext_9b;
wire signed [15:0] weight_ext_9c;
wire signed [15:0] weight_ext_9d;
wire signed [15:0] weight_ext_9e;
wire signed [15:0] weight_ext_9f;
wire signed [15:0] weight_ext_a0;
wire signed [15:0] weight_ext_a1;
wire signed [15:0] weight_ext_a2;
wire signed [15:0] weight_ext_a3;
wire signed [15:0] weight_ext_a4;
wire signed [15:0] weight_ext_a5;
wire signed [15:0] weight_ext_a6;
wire signed [15:0] weight_ext_a7;
wire signed [15:0] weight_ext_a8;
wire signed [15:0] weight_ext_a9;
wire signed [15:0] weight_ext_aa;
wire signed [15:0] weight_ext_ab;
wire signed [15:0] weight_ext_ac;
wire signed [15:0] weight_ext_ad;
wire signed [15:0] weight_ext_ae;
wire signed [15:0] weight_ext_af;
wire signed [15:0] weight_ext_b0;
wire signed [15:0] weight_ext_b1;
wire signed [15:0] weight_ext_b2;
wire signed [15:0] weight_ext_b3;
wire signed [15:0] weight_ext_b4;
wire signed [15:0] weight_ext_b5;
wire signed [15:0] weight_ext_b6;
wire signed [15:0] weight_ext_b7;
wire signed [15:0] weight_ext_b8;
wire signed [15:0] weight_ext_b9;
wire signed [15:0] weight_ext_ba;
wire signed [15:0] weight_ext_bb;
wire signed [15:0] weight_ext_bc;
wire signed [15:0] weight_ext_bd;
wire signed [15:0] weight_ext_be;
wire signed [15:0] weight_ext_bf;
wire signed [15:0] weight_ext_c0;
wire signed [15:0] weight_ext_c1;
wire signed [15:0] weight_ext_c2;
wire signed [15:0] weight_ext_c3;
wire signed [15:0] weight_ext_c4;
wire signed [15:0] weight_ext_c5;
wire signed [15:0] weight_ext_c6;
wire signed [15:0] weight_ext_c7;
wire signed [15:0] weight_ext_c8;
wire signed [15:0] weight_ext_c9;
wire signed [15:0] weight_ext_ca;
wire signed [15:0] weight_ext_cb;
wire signed [15:0] weight_ext_cc;
wire signed [15:0] weight_ext_cd;
wire signed [15:0] weight_ext_ce;
wire signed [15:0] weight_ext_cf;
wire signed [15:0] weight_ext_d0;
wire signed [15:0] weight_ext_d1;
wire signed [15:0] weight_ext_d2;
wire signed [15:0] weight_ext_d3;
wire signed [15:0] weight_ext_d4;
wire signed [15:0] weight_ext_d5;
wire signed [15:0] weight_ext_d6;
wire signed [15:0] weight_ext_d7;
wire signed [15:0] weight_ext_d8;
wire signed [15:0] weight_ext_d9;
wire signed [15:0] weight_ext_da;
wire signed [15:0] weight_ext_db;
wire signed [15:0] weight_ext_dc;
wire signed [15:0] weight_ext_dd;
wire signed [15:0] weight_ext_de;
wire signed [15:0] weight_ext_df;
wire signed [15:0] weight_ext_e0;
wire signed [15:0] weight_ext_e1;
wire signed [15:0] weight_ext_e2;
wire signed [15:0] weight_ext_e3;
wire signed [15:0] weight_ext_e4;
wire signed [15:0] weight_ext_e5;
wire signed [15:0] weight_ext_e6;
wire signed [15:0] weight_ext_e7;
wire signed [15:0] weight_ext_e8;
wire signed [15:0] weight_ext_e9;
wire signed [15:0] weight_ext_ea;
wire signed [15:0] weight_ext_eb;
wire signed [15:0] weight_ext_ec;
wire signed [15:0] weight_ext_ed;
wire signed [15:0] weight_ext_ee;
wire signed [15:0] weight_ext_ef;
wire signed [15:0] weight_ext_f0;
wire signed [15:0] weight_ext_f1;
wire signed [15:0] weight_ext_f2;
wire signed [15:0] weight_ext_f3;
wire signed [15:0] weight_ext_f4;
wire signed [15:0] weight_ext_f5;
wire signed [15:0] weight_ext_f6;
wire signed [15:0] weight_ext_f7;
wire signed [15:0] weight_ext_f8;
wire signed [15:0] weight_ext_f9;
wire signed [15:0] weight_ext_fa;
wire signed [15:0] weight_ext_fb;
wire signed [15:0] weight_ext_fc;
wire signed [15:0] weight_ext_fd;
wire signed [15:0] weight_ext_fe;
wire signed [15:0] weight_ext_ff;

wire signed [15:0] shift_result_00;
wire signed [15:0] shift_result_01;
wire signed [15:0] shift_result_02;
wire signed [15:0] shift_result_03;
wire signed [15:0] shift_result_04;
wire signed [15:0] shift_result_05;
wire signed [15:0] shift_result_06;
wire signed [15:0] shift_result_07;
wire signed [15:0] shift_result_08;
wire signed [15:0] shift_result_09;
wire signed [15:0] shift_result_0a;
wire signed [15:0] shift_result_0b;
wire signed [15:0] shift_result_0c;
wire signed [15:0] shift_result_0d;
wire signed [15:0] shift_result_0e;
wire signed [15:0] shift_result_0f;
wire signed [15:0] shift_result_10;
wire signed [15:0] shift_result_11;
wire signed [15:0] shift_result_12;
wire signed [15:0] shift_result_13;
wire signed [15:0] shift_result_14;
wire signed [15:0] shift_result_15;
wire signed [15:0] shift_result_16;
wire signed [15:0] shift_result_17;
wire signed [15:0] shift_result_18;
wire signed [15:0] shift_result_19;
wire signed [15:0] shift_result_1a;
wire signed [15:0] shift_result_1b;
wire signed [15:0] shift_result_1c;
wire signed [15:0] shift_result_1d;
wire signed [15:0] shift_result_1e;
wire signed [15:0] shift_result_1f;
wire signed [15:0] shift_result_20;
wire signed [15:0] shift_result_21;
wire signed [15:0] shift_result_22;
wire signed [15:0] shift_result_23;
wire signed [15:0] shift_result_24;
wire signed [15:0] shift_result_25;
wire signed [15:0] shift_result_26;
wire signed [15:0] shift_result_27;
wire signed [15:0] shift_result_28;
wire signed [15:0] shift_result_29;
wire signed [15:0] shift_result_2a;
wire signed [15:0] shift_result_2b;
wire signed [15:0] shift_result_2c;
wire signed [15:0] shift_result_2d;
wire signed [15:0] shift_result_2e;
wire signed [15:0] shift_result_2f;
wire signed [15:0] shift_result_30;
wire signed [15:0] shift_result_31;
wire signed [15:0] shift_result_32;
wire signed [15:0] shift_result_33;
wire signed [15:0] shift_result_34;
wire signed [15:0] shift_result_35;
wire signed [15:0] shift_result_36;
wire signed [15:0] shift_result_37;
wire signed [15:0] shift_result_38;
wire signed [15:0] shift_result_39;
wire signed [15:0] shift_result_3a;
wire signed [15:0] shift_result_3b;
wire signed [15:0] shift_result_3c;
wire signed [15:0] shift_result_3d;
wire signed [15:0] shift_result_3e;
wire signed [15:0] shift_result_3f;
wire signed [15:0] shift_result_40;
wire signed [15:0] shift_result_41;
wire signed [15:0] shift_result_42;
wire signed [15:0] shift_result_43;
wire signed [15:0] shift_result_44;
wire signed [15:0] shift_result_45;
wire signed [15:0] shift_result_46;
wire signed [15:0] shift_result_47;
wire signed [15:0] shift_result_48;
wire signed [15:0] shift_result_49;
wire signed [15:0] shift_result_4a;
wire signed [15:0] shift_result_4b;
wire signed [15:0] shift_result_4c;
wire signed [15:0] shift_result_4d;
wire signed [15:0] shift_result_4e;
wire signed [15:0] shift_result_4f;
wire signed [15:0] shift_result_50;
wire signed [15:0] shift_result_51;
wire signed [15:0] shift_result_52;
wire signed [15:0] shift_result_53;
wire signed [15:0] shift_result_54;
wire signed [15:0] shift_result_55;
wire signed [15:0] shift_result_56;
wire signed [15:0] shift_result_57;
wire signed [15:0] shift_result_58;
wire signed [15:0] shift_result_59;
wire signed [15:0] shift_result_5a;
wire signed [15:0] shift_result_5b;
wire signed [15:0] shift_result_5c;
wire signed [15:0] shift_result_5d;
wire signed [15:0] shift_result_5e;
wire signed [15:0] shift_result_5f;
wire signed [15:0] shift_result_60;
wire signed [15:0] shift_result_61;
wire signed [15:0] shift_result_62;
wire signed [15:0] shift_result_63;
wire signed [15:0] shift_result_64;
wire signed [15:0] shift_result_65;
wire signed [15:0] shift_result_66;
wire signed [15:0] shift_result_67;
wire signed [15:0] shift_result_68;
wire signed [15:0] shift_result_69;
wire signed [15:0] shift_result_6a;
wire signed [15:0] shift_result_6b;
wire signed [15:0] shift_result_6c;
wire signed [15:0] shift_result_6d;
wire signed [15:0] shift_result_6e;
wire signed [15:0] shift_result_6f;
wire signed [15:0] shift_result_70;
wire signed [15:0] shift_result_71;
wire signed [15:0] shift_result_72;
wire signed [15:0] shift_result_73;
wire signed [15:0] shift_result_74;
wire signed [15:0] shift_result_75;
wire signed [15:0] shift_result_76;
wire signed [15:0] shift_result_77;
wire signed [15:0] shift_result_78;
wire signed [15:0] shift_result_79;
wire signed [15:0] shift_result_7a;
wire signed [15:0] shift_result_7b;
wire signed [15:0] shift_result_7c;
wire signed [15:0] shift_result_7d;
wire signed [15:0] shift_result_7e;
wire signed [15:0] shift_result_7f;
wire signed [15:0] shift_result_80;
wire signed [15:0] shift_result_81;
wire signed [15:0] shift_result_82;
wire signed [15:0] shift_result_83;
wire signed [15:0] shift_result_84;
wire signed [15:0] shift_result_85;
wire signed [15:0] shift_result_86;
wire signed [15:0] shift_result_87;
wire signed [15:0] shift_result_88;
wire signed [15:0] shift_result_89;
wire signed [15:0] shift_result_8a;
wire signed [15:0] shift_result_8b;
wire signed [15:0] shift_result_8c;
wire signed [15:0] shift_result_8d;
wire signed [15:0] shift_result_8e;
wire signed [15:0] shift_result_8f;
wire signed [15:0] shift_result_90;
wire signed [15:0] shift_result_91;
wire signed [15:0] shift_result_92;
wire signed [15:0] shift_result_93;
wire signed [15:0] shift_result_94;
wire signed [15:0] shift_result_95;
wire signed [15:0] shift_result_96;
wire signed [15:0] shift_result_97;
wire signed [15:0] shift_result_98;
wire signed [15:0] shift_result_99;
wire signed [15:0] shift_result_9a;
wire signed [15:0] shift_result_9b;
wire signed [15:0] shift_result_9c;
wire signed [15:0] shift_result_9d;
wire signed [15:0] shift_result_9e;
wire signed [15:0] shift_result_9f;
wire signed [15:0] shift_result_a0;
wire signed [15:0] shift_result_a1;
wire signed [15:0] shift_result_a2;
wire signed [15:0] shift_result_a3;
wire signed [15:0] shift_result_a4;
wire signed [15:0] shift_result_a5;
wire signed [15:0] shift_result_a6;
wire signed [15:0] shift_result_a7;
wire signed [15:0] shift_result_a8;
wire signed [15:0] shift_result_a9;
wire signed [15:0] shift_result_aa;
wire signed [15:0] shift_result_ab;
wire signed [15:0] shift_result_ac;
wire signed [15:0] shift_result_ad;
wire signed [15:0] shift_result_ae;
wire signed [15:0] shift_result_af;
wire signed [15:0] shift_result_b0;
wire signed [15:0] shift_result_b1;
wire signed [15:0] shift_result_b2;
wire signed [15:0] shift_result_b3;
wire signed [15:0] shift_result_b4;
wire signed [15:0] shift_result_b5;
wire signed [15:0] shift_result_b6;
wire signed [15:0] shift_result_b7;
wire signed [15:0] shift_result_b8;
wire signed [15:0] shift_result_b9;
wire signed [15:0] shift_result_ba;
wire signed [15:0] shift_result_bb;
wire signed [15:0] shift_result_bc;
wire signed [15:0] shift_result_bd;
wire signed [15:0] shift_result_be;
wire signed [15:0] shift_result_bf;
wire signed [15:0] shift_result_c0;
wire signed [15:0] shift_result_c1;
wire signed [15:0] shift_result_c2;
wire signed [15:0] shift_result_c3;
wire signed [15:0] shift_result_c4;
wire signed [15:0] shift_result_c5;
wire signed [15:0] shift_result_c6;
wire signed [15:0] shift_result_c7;
wire signed [15:0] shift_result_c8;
wire signed [15:0] shift_result_c9;
wire signed [15:0] shift_result_ca;
wire signed [15:0] shift_result_cb;
wire signed [15:0] shift_result_cc;
wire signed [15:0] shift_result_cd;
wire signed [15:0] shift_result_ce;
wire signed [15:0] shift_result_cf;
wire signed [15:0] shift_result_d0;
wire signed [15:0] shift_result_d1;
wire signed [15:0] shift_result_d2;
wire signed [15:0] shift_result_d3;
wire signed [15:0] shift_result_d4;
wire signed [15:0] shift_result_d5;
wire signed [15:0] shift_result_d6;
wire signed [15:0] shift_result_d7;
wire signed [15:0] shift_result_d8;
wire signed [15:0] shift_result_d9;
wire signed [15:0] shift_result_da;
wire signed [15:0] shift_result_db;
wire signed [15:0] shift_result_dc;
wire signed [15:0] shift_result_dd;
wire signed [15:0] shift_result_de;
wire signed [15:0] shift_result_df;
wire signed [15:0] shift_result_e0;
wire signed [15:0] shift_result_e1;
wire signed [15:0] shift_result_e2;
wire signed [15:0] shift_result_e3;
wire signed [15:0] shift_result_e4;
wire signed [15:0] shift_result_e5;
wire signed [15:0] shift_result_e6;
wire signed [15:0] shift_result_e7;
wire signed [15:0] shift_result_e8;
wire signed [15:0] shift_result_e9;
wire signed [15:0] shift_result_ea;
wire signed [15:0] shift_result_eb;
wire signed [15:0] shift_result_ec;
wire signed [15:0] shift_result_ed;
wire signed [15:0] shift_result_ee;
wire signed [15:0] shift_result_ef;
wire signed [15:0] shift_result_f0;
wire signed [15:0] shift_result_f1;
wire signed [15:0] shift_result_f2;
wire signed [15:0] shift_result_f3;
wire signed [15:0] shift_result_f4;
wire signed [15:0] shift_result_f5;
wire signed [15:0] shift_result_f6;
wire signed [15:0] shift_result_f7;
wire signed [15:0] shift_result_f8;
wire signed [15:0] shift_result_f9;
wire signed [15:0] shift_result_fa;
wire signed [15:0] shift_result_fb;
wire signed [15:0] shift_result_fc;
wire signed [15:0] shift_result_fd;
wire signed [15:0] shift_result_fe;
wire signed [15:0] shift_result_ff;

// Stage1 adder
wire signed [16:0] add0_result_00;
wire signed [16:0] add0_result_02;
wire signed [16:0] add0_result_04;
wire signed [16:0] add0_result_06;
wire signed [16:0] add0_result_08;
wire signed [16:0] add0_result_0a;
wire signed [16:0] add0_result_0c;
wire signed [16:0] add0_result_0e;

wire signed [16:0] add0_result_10;
wire signed [16:0] add0_result_12;
wire signed [16:0] add0_result_14;
wire signed [16:0] add0_result_16;
wire signed [16:0] add0_result_18;
wire signed [16:0] add0_result_1a;
wire signed [16:0] add0_result_1c;
wire signed [16:0] add0_result_1e;

wire signed [16:0] add0_result_20;
wire signed [16:0] add0_result_22;
wire signed [16:0] add0_result_24;
wire signed [16:0] add0_result_26;
wire signed [16:0] add0_result_28;
wire signed [16:0] add0_result_2a;
wire signed [16:0] add0_result_2c;
wire signed [16:0] add0_result_2e;

wire signed [16:0] add0_result_30;
wire signed [16:0] add0_result_32;
wire signed [16:0] add0_result_34;
wire signed [16:0] add0_result_36;
wire signed [16:0] add0_result_38;
wire signed [16:0] add0_result_3a;
wire signed [16:0] add0_result_3c;
wire signed [16:0] add0_result_3e;

wire signed [16:0] add0_result_40;
wire signed [16:0] add0_result_42;
wire signed [16:0] add0_result_44;
wire signed [16:0] add0_result_46;
wire signed [16:0] add0_result_48;
wire signed [16:0] add0_result_4a;
wire signed [16:0] add0_result_4c;
wire signed [16:0] add0_result_4e;
wire signed [16:0] add0_result_50;
wire signed [16:0] add0_result_52;
wire signed [16:0] add0_result_54;
wire signed [16:0] add0_result_56;
wire signed [16:0] add0_result_58;
wire signed [16:0] add0_result_5a;
wire signed [16:0] add0_result_5c;
wire signed [16:0] add0_result_5e;
wire signed [16:0] add0_result_60;
wire signed [16:0] add0_result_62;
wire signed [16:0] add0_result_64;
wire signed [16:0] add0_result_66;
wire signed [16:0] add0_result_68;
wire signed [16:0] add0_result_6a;
wire signed [16:0] add0_result_6c;
wire signed [16:0] add0_result_6e;
wire signed [16:0] add0_result_70;
wire signed [16:0] add0_result_72;
wire signed [16:0] add0_result_74;
wire signed [16:0] add0_result_76;
wire signed [16:0] add0_result_78;
wire signed [16:0] add0_result_7a;
wire signed [16:0] add0_result_7c;
wire signed [16:0] add0_result_7e;
wire signed [16:0] add0_result_80;
wire signed [16:0] add0_result_82;
wire signed [16:0] add0_result_84;
wire signed [16:0] add0_result_86;
wire signed [16:0] add0_result_88;
wire signed [16:0] add0_result_8a;
wire signed [16:0] add0_result_8c;
wire signed [16:0] add0_result_8e;
wire signed [16:0] add0_result_90;
wire signed [16:0] add0_result_92;
wire signed [16:0] add0_result_94;
wire signed [16:0] add0_result_96;
wire signed [16:0] add0_result_98;
wire signed [16:0] add0_result_9a;
wire signed [16:0] add0_result_9c;
wire signed [16:0] add0_result_9e;
wire signed [16:0] add0_result_a0;
wire signed [16:0] add0_result_a2;
wire signed [16:0] add0_result_a4;
wire signed [16:0] add0_result_a6;
wire signed [16:0] add0_result_a8;
wire signed [16:0] add0_result_aa;
wire signed [16:0] add0_result_ac;
wire signed [16:0] add0_result_ae;
wire signed [16:0] add0_result_b0;
wire signed [16:0] add0_result_b2;
wire signed [16:0] add0_result_b4;
wire signed [16:0] add0_result_b6;
wire signed [16:0] add0_result_b8;
wire signed [16:0] add0_result_ba;
wire signed [16:0] add0_result_bc;
wire signed [16:0] add0_result_be;
wire signed [16:0] add0_result_c0;
wire signed [16:0] add0_result_c2;
wire signed [16:0] add0_result_c4;
wire signed [16:0] add0_result_c6;
wire signed [16:0] add0_result_c8;
wire signed [16:0] add0_result_ca;
wire signed [16:0] add0_result_cc;
wire signed [16:0] add0_result_ce;
wire signed [16:0] add0_result_d0;
wire signed [16:0] add0_result_d2;
wire signed [16:0] add0_result_d4;
wire signed [16:0] add0_result_d6;
wire signed [16:0] add0_result_d8;
wire signed [16:0] add0_result_da;
wire signed [16:0] add0_result_dc;
wire signed [16:0] add0_result_de;
wire signed [16:0] add0_result_e0;
wire signed [16:0] add0_result_e2;
wire signed [16:0] add0_result_e4;
wire signed [16:0] add0_result_e6;
wire signed [16:0] add0_result_e8;
wire signed [16:0] add0_result_ea;
wire signed [16:0] add0_result_ec;
wire signed [16:0] add0_result_ee;
wire signed [16:0] add0_result_f0;
wire signed [16:0] add0_result_f2;
wire signed [16:0] add0_result_f4;
wire signed [16:0] add0_result_f6;
wire signed [16:0] add0_result_f8;
wire signed [16:0] add0_result_fa;
wire signed [16:0] add0_result_fc;
wire signed [16:0] add0_result_fe;

// Add stage1
reg signed [17:0] add1_result_00;
reg signed [17:0] add1_result_04;
reg signed [17:0] add1_result_08;
reg signed [17:0] add1_result_0c;
reg signed [17:0] add1_result_10;
reg signed [17:0] add1_result_14;
reg signed [17:0] add1_result_18;
reg signed [17:0] add1_result_1c;
reg signed [17:0] add1_result_20;
reg signed [17:0] add1_result_24;
reg signed [17:0] add1_result_28;
reg signed [17:0] add1_result_2c;
reg signed [17:0] add1_result_30;
reg signed [17:0] add1_result_34;
reg signed [17:0] add1_result_38;
reg signed [17:0] add1_result_3c;
reg signed [17:0] add1_result_40;
reg signed [17:0] add1_result_44;
reg signed [17:0] add1_result_48;
reg signed [17:0] add1_result_4c;
reg signed [17:0] add1_result_50;
reg signed [17:0] add1_result_54;
reg signed [17:0] add1_result_58;
reg signed [17:0] add1_result_5c;
reg signed [17:0] add1_result_60;
reg signed [17:0] add1_result_64;
reg signed [17:0] add1_result_68;
reg signed [17:0] add1_result_6c;
reg signed [17:0] add1_result_70;
reg signed [17:0] add1_result_74;
reg signed [17:0] add1_result_78;
reg signed [17:0] add1_result_7c;
reg signed [17:0] add1_result_80;
reg signed [17:0] add1_result_84;
reg signed [17:0] add1_result_88;
reg signed [17:0] add1_result_8c;
reg signed [17:0] add1_result_90;
reg signed [17:0] add1_result_94;
reg signed [17:0] add1_result_98;
reg signed [17:0] add1_result_9c;
reg signed [17:0] add1_result_a0;
reg signed [17:0] add1_result_a4;
reg signed [17:0] add1_result_a8;
reg signed [17:0] add1_result_ac;
reg signed [17:0] add1_result_b0;
reg signed [17:0] add1_result_b4;
reg signed [17:0] add1_result_b8;
reg signed [17:0] add1_result_bc;
reg signed [17:0] add1_result_c0;
reg signed [17:0] add1_result_c4;
reg signed [17:0] add1_result_c8;
reg signed [17:0] add1_result_cc;
reg signed [17:0] add1_result_d0;
reg signed [17:0] add1_result_d4;
reg signed [17:0] add1_result_d8;
reg signed [17:0] add1_result_dc;
reg signed [17:0] add1_result_e0;
reg signed [17:0] add1_result_e4;
reg signed [17:0] add1_result_e8;
reg signed [17:0] add1_result_ec;
reg signed [17:0] add1_result_f0;
reg signed [17:0] add1_result_f4;
reg signed [17:0] add1_result_f8;
reg signed [17:0] add1_result_fc;

// Adder stage2
wire signed [18:0] add2_result_00;
wire signed [18:0] add2_result_08;
wire signed [18:0] add2_result_10;
wire signed [18:0] add2_result_18;
wire signed [18:0] add2_result_20;
wire signed [18:0] add2_result_28;
wire signed [18:0] add2_result_30;
wire signed [18:0] add2_result_38;
wire signed [18:0] add2_result_40;
wire signed [18:0] add2_result_48;
wire signed [18:0] add2_result_50;
wire signed [18:0] add2_result_58;
wire signed [18:0] add2_result_60;
wire signed [18:0] add2_result_68;
wire signed [18:0] add2_result_70;
wire signed [18:0] add2_result_78;
wire signed [18:0] add2_result_80;
wire signed [18:0] add2_result_88;
wire signed [18:0] add2_result_90;
wire signed [18:0] add2_result_98;
wire signed [18:0] add2_result_a0;
wire signed [18:0] add2_result_a8;
wire signed [18:0] add2_result_b0;
wire signed [18:0] add2_result_b8;
wire signed [18:0] add2_result_c0;
wire signed [18:0] add2_result_c8;
wire signed [18:0] add2_result_d0;
wire signed [18:0] add2_result_d8;
wire signed [18:0] add2_result_e0;
wire signed [18:0] add2_result_e8;
wire signed [18:0] add2_result_f0;
wire signed [18:0] add2_result_f8;

// Adder stage3 
wire signed [19:0] add3_result_00;
wire signed [19:0] add3_result_10;
wire signed [19:0] add3_result_20;
wire signed [19:0] add3_result_30;
wire signed [19:0] add3_result_40;
wire signed [19:0] add3_result_50;
wire signed [19:0] add3_result_60;
wire signed [19:0] add3_result_70;
wire signed [19:0] add3_result_80;
wire signed [19:0] add3_result_90;
wire signed [19:0] add3_result_a0;
wire signed [19:0] add3_result_b0;
wire signed [19:0] add3_result_c0;
wire signed [19:0] add3_result_d0;
wire signed [19:0] add3_result_e0;
wire signed [19:0] add3_result_f0;

// acc result
reg signed [31:0] acc_result_0;
reg signed [31:0] acc_result_1;
reg signed [31:0] acc_result_2;
reg signed [31:0] acc_result_3;
reg signed [31:0] acc_result_4;
reg signed [31:0] acc_result_5;
reg signed [31:0] acc_result_6;
reg signed [31:0] acc_result_7;
reg signed [31:0] acc_result_8;
reg signed [31:0] acc_result_9;
reg signed [31:0] acc_result_a;
reg signed [31:0] acc_result_b;
reg signed [31:0] acc_result_c;
reg signed [31:0] acc_result_d;
reg signed [31:0] acc_result_e;
reg signed [31:0] acc_result_f;

// out result
wire [7:0] output_result_0;
wire [7:0] output_result_1;
wire [7:0] output_result_2;
wire [7:0] output_result_3;
wire [7:0] output_result_4;
wire [7:0] output_result_5;
wire [7:0] output_result_6;
wire [7:0] output_result_7;
wire [7:0] output_result_8;
wire [7:0] output_result_9;
wire [7:0] output_result_a;
wire [7:0] output_result_b;
wire [7:0] output_result_c;
wire [7:0] output_result_d;
wire [7:0] output_result_e;
wire [7:0] output_result_f;

wire       all_zeros;
reg        all_zeros_iter1;
reg        all_zeros_iter2;
     
reg [2:0] state_machine;
reg [2:0] state_machine_temp;

wire      is_state_idle;
wire      is_state_work;
wire      is_state_done;
reg       is_state_work_iter0;

assign is_state_idle = state_machine[4'd0];
assign is_state_work = state_machine[4'd1];
assign is_state_done = state_machine[4'd2];

// power-on initialization
initial begin
    #0 state_machine = 3'b001;
end

// Control State machine
always @(*)
begin
    case(state_machine)
        IDLE: begin
            if(in_valid)begin
               state_machine_temp = WORK; 
            end
            else begin
                state_machine_temp = IDLE;
            end
        end
        WORK: begin
            if(all_zeros & is_state_work_iter0)begin
                state_machine_temp = DONE;
            end
            else begin
                state_machine_temp = WORK;
            end
        end
        DONE: begin
            if(in_valid) begin
                state_machine_temp = WORK;
            end
            else begin
                state_machine_temp = IDLE;
            end
        end
        default: begin
            state_machine_temp = 3'b001;
        end
    endcase
end

always @(posedge clk) begin
    if(rst) begin
        is_state_work_iter0 <= 1'b0;
    end
    else if(is_state_work) begin
        is_state_work_iter0 <= 1'b1;
    end
    else begin
        is_state_work_iter0 <= 1'b0;
    end
end

always @(posedge clk)begin
    if(rst) begin
        state_machine <= IDLE;
    end
    else begin
        state_machine <= state_machine_temp;
    end
end

always@(posedge clk) begin
    if(rst) begin
        input_valid <= 1'b0;
    end
    else begin
        input_valid <= in_valid;
    end
end

always@(posedge clk) begin
    if(rst)
    begin
        current_input_valid <= 1'b0;
    end
    else if(is_state_work) begin
        current_input_valid <= input_valid;
    end
end

always@(posedge clk) begin
    if(rst)
    begin
        add1_valid <= 1'b0;
    end
    else begin
        add1_valid <= current_input_valid;
    end
end

always@(posedge clk) begin
    if(rst)
    begin
        acc_valid  <= 1'b0;
    end
    else begin
        acc_valid <= add1_valid;
    end
end

always@(posedge clk) begin
    if(rst)
    begin
        out_valid  <= 1'b0;
    end
    else if(is_state_done) begin
        out_valid <= 1'b0;
    end
    else if(is_state_work_iter0 & all_zeros) begin
        out_valid <= 1'b1;
    end
    else begin
        out_valid <= 1'b0;
    end
end

// ACC_x
always@(posedge clk)begin
    if(rst) // set to 0 if reset or gemm_reset
    begin
        acc_0 <= 32'h0000_0000;
        acc_1 <= 32'h0000_0000;
        acc_2 <= 32'h0000_0000;
        acc_3 <= 32'h0000_0000;
        acc_4 <= 32'h0000_0000;
        acc_5 <= 32'h0000_0000;
        acc_6 <= 32'h0000_0000;
        acc_7 <= 32'h0000_0000;
        acc_8 <= 32'h0000_0000;
        acc_9 <= 32'h0000_0000;
        acc_a <= 32'h0000_0000;
        acc_b <= 32'h0000_0000;
        acc_c <= 32'h0000_0000;
        acc_d <= 32'h0000_0000;
        acc_e <= 32'h0000_0000;
        acc_f <= 32'h0000_0000;
    end
    else if(in_valid)
    begin
		acc_0	<= a_0;
		acc_1	<= a_1;
		acc_2	<= a_2;
		acc_3	<= a_3;
		acc_4	<= a_4;
		acc_5	<= a_5;
		acc_6	<= a_6;
		acc_7	<= a_7;
		acc_8	<= a_8;
		acc_9	<= a_9;
		acc_a	<= a_a;
		acc_b	<= a_b;
		acc_c	<= a_c;
		acc_d	<= a_d;
		acc_e	<= a_e;
		acc_f	<= a_f;
    end
end

// INPUT_x
always@(posedge clk)begin
    if(rst) // reset or gemm_reset
    begin
        input_0 <= 8'b0000_0000;
        input_1 <= 8'b0000_0000;
        input_2 <= 8'b0000_0000;
        input_3 <= 8'b0000_0000;
        input_4 <= 8'b0000_0000;
        input_5 <= 8'b0000_0000;
        input_6 <= 8'b0000_0000;
        input_7 <= 8'b0000_0000;
        input_8 <= 8'b0000_0000;
        input_9 <= 8'b0000_0000;
        input_a <= 8'b0000_0000;
        input_b <= 8'b0000_0000;
        input_c <= 8'b0000_0000;
        input_d <= 8'b0000_0000;
        input_e <= 8'b0000_0000;
        input_f <= 8'b0000_0000;
    end
    else if(in_valid)
    begin
        input_0	<= i_0;
        input_1	<= i_1;
        input_2	<= i_2;
        input_3	<= i_3;
        input_4	<= i_4;
        input_5	<= i_5;
        input_6	<= i_6;
        input_7	<= i_7;
        input_8	<= i_8;
        input_9	<= i_9;
        input_a	<= i_a;
        input_b	<= i_b;
        input_c	<= i_c;
        input_d	<= i_d;
        input_e	<= i_e;
        input_f	<= i_f;
    end
end

// WEIGHT_xx
always@(posedge clk)begin
    if(rst)
    begin
		weight_00	<= 8'b0000_0000;
		weight_01	<= 8'b0000_0000;
		weight_02	<= 8'b0000_0000;
		weight_03	<= 8'b0000_0000;
		weight_04	<= 8'b0000_0000;
		weight_05	<= 8'b0000_0000;
		weight_06	<= 8'b0000_0000;
		weight_07	<= 8'b0000_0000;
		weight_08	<= 8'b0000_0000;
		weight_09	<= 8'b0000_0000;
		weight_0a	<= 8'b0000_0000;
		weight_0b	<= 8'b0000_0000;
		weight_0c	<= 8'b0000_0000;
		weight_0d	<= 8'b0000_0000;
		weight_0e	<= 8'b0000_0000;
		weight_0f	<= 8'b0000_0000;
		weight_10	<= 8'b0000_0000;
		weight_11	<= 8'b0000_0000;
		weight_12	<= 8'b0000_0000;
		weight_13	<= 8'b0000_0000;
		weight_14	<= 8'b0000_0000;
		weight_15	<= 8'b0000_0000;
		weight_16	<= 8'b0000_0000;
		weight_17	<= 8'b0000_0000;
		weight_18	<= 8'b0000_0000;
		weight_19	<= 8'b0000_0000;
		weight_1a	<= 8'b0000_0000;
		weight_1b	<= 8'b0000_0000;
		weight_1c	<= 8'b0000_0000;
		weight_1d	<= 8'b0000_0000;
		weight_1e	<= 8'b0000_0000;
		weight_1f	<= 8'b0000_0000;
		weight_20	<= 8'b0000_0000;
		weight_21	<= 8'b0000_0000;
		weight_22	<= 8'b0000_0000;
		weight_23	<= 8'b0000_0000;
		weight_24	<= 8'b0000_0000;
		weight_25	<= 8'b0000_0000;
		weight_26	<= 8'b0000_0000;
		weight_27	<= 8'b0000_0000;
		weight_28	<= 8'b0000_0000;
		weight_29	<= 8'b0000_0000;
		weight_2a	<= 8'b0000_0000;
		weight_2b	<= 8'b0000_0000;
		weight_2c	<= 8'b0000_0000;
		weight_2d	<= 8'b0000_0000;
		weight_2e	<= 8'b0000_0000;
		weight_2f	<= 8'b0000_0000;
		weight_30	<= 8'b0000_0000;
		weight_31	<= 8'b0000_0000;
		weight_32	<= 8'b0000_0000;
		weight_33	<= 8'b0000_0000;
		weight_34	<= 8'b0000_0000;
		weight_35	<= 8'b0000_0000;
		weight_36	<= 8'b0000_0000;
		weight_37	<= 8'b0000_0000;
		weight_38	<= 8'b0000_0000;
		weight_39	<= 8'b0000_0000;
		weight_3a	<= 8'b0000_0000;
		weight_3b	<= 8'b0000_0000;
		weight_3c	<= 8'b0000_0000;
		weight_3d	<= 8'b0000_0000;
		weight_3e	<= 8'b0000_0000;
		weight_3f	<= 8'b0000_0000;
		weight_40	<= 8'b0000_0000;
		weight_41	<= 8'b0000_0000;
		weight_42	<= 8'b0000_0000;
		weight_43	<= 8'b0000_0000;
		weight_44	<= 8'b0000_0000;
		weight_45	<= 8'b0000_0000;
		weight_46	<= 8'b0000_0000;
		weight_47	<= 8'b0000_0000;
		weight_48	<= 8'b0000_0000;
		weight_49	<= 8'b0000_0000;
		weight_4a	<= 8'b0000_0000;
		weight_4b	<= 8'b0000_0000;
		weight_4c	<= 8'b0000_0000;
		weight_4d	<= 8'b0000_0000;
		weight_4e	<= 8'b0000_0000;
		weight_4f	<= 8'b0000_0000;
		weight_50	<= 8'b0000_0000;
		weight_51	<= 8'b0000_0000;
		weight_52	<= 8'b0000_0000;
		weight_53	<= 8'b0000_0000;
		weight_54	<= 8'b0000_0000;
		weight_55	<= 8'b0000_0000;
		weight_56	<= 8'b0000_0000;
		weight_57	<= 8'b0000_0000;
		weight_58	<= 8'b0000_0000;
		weight_59	<= 8'b0000_0000;
		weight_5a	<= 8'b0000_0000;
		weight_5b	<= 8'b0000_0000;
		weight_5c	<= 8'b0000_0000;
		weight_5d	<= 8'b0000_0000;
		weight_5e	<= 8'b0000_0000;
		weight_5f	<= 8'b0000_0000;
		weight_60	<= 8'b0000_0000;
		weight_61	<= 8'b0000_0000;
		weight_62	<= 8'b0000_0000;
		weight_63	<= 8'b0000_0000;
		weight_64	<= 8'b0000_0000;
		weight_65	<= 8'b0000_0000;
		weight_66	<= 8'b0000_0000;
		weight_67	<= 8'b0000_0000;
		weight_68	<= 8'b0000_0000;
		weight_69	<= 8'b0000_0000;
		weight_6a	<= 8'b0000_0000;
		weight_6b	<= 8'b0000_0000;
		weight_6c	<= 8'b0000_0000;
		weight_6d	<= 8'b0000_0000;
		weight_6e	<= 8'b0000_0000;
		weight_6f	<= 8'b0000_0000;
		weight_70	<= 8'b0000_0000;
		weight_71	<= 8'b0000_0000;
		weight_72	<= 8'b0000_0000;
		weight_73	<= 8'b0000_0000;
		weight_74	<= 8'b0000_0000;
		weight_75	<= 8'b0000_0000;
		weight_76	<= 8'b0000_0000;
		weight_77	<= 8'b0000_0000;
		weight_78	<= 8'b0000_0000;
		weight_79	<= 8'b0000_0000;
		weight_7a	<= 8'b0000_0000;
		weight_7b	<= 8'b0000_0000;
		weight_7c	<= 8'b0000_0000;
		weight_7d	<= 8'b0000_0000;
		weight_7e	<= 8'b0000_0000;
		weight_7f	<= 8'b0000_0000;
		weight_80	<= 8'b0000_0000;
		weight_81	<= 8'b0000_0000;
		weight_82	<= 8'b0000_0000;
		weight_83	<= 8'b0000_0000;
		weight_84	<= 8'b0000_0000;
		weight_85	<= 8'b0000_0000;
		weight_86	<= 8'b0000_0000;
		weight_87	<= 8'b0000_0000;
		weight_88	<= 8'b0000_0000;
		weight_89	<= 8'b0000_0000;
		weight_8a	<= 8'b0000_0000;
		weight_8b	<= 8'b0000_0000;
		weight_8c	<= 8'b0000_0000;
		weight_8d	<= 8'b0000_0000;
		weight_8e	<= 8'b0000_0000;
		weight_8f	<= 8'b0000_0000;
		weight_90	<= 8'b0000_0000;
		weight_91	<= 8'b0000_0000;
		weight_92	<= 8'b0000_0000;
		weight_93	<= 8'b0000_0000;
		weight_94	<= 8'b0000_0000;
		weight_95	<= 8'b0000_0000;
		weight_96	<= 8'b0000_0000;
		weight_97	<= 8'b0000_0000;
		weight_98	<= 8'b0000_0000;
		weight_99	<= 8'b0000_0000;
		weight_9a	<= 8'b0000_0000;
		weight_9b	<= 8'b0000_0000;
		weight_9c	<= 8'b0000_0000;
		weight_9d	<= 8'b0000_0000;
		weight_9e	<= 8'b0000_0000;
		weight_9f	<= 8'b0000_0000;
		weight_a0	<= 8'b0000_0000;
		weight_a1	<= 8'b0000_0000;
		weight_a2	<= 8'b0000_0000;
		weight_a3	<= 8'b0000_0000;
		weight_a4	<= 8'b0000_0000;
		weight_a5	<= 8'b0000_0000;
		weight_a6	<= 8'b0000_0000;
		weight_a7	<= 8'b0000_0000;
		weight_a8	<= 8'b0000_0000;
		weight_a9	<= 8'b0000_0000;
		weight_aa	<= 8'b0000_0000;
		weight_ab	<= 8'b0000_0000;
		weight_ac	<= 8'b0000_0000;
		weight_ad	<= 8'b0000_0000;
		weight_ae	<= 8'b0000_0000;
		weight_af	<= 8'b0000_0000;
		weight_b0	<= 8'b0000_0000;
		weight_b1	<= 8'b0000_0000;
		weight_b2	<= 8'b0000_0000;
		weight_b3	<= 8'b0000_0000;
		weight_b4	<= 8'b0000_0000;
		weight_b5	<= 8'b0000_0000;
		weight_b6	<= 8'b0000_0000;
		weight_b7	<= 8'b0000_0000;
		weight_b8	<= 8'b0000_0000;
		weight_b9	<= 8'b0000_0000;
		weight_ba	<= 8'b0000_0000;
		weight_bb	<= 8'b0000_0000;
		weight_bc	<= 8'b0000_0000;
		weight_bd	<= 8'b0000_0000;
		weight_be	<= 8'b0000_0000;
		weight_bf	<= 8'b0000_0000;
		weight_c0	<= 8'b0000_0000;
		weight_c1	<= 8'b0000_0000;
		weight_c2	<= 8'b0000_0000;
		weight_c3	<= 8'b0000_0000;
		weight_c4	<= 8'b0000_0000;
		weight_c5	<= 8'b0000_0000;
		weight_c6	<= 8'b0000_0000;
		weight_c7	<= 8'b0000_0000;
		weight_c8	<= 8'b0000_0000;
		weight_c9	<= 8'b0000_0000;
		weight_ca	<= 8'b0000_0000;
		weight_cb	<= 8'b0000_0000;
		weight_cc	<= 8'b0000_0000;
		weight_cd	<= 8'b0000_0000;
		weight_ce	<= 8'b0000_0000;
		weight_cf	<= 8'b0000_0000;
		weight_d0	<= 8'b0000_0000;
		weight_d1	<= 8'b0000_0000;
		weight_d2	<= 8'b0000_0000;
		weight_d3	<= 8'b0000_0000;
		weight_d4	<= 8'b0000_0000;
		weight_d5	<= 8'b0000_0000;
		weight_d6	<= 8'b0000_0000;
		weight_d7	<= 8'b0000_0000;
		weight_d8	<= 8'b0000_0000;
		weight_d9	<= 8'b0000_0000;
		weight_da	<= 8'b0000_0000;
		weight_db	<= 8'b0000_0000;
		weight_dc	<= 8'b0000_0000;
		weight_dd	<= 8'b0000_0000;
		weight_de	<= 8'b0000_0000;
		weight_df	<= 8'b0000_0000;
		weight_e0	<= 8'b0000_0000;
		weight_e1	<= 8'b0000_0000;
		weight_e2	<= 8'b0000_0000;
		weight_e3	<= 8'b0000_0000;
		weight_e4	<= 8'b0000_0000;
		weight_e5	<= 8'b0000_0000;
		weight_e6	<= 8'b0000_0000;
		weight_e7	<= 8'b0000_0000;
		weight_e8	<= 8'b0000_0000;
		weight_e9	<= 8'b0000_0000;
		weight_ea	<= 8'b0000_0000;
		weight_eb	<= 8'b0000_0000;
		weight_ec	<= 8'b0000_0000;
		weight_ed	<= 8'b0000_0000;
		weight_ee	<= 8'b0000_0000;
		weight_ef	<= 8'b0000_0000;
		weight_f0	<= 8'b0000_0000;
		weight_f1	<= 8'b0000_0000;
		weight_f2	<= 8'b0000_0000;
		weight_f3	<= 8'b0000_0000;
		weight_f4	<= 8'b0000_0000;
		weight_f5	<= 8'b0000_0000;
		weight_f6	<= 8'b0000_0000;
		weight_f7	<= 8'b0000_0000;
		weight_f8	<= 8'b0000_0000;
		weight_f9	<= 8'b0000_0000;
		weight_fa	<= 8'b0000_0000;
		weight_fb	<= 8'b0000_0000;
		weight_fc	<= 8'b0000_0000;
		weight_fd	<= 8'b0000_0000;
		weight_fe	<= 8'b0000_0000;
		weight_ff	<= 8'b0000_0000;
    end
    else if(in_valid)
    begin
        weight_00	<= w_00;
        weight_01	<= w_01;
        weight_02	<= w_02;
        weight_03	<= w_03;
        weight_04	<= w_04;
        weight_05	<= w_05;
        weight_06	<= w_06;
        weight_07	<= w_07;
        weight_08	<= w_08;
        weight_09	<= w_09;
        weight_0a	<= w_0a;
        weight_0b	<= w_0b;
        weight_0c	<= w_0c;
        weight_0d	<= w_0d;
        weight_0e	<= w_0e;
        weight_0f	<= w_0f;
        weight_10	<= w_10;
        weight_11	<= w_11;
        weight_12	<= w_12;
        weight_13	<= w_13;
        weight_14	<= w_14;
        weight_15	<= w_15;
        weight_16	<= w_16;
        weight_17	<= w_17;
        weight_18	<= w_18;
        weight_19	<= w_19;
        weight_1a	<= w_1a;
        weight_1b	<= w_1b;
        weight_1c	<= w_1c;
        weight_1d	<= w_1d;
        weight_1e	<= w_1e;
        weight_1f	<= w_1f;
        weight_20	<= w_20;
        weight_21	<= w_21;
        weight_22	<= w_22;
        weight_23	<= w_23;
        weight_24	<= w_24;
        weight_25	<= w_25;
        weight_26	<= w_26;
        weight_27	<= w_27;
        weight_28	<= w_28;
        weight_29	<= w_29;
        weight_2a	<= w_2a;
        weight_2b	<= w_2b;
        weight_2c	<= w_2c;
        weight_2d	<= w_2d;
        weight_2e	<= w_2e;
        weight_2f	<= w_2f;
        weight_30	<= w_30;
        weight_31	<= w_31;
        weight_32	<= w_32;
        weight_33	<= w_33;
        weight_34	<= w_34;
        weight_35	<= w_35;
        weight_36	<= w_36;
        weight_37	<= w_37;
        weight_38	<= w_38;
        weight_39	<= w_39;
        weight_3a	<= w_3a;
        weight_3b	<= w_3b;
        weight_3c	<= w_3c;
        weight_3d	<= w_3d;
        weight_3e	<= w_3e;
        weight_3f	<= w_3f;
        weight_40	<= w_40;
        weight_41	<= w_41;
        weight_42	<= w_42;
        weight_43	<= w_43;
        weight_44	<= w_44;
        weight_45	<= w_45;
        weight_46	<= w_46;
        weight_47	<= w_47;
        weight_48	<= w_48;
        weight_49	<= w_49;
        weight_4a	<= w_4a;
        weight_4b	<= w_4b;
        weight_4c	<= w_4c;
        weight_4d	<= w_4d;
        weight_4e	<= w_4e;
        weight_4f	<= w_4f;
        weight_50	<= w_50;
        weight_51	<= w_51;
        weight_52	<= w_52;
        weight_53	<= w_53;
        weight_54	<= w_54;
        weight_55	<= w_55;
        weight_56	<= w_56;
        weight_57	<= w_57;
        weight_58	<= w_58;
        weight_59	<= w_59;
        weight_5a	<= w_5a;
        weight_5b	<= w_5b;
        weight_5c	<= w_5c;
        weight_5d	<= w_5d;
        weight_5e	<= w_5e;
        weight_5f	<= w_5f;
        weight_60	<= w_60;
        weight_61	<= w_61;
        weight_62	<= w_62;
        weight_63	<= w_63;
        weight_64	<= w_64;
        weight_65	<= w_65;
        weight_66	<= w_66;
        weight_67	<= w_67;
        weight_68	<= w_68;
        weight_69	<= w_69;
        weight_6a	<= w_6a;
        weight_6b	<= w_6b;
        weight_6c	<= w_6c;
        weight_6d	<= w_6d;
        weight_6e	<= w_6e;
        weight_6f	<= w_6f;
        weight_70	<= w_70;
        weight_71	<= w_71;
        weight_72	<= w_72;
        weight_73	<= w_73;
        weight_74	<= w_74;
        weight_75	<= w_75;
        weight_76	<= w_76;
        weight_77	<= w_77;
        weight_78	<= w_78;
        weight_79	<= w_79;
        weight_7a	<= w_7a;
        weight_7b	<= w_7b;
        weight_7c	<= w_7c;
        weight_7d	<= w_7d;
        weight_7e	<= w_7e;
        weight_7f	<= w_7f;
        weight_80	<= w_80;
        weight_81	<= w_81;
        weight_82	<= w_82;
        weight_83	<= w_83;
        weight_84	<= w_84;
        weight_85	<= w_85;
        weight_86	<= w_86;
        weight_87	<= w_87;
        weight_88	<= w_88;
        weight_89	<= w_89;
        weight_8a	<= w_8a;
        weight_8b	<= w_8b;
        weight_8c	<= w_8c;
        weight_8d	<= w_8d;
        weight_8e	<= w_8e;
        weight_8f	<= w_8f;
        weight_90	<= w_90;
        weight_91	<= w_91;
        weight_92	<= w_92;
        weight_93	<= w_93;
        weight_94	<= w_94;
        weight_95	<= w_95;
        weight_96	<= w_96;
        weight_97	<= w_97;
        weight_98	<= w_98;
        weight_99	<= w_99;
        weight_9a	<= w_9a;
        weight_9b	<= w_9b;
        weight_9c	<= w_9c;
        weight_9d	<= w_9d;
        weight_9e	<= w_9e;
        weight_9f	<= w_9f;
        weight_a0	<= w_a0;
        weight_a1	<= w_a1;
        weight_a2	<= w_a2;
        weight_a3	<= w_a3;
        weight_a4	<= w_a4;
        weight_a5	<= w_a5;
        weight_a6	<= w_a6;
        weight_a7	<= w_a7;
        weight_a8	<= w_a8;
        weight_a9	<= w_a9;
        weight_aa	<= w_aa;
        weight_ab	<= w_ab;
        weight_ac	<= w_ac;
        weight_ad	<= w_ad;
        weight_ae	<= w_ae;
        weight_af	<= w_af;
        weight_b0	<= w_b0;
        weight_b1	<= w_b1;
        weight_b2	<= w_b2;
        weight_b3	<= w_b3;
        weight_b4	<= w_b4;
        weight_b5	<= w_b5;
        weight_b6	<= w_b6;
        weight_b7	<= w_b7;
        weight_b8	<= w_b8;
        weight_b9	<= w_b9;
        weight_ba	<= w_ba;
        weight_bb	<= w_bb;
        weight_bc	<= w_bc;
        weight_bd	<= w_bd;
        weight_be	<= w_be;
        weight_bf	<= w_bf;
        weight_c0	<= w_c0;
        weight_c1	<= w_c1;
        weight_c2	<= w_c2;
        weight_c3	<= w_c3;
        weight_c4	<= w_c4;
        weight_c5	<= w_c5;
        weight_c6	<= w_c6;
        weight_c7	<= w_c7;
        weight_c8	<= w_c8;
        weight_c9	<= w_c9;
        weight_ca	<= w_ca;
        weight_cb	<= w_cb;
        weight_cc	<= w_cc;
        weight_cd	<= w_cd;
        weight_ce	<= w_ce;
        weight_cf	<= w_cf;
        weight_d0	<= w_d0;
        weight_d1	<= w_d1;
        weight_d2	<= w_d2;
        weight_d3	<= w_d3;
        weight_d4	<= w_d4;
        weight_d5	<= w_d5;
        weight_d6	<= w_d6;
        weight_d7	<= w_d7;
        weight_d8	<= w_d8;
        weight_d9	<= w_d9;
        weight_da	<= w_da;
        weight_db	<= w_db;
        weight_dc	<= w_dc;
        weight_dd	<= w_dd;
        weight_de	<= w_de;
        weight_df	<= w_df;
        weight_e0	<= w_e0;
        weight_e1	<= w_e1;
        weight_e2	<= w_e2;
        weight_e3	<= w_e3;
        weight_e4	<= w_e4;
        weight_e5	<= w_e5;
        weight_e6	<= w_e6;
        weight_e7	<= w_e7;
        weight_e8	<= w_e8;
        weight_e9	<= w_e9;
        weight_ea	<= w_ea;
        weight_eb	<= w_eb;
        weight_ec	<= w_ec;
        weight_ed	<= w_ed;
        weight_ee	<= w_ee;
        weight_ef	<= w_ef;
        weight_f0	<= w_f0;
        weight_f1	<= w_f1;
        weight_f2	<= w_f2;
        weight_f3	<= w_f3;
        weight_f4	<= w_f4;
        weight_f5	<= w_f5;
        weight_f6	<= w_f6;
        weight_f7	<= w_f7;
        weight_f8	<= w_f8;
        weight_f9	<= w_f9;
        weight_fa	<= w_fa;
        weight_fb	<= w_fb;
        weight_fc	<= w_fc;
        weight_fd	<= w_fd;
        weight_fe	<= w_fe;
        weight_ff	<= w_ff;
    end
end

reg [7:0] input_mask_0;
reg [7:0] input_mask_1;
reg [7:0] input_mask_2;
reg [7:0] input_mask_3;
reg [7:0] input_mask_4;
reg [7:0] input_mask_5;
reg [7:0] input_mask_6;
reg [7:0] input_mask_7;
reg [7:0] input_mask_8;
reg [7:0] input_mask_9;
reg [7:0] input_mask_a;
reg [7:0] input_mask_b;
reg [7:0] input_mask_c;
reg [7:0] input_mask_d;
reg [7:0] input_mask_e;
reg [7:0] input_mask_f;

reg [7:0] current_input_0;
reg [7:0] current_input_1;
reg [7:0] current_input_2;
reg [7:0] current_input_3;
reg [7:0] current_input_4;
reg [7:0] current_input_5;
reg [7:0] current_input_6;
reg [7:0] current_input_7;
reg [7:0] current_input_8;
reg [7:0] current_input_9;
reg [7:0] current_input_a;
reg [7:0] current_input_b;
reg [7:0] current_input_c;
reg [7:0] current_input_d;
reg [7:0] current_input_e;
reg [7:0] current_input_f;

wire       input_0_zero_flag;
wire [2:0] input_0_lo_position;
wire       input_1_zero_flag;
wire [2:0] input_1_lo_position;
wire       input_2_zero_flag;
wire [2:0] input_2_lo_position;
wire       input_3_zero_flag;
wire [2:0] input_3_lo_position;
wire       input_4_zero_flag;
wire [2:0] input_4_lo_position;
wire       input_5_zero_flag;
wire [2:0] input_5_lo_position;
wire       input_6_zero_flag;
wire [2:0] input_6_lo_position;
wire       input_7_zero_flag;
wire [2:0] input_7_lo_position;
wire       input_8_zero_flag;
wire [2:0] input_8_lo_position;
wire       input_9_zero_flag;
wire [2:0] input_9_lo_position;
wire       input_a_zero_flag;
wire [2:0] input_a_lo_position;
wire       input_b_zero_flag;
wire [2:0] input_b_lo_position;
wire       input_c_zero_flag;
wire [2:0] input_c_lo_position;
wire       input_d_zero_flag;
wire [2:0] input_d_lo_position;
wire       input_e_zero_flag;
wire [2:0] input_e_lo_position;
wire       input_f_zero_flag;
wire [2:0] input_f_lo_position;

// Input Mask
always @(*) begin
    if(~ input_0_zero_flag) begin
        input_mask_0 <= ~(8'b1111_1111 << input_0_lo_position);
    end
    else begin
        input_mask_0 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_1_zero_flag) begin
        input_mask_1 <= ~(8'b1111_1111 << input_1_lo_position);
    end
    else begin
        input_mask_1 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_2_zero_flag) begin
        input_mask_2 <= ~(8'b1111_1111 << input_2_lo_position);
    end
    else begin
        input_mask_2 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_3_zero_flag) begin
        input_mask_3 <= ~(8'b1111_1111 << input_3_lo_position);
    end
    else begin
        input_mask_3 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_4_zero_flag) begin
        input_mask_4 <= ~(8'b1111_1111 << input_4_lo_position);
    end
    else begin
        input_mask_4 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_5_zero_flag) begin
        input_mask_5 <= ~(8'b1111_1111 << input_5_lo_position);
    end
    else begin
        input_mask_5 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_6_zero_flag) begin
        input_mask_6 <= ~(8'b1111_1111 << input_6_lo_position);
    end
    else begin
        input_mask_6 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_7_zero_flag) begin
        input_mask_7 <= ~(8'b1111_1111 << input_7_lo_position);
    end
    else begin
        input_mask_7 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_8_zero_flag) begin
        input_mask_8 <= ~(8'b1111_1111 << input_8_lo_position);
    end
    else begin
        input_mask_8 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_9_zero_flag) begin
        input_mask_9 <= ~(8'b1111_1111 << input_9_lo_position);
    end
    else begin
        input_mask_9 <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_a_zero_flag) begin
        input_mask_a <= ~(8'b1111_1111 << input_a_lo_position);
    end
    else begin
        input_mask_a <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_b_zero_flag) begin
        input_mask_b <= ~(8'b1111_1111 << input_b_lo_position);
    end
    else begin
        input_mask_b <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_c_zero_flag) begin
        input_mask_c <= ~(8'b1111_1111 << input_c_lo_position);
    end
    else begin
        input_mask_c <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_d_zero_flag) begin
        input_mask_d <= ~(8'b1111_1111 << input_d_lo_position);
    end
    else begin
        input_mask_d <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_e_zero_flag) begin
        input_mask_e <= ~(8'b1111_1111 << input_e_lo_position);
    end
    else begin
        input_mask_e <= 8'b0000_0000;
    end
end

always @(*) begin
    if(~ input_f_zero_flag) begin
        input_mask_f <= ~(8'b1111_1111 << input_f_lo_position);
    end
    else begin
        input_mask_f <= 8'b0000_0000;
    end
end

// Current Input
always @(posedge clk) begin
    if(input_valid) begin
        current_input_0 <= input_0;
    end
    else if(is_state_work == 1'b1) begin
        current_input_0 <= current_input_0 & input_mask_0;
    end
    else begin
        current_input_0 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_1 <= input_1;
    end
    else if (is_state_work == 1'b1) begin
        current_input_1  <= current_input_1 & input_mask_1;
    end
    else begin
        current_input_1 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_2 <= input_2;
    end
    else if (is_state_work == 1'b1) begin
        current_input_2  <= current_input_2 & input_mask_2;
    end
    else begin
        current_input_2 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_3 <= input_3;
    end
    else if (is_state_work == 1'b1) begin
        current_input_3  <= current_input_3 & input_mask_3;
    end
    else begin
        current_input_3 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_4 <= input_4;
    end
    else if (is_state_work == 1'b1) begin
        current_input_4  <= current_input_4 & input_mask_4;
    end
    else begin
        current_input_4 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_5 <= input_5;
    end
    else if (is_state_work == 1'b1) begin
        current_input_5  <= current_input_5 & input_mask_5;
    end
    else begin
        current_input_5 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_6 <= input_6;
    end
    else if (is_state_work == 1'b1) begin
        current_input_6  <= current_input_6 & input_mask_6;
    end
    else begin
        current_input_6 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_7 <= input_7;
    end
    else if (is_state_work == 1'b1) begin
        current_input_7  <= current_input_7 & input_mask_7;
    end
    else begin
        current_input_7 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_8 <= input_8;
    end
    else if (is_state_work == 1'b1) begin
        current_input_8  <= current_input_8 & input_mask_8;
    end
    else begin
        current_input_8 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_9 <= input_9;
    end
    else if (is_state_work == 1'b1) begin
        current_input_9  <= current_input_9 & input_mask_9;
    end
    else begin
        current_input_9 <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_a <= input_a;
    end
    else if (is_state_work == 1'b1) begin
        current_input_a  <= current_input_a & input_mask_a;
    end
    else begin
        current_input_a <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_b <= input_b;
    end
    else if (is_state_work == 1'b1) begin
        current_input_b  <= current_input_b & input_mask_b;
    end
    else begin
        current_input_b <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_c <= input_c;
    end
    else if (is_state_work == 1'b1) begin
        current_input_c  <= current_input_c & input_mask_c;
    end
    else begin
        current_input_c <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_d <= input_d;
    end
    else if (is_state_work == 1'b1) begin
        current_input_d  <= current_input_d & input_mask_d;
    end
    else begin
        current_input_d <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_e <= input_e;
    end
    else if (is_state_work == 1'b1) begin
        current_input_e  <= current_input_e & input_mask_e;
    end
    else begin
        current_input_e <= 8'b0000_0000;
    end
end

always @(posedge clk) begin
    if(input_valid) begin
        current_input_f <= input_f;
    end
    else if (is_state_work == 1'b1) begin
        current_input_f  <= current_input_f & input_mask_f;
    end
    else begin
        current_input_f <= 8'b0000_0000;
    end
end

//  
lopd lopd_input0(.in_data(current_input_0),
                   .zero_flag(input_0_zero_flag),
                   .lo_position(input_0_lo_position));

lopd lopd_input1(.in_data(current_input_1),
                   .zero_flag(input_1_zero_flag),
                   .lo_position(input_1_lo_position));

lopd lopd_input2(.in_data(current_input_2),
                   .zero_flag(input_2_zero_flag),
                   .lo_position(input_2_lo_position));

lopd lopd_input3(.in_data(current_input_3),
                   .zero_flag(input_3_zero_flag),
                   .lo_position(input_3_lo_position));

lopd lopd_input4(.in_data(current_input_4),
                   .zero_flag(input_4_zero_flag),
                   .lo_position(input_4_lo_position));

lopd lopd_input5(.in_data(current_input_5),
                   .zero_flag(input_5_zero_flag),
                   .lo_position(input_5_lo_position));

lopd lopd_input6(.in_data(current_input_6),
                   .zero_flag(input_6_zero_flag),
                   .lo_position(input_6_lo_position));

lopd lopd_input7(.in_data(current_input_7),
                   .zero_flag(input_7_zero_flag),
                   .lo_position(input_7_lo_position));

lopd lopd_input8(.in_data(current_input_8),
                   .zero_flag(input_8_zero_flag),
                   .lo_position(input_8_lo_position));

lopd lopd_input9(.in_data(current_input_9),
                   .zero_flag(input_9_zero_flag),
                   .lo_position(input_9_lo_position));

lopd lopd_inputa(.in_data(current_input_a),
                   .zero_flag(input_a_zero_flag),
                   .lo_position(input_a_lo_position));

lopd lopd_inputb(.in_data(current_input_b),
                   .zero_flag(input_b_zero_flag),
                   .lo_position(input_b_lo_position));

lopd lopd_inputc(.in_data(current_input_c),
                   .zero_flag(input_c_zero_flag),
                   .lo_position(input_c_lo_position));

lopd lopd_inputd(.in_data(current_input_d),
                   .zero_flag(input_d_zero_flag),
                   .lo_position(input_d_lo_position));

lopd lopd_inpute(.in_data(current_input_e),
                   .zero_flag(input_e_zero_flag),
                   .lo_position(input_e_lo_position));

lopd lopd_inputf(.in_data(current_input_f),
                   .zero_flag(input_f_zero_flag),
                   .lo_position(input_f_lo_position));

wire   group0_zero;
wire   group1_zero;
wire   group2_zero;
wire   group3_zero;
assign group0_zero = input_0_zero_flag & input_1_zero_flag & input_2_zero_flag & input_3_zero_flag;
assign group1_zero = input_4_zero_flag & input_5_zero_flag & input_6_zero_flag & input_7_zero_flag;
assign group2_zero = input_8_zero_flag & input_9_zero_flag & input_a_zero_flag & input_b_zero_flag;
assign group3_zero = input_c_zero_flag & input_d_zero_flag & input_e_zero_flag & input_f_zero_flag;

assign all_zeros = group0_zero & group1_zero & group2_zero & group3_zero;

always@(posedge clk)begin
    if(rst) begin
        all_zeros_iter1 <= 1'b0;
    end
    else if(is_state_done) begin
        all_zeros_iter1 <= 1'b0;
    end
    else if(is_state_work_iter0)begin
        all_zeros_iter1 <= all_zeros;
    end
    else begin
        all_zeros_iter1 <= 1'b0;
    end
end

always@(posedge clk)begin
    if(rst) begin
        all_zeros_iter2 <= 1'b0;
    end
    else begin
        all_zeros_iter2 <= all_zeros_iter1;
    end
end

assign weight_ext_00 = {{8{weight_00[7]}}, w_00};
assign weight_ext_01 = {{8{weight_01[7]}}, w_01};
assign weight_ext_02 = {{8{weight_02[7]}}, w_02};
assign weight_ext_03 = {{8{weight_03[7]}}, w_03};
assign weight_ext_04 = {{8{weight_04[7]}}, w_04};
assign weight_ext_05 = {{8{weight_05[7]}}, w_05};
assign weight_ext_06 = {{8{weight_06[7]}}, w_06};
assign weight_ext_07 = {{8{weight_07[7]}}, w_07};
assign weight_ext_08 = {{8{weight_08[7]}}, w_08};
assign weight_ext_09 = {{8{weight_09[7]}}, w_09};
assign weight_ext_0a = {{8{weight_0a[7]}}, w_0a};
assign weight_ext_0b = {{8{weight_0b[7]}}, w_0b};
assign weight_ext_0c = {{8{weight_0c[7]}}, w_0c};
assign weight_ext_0d = {{8{weight_0d[7]}}, w_0d};
assign weight_ext_0e = {{8{weight_0e[7]}}, w_0e};
assign weight_ext_0f = {{8{weight_0f[7]}}, w_0f};
assign weight_ext_10 = {{8{weight_10[7]}}, w_10};
assign weight_ext_11 = {{8{weight_11[7]}}, w_11};
assign weight_ext_12 = {{8{weight_12[7]}}, w_12};
assign weight_ext_13 = {{8{weight_13[7]}}, w_13};
assign weight_ext_14 = {{8{weight_14[7]}}, w_14};
assign weight_ext_15 = {{8{weight_15[7]}}, w_15};
assign weight_ext_16 = {{8{weight_16[7]}}, w_16};
assign weight_ext_17 = {{8{weight_17[7]}}, w_17};
assign weight_ext_18 = {{8{weight_18[7]}}, w_18};
assign weight_ext_19 = {{8{weight_19[7]}}, w_19};
assign weight_ext_1a = {{8{weight_1a[7]}}, w_1a};
assign weight_ext_1b = {{8{weight_1b[7]}}, w_1b};
assign weight_ext_1c = {{8{weight_1c[7]}}, w_1c};
assign weight_ext_1d = {{8{weight_1d[7]}}, w_1d};
assign weight_ext_1e = {{8{weight_1e[7]}}, w_1e};
assign weight_ext_1f = {{8{weight_1f[7]}}, w_1f};
assign weight_ext_20 = {{8{weight_20[7]}}, w_20};
assign weight_ext_21 = {{8{weight_21[7]}}, w_21};
assign weight_ext_22 = {{8{weight_22[7]}}, w_22};
assign weight_ext_23 = {{8{weight_23[7]}}, w_23};
assign weight_ext_24 = {{8{weight_24[7]}}, w_24};
assign weight_ext_25 = {{8{weight_25[7]}}, w_25};
assign weight_ext_26 = {{8{weight_26[7]}}, w_26};
assign weight_ext_27 = {{8{weight_27[7]}}, w_27};
assign weight_ext_28 = {{8{weight_28[7]}}, w_28};
assign weight_ext_29 = {{8{weight_29[7]}}, w_29};
assign weight_ext_2a = {{8{weight_2a[7]}}, w_2a};
assign weight_ext_2b = {{8{weight_2b[7]}}, w_2b};
assign weight_ext_2c = {{8{weight_2c[7]}}, w_2c};
assign weight_ext_2d = {{8{weight_2d[7]}}, w_2d};
assign weight_ext_2e = {{8{weight_2e[7]}}, w_2e};
assign weight_ext_2f = {{8{weight_2f[7]}}, w_2f};
assign weight_ext_30 = {{8{weight_30[7]}}, w_30};
assign weight_ext_31 = {{8{weight_31[7]}}, w_31};
assign weight_ext_32 = {{8{weight_32[7]}}, w_32};
assign weight_ext_33 = {{8{weight_33[7]}}, w_33};
assign weight_ext_34 = {{8{weight_34[7]}}, w_34};
assign weight_ext_35 = {{8{weight_35[7]}}, w_35};
assign weight_ext_36 = {{8{weight_36[7]}}, w_36};
assign weight_ext_37 = {{8{weight_37[7]}}, w_37};
assign weight_ext_38 = {{8{weight_38[7]}}, w_38};
assign weight_ext_39 = {{8{weight_39[7]}}, w_39};
assign weight_ext_3a = {{8{weight_3a[7]}}, w_3a};
assign weight_ext_3b = {{8{weight_3b[7]}}, w_3b};
assign weight_ext_3c = {{8{weight_3c[7]}}, w_3c};
assign weight_ext_3d = {{8{weight_3d[7]}}, w_3d};
assign weight_ext_3e = {{8{weight_3e[7]}}, w_3e};
assign weight_ext_3f = {{8{weight_3f[7]}}, w_3f};
assign weight_ext_40 = {{8{weight_40[7]}}, w_40};
assign weight_ext_41 = {{8{weight_41[7]}}, w_41};
assign weight_ext_42 = {{8{weight_42[7]}}, w_42};
assign weight_ext_43 = {{8{weight_43[7]}}, w_43};
assign weight_ext_44 = {{8{weight_44[7]}}, w_44};
assign weight_ext_45 = {{8{weight_45[7]}}, w_45};
assign weight_ext_46 = {{8{weight_46[7]}}, w_46};
assign weight_ext_47 = {{8{weight_47[7]}}, w_47};
assign weight_ext_48 = {{8{weight_48[7]}}, w_48};
assign weight_ext_49 = {{8{weight_49[7]}}, w_49};
assign weight_ext_4a = {{8{weight_4a[7]}}, w_4a};
assign weight_ext_4b = {{8{weight_4b[7]}}, w_4b};
assign weight_ext_4c = {{8{weight_4c[7]}}, w_4c};
assign weight_ext_4d = {{8{weight_4d[7]}}, w_4d};
assign weight_ext_4e = {{8{weight_4e[7]}}, w_4e};
assign weight_ext_4f = {{8{weight_4f[7]}}, w_4f};
assign weight_ext_50 = {{8{weight_50[7]}}, w_50};
assign weight_ext_51 = {{8{weight_51[7]}}, w_51};
assign weight_ext_52 = {{8{weight_52[7]}}, w_52};
assign weight_ext_53 = {{8{weight_53[7]}}, w_53};
assign weight_ext_54 = {{8{weight_54[7]}}, w_54};
assign weight_ext_55 = {{8{weight_55[7]}}, w_55};
assign weight_ext_56 = {{8{weight_56[7]}}, w_56};
assign weight_ext_57 = {{8{weight_57[7]}}, w_57};
assign weight_ext_58 = {{8{weight_58[7]}}, w_58};
assign weight_ext_59 = {{8{weight_59[7]}}, w_59};
assign weight_ext_5a = {{8{weight_5a[7]}}, w_5a};
assign weight_ext_5b = {{8{weight_5b[7]}}, w_5b};
assign weight_ext_5c = {{8{weight_5c[7]}}, w_5c};
assign weight_ext_5d = {{8{weight_5d[7]}}, w_5d};
assign weight_ext_5e = {{8{weight_5e[7]}}, w_5e};
assign weight_ext_5f = {{8{weight_5f[7]}}, w_5f};
assign weight_ext_60 = {{8{weight_60[7]}}, w_60};
assign weight_ext_61 = {{8{weight_61[7]}}, w_61};
assign weight_ext_62 = {{8{weight_62[7]}}, w_62};
assign weight_ext_63 = {{8{weight_63[7]}}, w_63};
assign weight_ext_64 = {{8{weight_64[7]}}, w_64};
assign weight_ext_65 = {{8{weight_65[7]}}, w_65};
assign weight_ext_66 = {{8{weight_66[7]}}, w_66};
assign weight_ext_67 = {{8{weight_67[7]}}, w_67};
assign weight_ext_68 = {{8{weight_68[7]}}, w_68};
assign weight_ext_69 = {{8{weight_69[7]}}, w_69};
assign weight_ext_6a = {{8{weight_6a[7]}}, w_6a};
assign weight_ext_6b = {{8{weight_6b[7]}}, w_6b};
assign weight_ext_6c = {{8{weight_6c[7]}}, w_6c};
assign weight_ext_6d = {{8{weight_6d[7]}}, w_6d};
assign weight_ext_6e = {{8{weight_6e[7]}}, w_6e};
assign weight_ext_6f = {{8{weight_6f[7]}}, w_6f};
assign weight_ext_70 = {{8{weight_70[7]}}, w_70};
assign weight_ext_71 = {{8{weight_71[7]}}, w_71};
assign weight_ext_72 = {{8{weight_72[7]}}, w_72};
assign weight_ext_73 = {{8{weight_73[7]}}, w_73};
assign weight_ext_74 = {{8{weight_74[7]}}, w_74};
assign weight_ext_75 = {{8{weight_75[7]}}, w_75};
assign weight_ext_76 = {{8{weight_76[7]}}, w_76};
assign weight_ext_77 = {{8{weight_77[7]}}, w_77};
assign weight_ext_78 = {{8{weight_78[7]}}, w_78};
assign weight_ext_79 = {{8{weight_79[7]}}, w_79};
assign weight_ext_7a = {{8{weight_7a[7]}}, w_7a};
assign weight_ext_7b = {{8{weight_7b[7]}}, w_7b};
assign weight_ext_7c = {{8{weight_7c[7]}}, w_7c};
assign weight_ext_7d = {{8{weight_7d[7]}}, w_7d};
assign weight_ext_7e = {{8{weight_7e[7]}}, w_7e};
assign weight_ext_7f = {{8{weight_7f[7]}}, w_7f};
assign weight_ext_80 = {{8{weight_80[7]}}, w_80};
assign weight_ext_81 = {{8{weight_81[7]}}, w_81};
assign weight_ext_82 = {{8{weight_82[7]}}, w_82};
assign weight_ext_83 = {{8{weight_83[7]}}, w_83};
assign weight_ext_84 = {{8{weight_84[7]}}, w_84};
assign weight_ext_85 = {{8{weight_85[7]}}, w_85};
assign weight_ext_86 = {{8{weight_86[7]}}, w_86};
assign weight_ext_87 = {{8{weight_87[7]}}, w_87};
assign weight_ext_88 = {{8{weight_88[7]}}, w_88};
assign weight_ext_89 = {{8{weight_89[7]}}, w_89};
assign weight_ext_8a = {{8{weight_8a[7]}}, w_8a};
assign weight_ext_8b = {{8{weight_8b[7]}}, w_8b};
assign weight_ext_8c = {{8{weight_8c[7]}}, w_8c};
assign weight_ext_8d = {{8{weight_8d[7]}}, w_8d};
assign weight_ext_8e = {{8{weight_8e[7]}}, w_8e};
assign weight_ext_8f = {{8{weight_8f[7]}}, w_8f};
assign weight_ext_90 = {{8{weight_90[7]}}, w_90};
assign weight_ext_91 = {{8{weight_91[7]}}, w_91};
assign weight_ext_92 = {{8{weight_92[7]}}, w_92};
assign weight_ext_93 = {{8{weight_93[7]}}, w_93};
assign weight_ext_94 = {{8{weight_94[7]}}, w_94};
assign weight_ext_95 = {{8{weight_95[7]}}, w_95};
assign weight_ext_96 = {{8{weight_96[7]}}, w_96};
assign weight_ext_97 = {{8{weight_97[7]}}, w_97};
assign weight_ext_98 = {{8{weight_98[7]}}, w_98};
assign weight_ext_99 = {{8{weight_99[7]}}, w_99};
assign weight_ext_9a = {{8{weight_9a[7]}}, w_9a};
assign weight_ext_9b = {{8{weight_9b[7]}}, w_9b};
assign weight_ext_9c = {{8{weight_9c[7]}}, w_9c};
assign weight_ext_9d = {{8{weight_9d[7]}}, w_9d};
assign weight_ext_9e = {{8{weight_9e[7]}}, w_9e};
assign weight_ext_9f = {{8{weight_9f[7]}}, w_9f};
assign weight_ext_a0 = {{8{weight_a0[7]}}, w_a0};
assign weight_ext_a1 = {{8{weight_a1[7]}}, w_a1};
assign weight_ext_a2 = {{8{weight_a2[7]}}, w_a2};
assign weight_ext_a3 = {{8{weight_a3[7]}}, w_a3};
assign weight_ext_a4 = {{8{weight_a4[7]}}, w_a4};
assign weight_ext_a5 = {{8{weight_a5[7]}}, w_a5};
assign weight_ext_a6 = {{8{weight_a6[7]}}, w_a6};
assign weight_ext_a7 = {{8{weight_a7[7]}}, w_a7};
assign weight_ext_a8 = {{8{weight_a8[7]}}, w_a8};
assign weight_ext_a9 = {{8{weight_a9[7]}}, w_a9};
assign weight_ext_aa = {{8{weight_aa[7]}}, w_aa};
assign weight_ext_ab = {{8{weight_ab[7]}}, w_ab};
assign weight_ext_ac = {{8{weight_ac[7]}}, w_ac};
assign weight_ext_ad = {{8{weight_ad[7]}}, w_ad};
assign weight_ext_ae = {{8{weight_ae[7]}}, w_ae};
assign weight_ext_af = {{8{weight_af[7]}}, w_af};
assign weight_ext_b0 = {{8{weight_b0[7]}}, w_b0};
assign weight_ext_b1 = {{8{weight_b1[7]}}, w_b1};
assign weight_ext_b2 = {{8{weight_b2[7]}}, w_b2};
assign weight_ext_b3 = {{8{weight_b3[7]}}, w_b3};
assign weight_ext_b4 = {{8{weight_b4[7]}}, w_b4};
assign weight_ext_b5 = {{8{weight_b5[7]}}, w_b5};
assign weight_ext_b6 = {{8{weight_b6[7]}}, w_b6};
assign weight_ext_b7 = {{8{weight_b7[7]}}, w_b7};
assign weight_ext_b8 = {{8{weight_b8[7]}}, w_b8};
assign weight_ext_b9 = {{8{weight_b9[7]}}, w_b9};
assign weight_ext_ba = {{8{weight_ba[7]}}, w_ba};
assign weight_ext_bb = {{8{weight_bb[7]}}, w_bb};
assign weight_ext_bc = {{8{weight_bc[7]}}, w_bc};
assign weight_ext_bd = {{8{weight_bd[7]}}, w_bd};
assign weight_ext_be = {{8{weight_be[7]}}, w_be};
assign weight_ext_bf = {{8{weight_bf[7]}}, w_bf};
assign weight_ext_c0 = {{8{weight_c0[7]}}, w_c0};
assign weight_ext_c1 = {{8{weight_c1[7]}}, w_c1};
assign weight_ext_c2 = {{8{weight_c2[7]}}, w_c2};
assign weight_ext_c3 = {{8{weight_c3[7]}}, w_c3};
assign weight_ext_c4 = {{8{weight_c4[7]}}, w_c4};
assign weight_ext_c5 = {{8{weight_c5[7]}}, w_c5};
assign weight_ext_c6 = {{8{weight_c6[7]}}, w_c6};
assign weight_ext_c7 = {{8{weight_c7[7]}}, w_c7};
assign weight_ext_c8 = {{8{weight_c8[7]}}, w_c8};
assign weight_ext_c9 = {{8{weight_c9[7]}}, w_c9};
assign weight_ext_ca = {{8{weight_ca[7]}}, w_ca};
assign weight_ext_cb = {{8{weight_cb[7]}}, w_cb};
assign weight_ext_cc = {{8{weight_cc[7]}}, w_cc};
assign weight_ext_cd = {{8{weight_cd[7]}}, w_cd};
assign weight_ext_ce = {{8{weight_ce[7]}}, w_ce};
assign weight_ext_cf = {{8{weight_cf[7]}}, w_cf};
assign weight_ext_d0 = {{8{weight_d0[7]}}, w_d0};
assign weight_ext_d1 = {{8{weight_d1[7]}}, w_d1};
assign weight_ext_d2 = {{8{weight_d2[7]}}, w_d2};
assign weight_ext_d3 = {{8{weight_d3[7]}}, w_d3};
assign weight_ext_d4 = {{8{weight_d4[7]}}, w_d4};
assign weight_ext_d5 = {{8{weight_d5[7]}}, w_d5};
assign weight_ext_d6 = {{8{weight_d6[7]}}, w_d6};
assign weight_ext_d7 = {{8{weight_d7[7]}}, w_d7};
assign weight_ext_d8 = {{8{weight_d8[7]}}, w_d8};
assign weight_ext_d9 = {{8{weight_d9[7]}}, w_d9};
assign weight_ext_da = {{8{weight_da[7]}}, w_da};
assign weight_ext_db = {{8{weight_db[7]}}, w_db};
assign weight_ext_dc = {{8{weight_dc[7]}}, w_dc};
assign weight_ext_dd = {{8{weight_dd[7]}}, w_dd};
assign weight_ext_de = {{8{weight_de[7]}}, w_de};
assign weight_ext_df = {{8{weight_df[7]}}, w_df};
assign weight_ext_e0 = {{8{weight_e0[7]}}, w_e0};
assign weight_ext_e1 = {{8{weight_e1[7]}}, w_e1};
assign weight_ext_e2 = {{8{weight_e2[7]}}, w_e2};
assign weight_ext_e3 = {{8{weight_e3[7]}}, w_e3};
assign weight_ext_e4 = {{8{weight_e4[7]}}, w_e4};
assign weight_ext_e5 = {{8{weight_e5[7]}}, w_e5};
assign weight_ext_e6 = {{8{weight_e6[7]}}, w_e6};
assign weight_ext_e7 = {{8{weight_e7[7]}}, w_e7};
assign weight_ext_e8 = {{8{weight_e8[7]}}, w_e8};
assign weight_ext_e9 = {{8{weight_e9[7]}}, w_e9};
assign weight_ext_ea = {{8{weight_ea[7]}}, w_ea};
assign weight_ext_eb = {{8{weight_eb[7]}}, w_eb};
assign weight_ext_ec = {{8{weight_ec[7]}}, w_ec};
assign weight_ext_ed = {{8{weight_ed[7]}}, w_ed};
assign weight_ext_ee = {{8{weight_ee[7]}}, w_ee};
assign weight_ext_ef = {{8{weight_ef[7]}}, w_ef};
assign weight_ext_f0 = {{8{weight_f0[7]}}, w_f0};
assign weight_ext_f1 = {{8{weight_f1[7]}}, w_f1};
assign weight_ext_f2 = {{8{weight_f2[7]}}, w_f2};
assign weight_ext_f3 = {{8{weight_f3[7]}}, w_f3};
assign weight_ext_f4 = {{8{weight_f4[7]}}, w_f4};
assign weight_ext_f5 = {{8{weight_f5[7]}}, w_f5};
assign weight_ext_f6 = {{8{weight_f6[7]}}, w_f6};
assign weight_ext_f7 = {{8{weight_f7[7]}}, w_f7};
assign weight_ext_f8 = {{8{weight_f8[7]}}, w_f8};
assign weight_ext_f9 = {{8{weight_f9[7]}}, w_f9};
assign weight_ext_fa = {{8{weight_fa[7]}}, w_fa};
assign weight_ext_fb = {{8{weight_fb[7]}}, w_fb};
assign weight_ext_fc = {{8{weight_fc[7]}}, w_fc};
assign weight_ext_fd = {{8{weight_fd[7]}}, w_fd};
assign weight_ext_fe = {{8{weight_fe[7]}}, w_fe};
assign weight_ext_ff = {{8{weight_ff[7]}}, w_ff};

assign shift_result_00 = input_0_zero_flag ? 0 : (weight_ext_00 << input_0_lo_position);
assign shift_result_01 = input_1_zero_flag ? 0 : (weight_ext_01 << input_1_lo_position);
assign shift_result_02 = input_2_zero_flag ? 0 : (weight_ext_02 << input_2_lo_position);
assign shift_result_03 = input_3_zero_flag ? 0 : (weight_ext_03 << input_3_lo_position);
assign shift_result_04 = input_4_zero_flag ? 0 : (weight_ext_04 << input_4_lo_position);
assign shift_result_05 = input_5_zero_flag ? 0 : (weight_ext_05 << input_5_lo_position);
assign shift_result_06 = input_6_zero_flag ? 0 : (weight_ext_06 << input_6_lo_position);
assign shift_result_07 = input_7_zero_flag ? 0 : (weight_ext_07 << input_7_lo_position);
assign shift_result_08 = input_8_zero_flag ? 0 : (weight_ext_08 << input_8_lo_position);
assign shift_result_09 = input_9_zero_flag ? 0 : (weight_ext_09 << input_9_lo_position);
assign shift_result_0a = input_a_zero_flag ? 0 : (weight_ext_0a << input_a_lo_position);
assign shift_result_0b = input_b_zero_flag ? 0 : (weight_ext_0b << input_b_lo_position);
assign shift_result_0c = input_c_zero_flag ? 0 : (weight_ext_0c << input_c_lo_position);
assign shift_result_0d = input_d_zero_flag ? 0 : (weight_ext_0d << input_d_lo_position);
assign shift_result_0e = input_e_zero_flag ? 0 : (weight_ext_0e << input_e_lo_position);
assign shift_result_0f = input_f_zero_flag ? 0 : (weight_ext_0f << input_f_lo_position);
assign shift_result_10 = input_0_zero_flag ? 0 : (weight_ext_10 << input_0_lo_position);
assign shift_result_11 = input_1_zero_flag ? 0 : (weight_ext_11 << input_1_lo_position);
assign shift_result_12 = input_2_zero_flag ? 0 : (weight_ext_12 << input_2_lo_position);
assign shift_result_13 = input_3_zero_flag ? 0 : (weight_ext_13 << input_3_lo_position);
assign shift_result_14 = input_4_zero_flag ? 0 : (weight_ext_14 << input_4_lo_position);
assign shift_result_15 = input_5_zero_flag ? 0 : (weight_ext_15 << input_5_lo_position);
assign shift_result_16 = input_6_zero_flag ? 0 : (weight_ext_16 << input_6_lo_position);
assign shift_result_17 = input_7_zero_flag ? 0 : (weight_ext_17 << input_7_lo_position);
assign shift_result_18 = input_8_zero_flag ? 0 : (weight_ext_18 << input_8_lo_position);
assign shift_result_19 = input_9_zero_flag ? 0 : (weight_ext_19 << input_9_lo_position);
assign shift_result_1a = input_a_zero_flag ? 0 : (weight_ext_1a << input_a_lo_position);
assign shift_result_1b = input_b_zero_flag ? 0 : (weight_ext_1b << input_b_lo_position);
assign shift_result_1c = input_c_zero_flag ? 0 : (weight_ext_1c << input_c_lo_position);
assign shift_result_1d = input_d_zero_flag ? 0 : (weight_ext_1d << input_d_lo_position);
assign shift_result_1e = input_e_zero_flag ? 0 : (weight_ext_1e << input_e_lo_position);
assign shift_result_1f = input_f_zero_flag ? 0 : (weight_ext_1f << input_f_lo_position);
assign shift_result_20 = input_0_zero_flag ? 0 : (weight_ext_20 << input_0_lo_position);
assign shift_result_21 = input_1_zero_flag ? 0 : (weight_ext_21 << input_1_lo_position);
assign shift_result_22 = input_2_zero_flag ? 0 : (weight_ext_22 << input_2_lo_position);
assign shift_result_23 = input_3_zero_flag ? 0 : (weight_ext_23 << input_3_lo_position);
assign shift_result_24 = input_4_zero_flag ? 0 : (weight_ext_24 << input_4_lo_position);
assign shift_result_25 = input_5_zero_flag ? 0 : (weight_ext_25 << input_5_lo_position);
assign shift_result_26 = input_6_zero_flag ? 0 : (weight_ext_26 << input_6_lo_position);
assign shift_result_27 = input_7_zero_flag ? 0 : (weight_ext_27 << input_7_lo_position);
assign shift_result_28 = input_8_zero_flag ? 0 : (weight_ext_28 << input_8_lo_position);
assign shift_result_29 = input_9_zero_flag ? 0 : (weight_ext_29 << input_9_lo_position);
assign shift_result_2a = input_a_zero_flag ? 0 : (weight_ext_2a << input_a_lo_position);
assign shift_result_2b = input_b_zero_flag ? 0 : (weight_ext_2b << input_b_lo_position);
assign shift_result_2c = input_c_zero_flag ? 0 : (weight_ext_2c << input_c_lo_position);
assign shift_result_2d = input_d_zero_flag ? 0 : (weight_ext_2d << input_d_lo_position);
assign shift_result_2e = input_e_zero_flag ? 0 : (weight_ext_2e << input_e_lo_position);
assign shift_result_2f = input_f_zero_flag ? 0 : (weight_ext_2f << input_f_lo_position);
assign shift_result_30 = input_0_zero_flag ? 0 : (weight_ext_30 << input_0_lo_position);
assign shift_result_31 = input_1_zero_flag ? 0 : (weight_ext_31 << input_1_lo_position);
assign shift_result_32 = input_2_zero_flag ? 0 : (weight_ext_32 << input_2_lo_position);
assign shift_result_33 = input_3_zero_flag ? 0 : (weight_ext_33 << input_3_lo_position);
assign shift_result_34 = input_4_zero_flag ? 0 : (weight_ext_34 << input_4_lo_position);
assign shift_result_35 = input_5_zero_flag ? 0 : (weight_ext_35 << input_5_lo_position);
assign shift_result_36 = input_6_zero_flag ? 0 : (weight_ext_36 << input_6_lo_position);
assign shift_result_37 = input_7_zero_flag ? 0 : (weight_ext_37 << input_7_lo_position);
assign shift_result_38 = input_8_zero_flag ? 0 : (weight_ext_38 << input_8_lo_position);
assign shift_result_39 = input_9_zero_flag ? 0 : (weight_ext_39 << input_9_lo_position);
assign shift_result_3a = input_a_zero_flag ? 0 : (weight_ext_3a << input_a_lo_position);
assign shift_result_3b = input_b_zero_flag ? 0 : (weight_ext_3b << input_b_lo_position);
assign shift_result_3c = input_c_zero_flag ? 0 : (weight_ext_3c << input_c_lo_position);
assign shift_result_3d = input_d_zero_flag ? 0 : (weight_ext_3d << input_d_lo_position);
assign shift_result_3e = input_e_zero_flag ? 0 : (weight_ext_3e << input_e_lo_position);
assign shift_result_3f = input_f_zero_flag ? 0 : (weight_ext_3f << input_f_lo_position);
assign shift_result_40 = input_0_zero_flag ? 0 : (weight_ext_40 << input_0_lo_position);
assign shift_result_41 = input_1_zero_flag ? 0 : (weight_ext_41 << input_1_lo_position);
assign shift_result_42 = input_2_zero_flag ? 0 : (weight_ext_42 << input_2_lo_position);
assign shift_result_43 = input_3_zero_flag ? 0 : (weight_ext_43 << input_3_lo_position);
assign shift_result_44 = input_4_zero_flag ? 0 : (weight_ext_44 << input_4_lo_position);
assign shift_result_45 = input_5_zero_flag ? 0 : (weight_ext_45 << input_5_lo_position);
assign shift_result_46 = input_6_zero_flag ? 0 : (weight_ext_46 << input_6_lo_position);
assign shift_result_47 = input_7_zero_flag ? 0 : (weight_ext_47 << input_7_lo_position);
assign shift_result_48 = input_8_zero_flag ? 0 : (weight_ext_48 << input_8_lo_position);
assign shift_result_49 = input_9_zero_flag ? 0 : (weight_ext_49 << input_9_lo_position);
assign shift_result_4a = input_a_zero_flag ? 0 : (weight_ext_4a << input_a_lo_position);
assign shift_result_4b = input_b_zero_flag ? 0 : (weight_ext_4b << input_b_lo_position);
assign shift_result_4c = input_c_zero_flag ? 0 : (weight_ext_4c << input_c_lo_position);
assign shift_result_4d = input_d_zero_flag ? 0 : (weight_ext_4d << input_d_lo_position);
assign shift_result_4e = input_e_zero_flag ? 0 : (weight_ext_4e << input_e_lo_position);
assign shift_result_4f = input_f_zero_flag ? 0 : (weight_ext_4f << input_f_lo_position);
assign shift_result_50 = input_0_zero_flag ? 0 : (weight_ext_50 << input_0_lo_position);
assign shift_result_51 = input_1_zero_flag ? 0 : (weight_ext_51 << input_1_lo_position);
assign shift_result_52 = input_2_zero_flag ? 0 : (weight_ext_52 << input_2_lo_position);
assign shift_result_53 = input_3_zero_flag ? 0 : (weight_ext_53 << input_3_lo_position);
assign shift_result_54 = input_4_zero_flag ? 0 : (weight_ext_54 << input_4_lo_position);
assign shift_result_55 = input_5_zero_flag ? 0 : (weight_ext_55 << input_5_lo_position);
assign shift_result_56 = input_6_zero_flag ? 0 : (weight_ext_56 << input_6_lo_position);
assign shift_result_57 = input_7_zero_flag ? 0 : (weight_ext_57 << input_7_lo_position);
assign shift_result_58 = input_8_zero_flag ? 0 : (weight_ext_58 << input_8_lo_position);
assign shift_result_59 = input_9_zero_flag ? 0 : (weight_ext_59 << input_9_lo_position);
assign shift_result_5a = input_a_zero_flag ? 0 : (weight_ext_5a << input_a_lo_position);
assign shift_result_5b = input_b_zero_flag ? 0 : (weight_ext_5b << input_b_lo_position);
assign shift_result_5c = input_c_zero_flag ? 0 : (weight_ext_5c << input_c_lo_position);
assign shift_result_5d = input_d_zero_flag ? 0 : (weight_ext_5d << input_d_lo_position);
assign shift_result_5e = input_e_zero_flag ? 0 : (weight_ext_5e << input_e_lo_position);
assign shift_result_5f = input_f_zero_flag ? 0 : (weight_ext_5f << input_f_lo_position);
assign shift_result_60 = input_0_zero_flag ? 0 : (weight_ext_60 << input_0_lo_position);
assign shift_result_61 = input_1_zero_flag ? 0 : (weight_ext_61 << input_1_lo_position);
assign shift_result_62 = input_2_zero_flag ? 0 : (weight_ext_62 << input_2_lo_position);
assign shift_result_63 = input_3_zero_flag ? 0 : (weight_ext_63 << input_3_lo_position);
assign shift_result_64 = input_4_zero_flag ? 0 : (weight_ext_64 << input_4_lo_position);
assign shift_result_65 = input_5_zero_flag ? 0 : (weight_ext_65 << input_5_lo_position);
assign shift_result_66 = input_6_zero_flag ? 0 : (weight_ext_66 << input_6_lo_position);
assign shift_result_67 = input_7_zero_flag ? 0 : (weight_ext_67 << input_7_lo_position);
assign shift_result_68 = input_8_zero_flag ? 0 : (weight_ext_68 << input_8_lo_position);
assign shift_result_69 = input_9_zero_flag ? 0 : (weight_ext_69 << input_9_lo_position);
assign shift_result_6a = input_a_zero_flag ? 0 : (weight_ext_6a << input_a_lo_position);
assign shift_result_6b = input_b_zero_flag ? 0 : (weight_ext_6b << input_b_lo_position);
assign shift_result_6c = input_c_zero_flag ? 0 : (weight_ext_6c << input_c_lo_position);
assign shift_result_6d = input_d_zero_flag ? 0 : (weight_ext_6d << input_d_lo_position);
assign shift_result_6e = input_e_zero_flag ? 0 : (weight_ext_6e << input_e_lo_position);
assign shift_result_6f = input_f_zero_flag ? 0 : (weight_ext_6f << input_f_lo_position);
assign shift_result_70 = input_0_zero_flag ? 0 : (weight_ext_70 << input_0_lo_position);
assign shift_result_71 = input_1_zero_flag ? 0 : (weight_ext_71 << input_1_lo_position);
assign shift_result_72 = input_2_zero_flag ? 0 : (weight_ext_72 << input_2_lo_position);
assign shift_result_73 = input_3_zero_flag ? 0 : (weight_ext_73 << input_3_lo_position);
assign shift_result_74 = input_4_zero_flag ? 0 : (weight_ext_74 << input_4_lo_position);
assign shift_result_75 = input_5_zero_flag ? 0 : (weight_ext_75 << input_5_lo_position);
assign shift_result_76 = input_6_zero_flag ? 0 : (weight_ext_76 << input_6_lo_position);
assign shift_result_77 = input_7_zero_flag ? 0 : (weight_ext_77 << input_7_lo_position);
assign shift_result_78 = input_8_zero_flag ? 0 : (weight_ext_78 << input_8_lo_position);
assign shift_result_79 = input_9_zero_flag ? 0 : (weight_ext_79 << input_9_lo_position);
assign shift_result_7a = input_a_zero_flag ? 0 : (weight_ext_7a << input_a_lo_position);
assign shift_result_7b = input_b_zero_flag ? 0 : (weight_ext_7b << input_b_lo_position);
assign shift_result_7c = input_c_zero_flag ? 0 : (weight_ext_7c << input_c_lo_position);
assign shift_result_7d = input_d_zero_flag ? 0 : (weight_ext_7d << input_d_lo_position);
assign shift_result_7e = input_e_zero_flag ? 0 : (weight_ext_7e << input_e_lo_position);
assign shift_result_7f = input_f_zero_flag ? 0 : (weight_ext_7f << input_f_lo_position);
assign shift_result_80 = input_0_zero_flag ? 0 : (weight_ext_80 << input_0_lo_position);
assign shift_result_81 = input_1_zero_flag ? 0 : (weight_ext_81 << input_1_lo_position);
assign shift_result_82 = input_2_zero_flag ? 0 : (weight_ext_82 << input_2_lo_position);
assign shift_result_83 = input_3_zero_flag ? 0 : (weight_ext_83 << input_3_lo_position);
assign shift_result_84 = input_4_zero_flag ? 0 : (weight_ext_84 << input_4_lo_position);
assign shift_result_85 = input_5_zero_flag ? 0 : (weight_ext_85 << input_5_lo_position);
assign shift_result_86 = input_6_zero_flag ? 0 : (weight_ext_86 << input_6_lo_position);
assign shift_result_87 = input_7_zero_flag ? 0 : (weight_ext_87 << input_7_lo_position);
assign shift_result_88 = input_8_zero_flag ? 0 : (weight_ext_88 << input_8_lo_position);
assign shift_result_89 = input_9_zero_flag ? 0 : (weight_ext_89 << input_9_lo_position);
assign shift_result_8a = input_a_zero_flag ? 0 : (weight_ext_8a << input_a_lo_position);
assign shift_result_8b = input_b_zero_flag ? 0 : (weight_ext_8b << input_b_lo_position);
assign shift_result_8c = input_c_zero_flag ? 0 : (weight_ext_8c << input_c_lo_position);
assign shift_result_8d = input_d_zero_flag ? 0 : (weight_ext_8d << input_d_lo_position);
assign shift_result_8e = input_e_zero_flag ? 0 : (weight_ext_8e << input_e_lo_position);
assign shift_result_8f = input_f_zero_flag ? 0 : (weight_ext_8f << input_f_lo_position);
assign shift_result_90 = input_0_zero_flag ? 0 : (weight_ext_90 << input_0_lo_position);
assign shift_result_91 = input_1_zero_flag ? 0 : (weight_ext_91 << input_1_lo_position);
assign shift_result_92 = input_2_zero_flag ? 0 : (weight_ext_92 << input_2_lo_position);
assign shift_result_93 = input_3_zero_flag ? 0 : (weight_ext_93 << input_3_lo_position);
assign shift_result_94 = input_4_zero_flag ? 0 : (weight_ext_94 << input_4_lo_position);
assign shift_result_95 = input_5_zero_flag ? 0 : (weight_ext_95 << input_5_lo_position);
assign shift_result_96 = input_6_zero_flag ? 0 : (weight_ext_96 << input_6_lo_position);
assign shift_result_97 = input_7_zero_flag ? 0 : (weight_ext_97 << input_7_lo_position);
assign shift_result_98 = input_8_zero_flag ? 0 : (weight_ext_98 << input_8_lo_position);
assign shift_result_99 = input_9_zero_flag ? 0 : (weight_ext_99 << input_9_lo_position);
assign shift_result_9a = input_a_zero_flag ? 0 : (weight_ext_9a << input_a_lo_position);
assign shift_result_9b = input_b_zero_flag ? 0 : (weight_ext_9b << input_b_lo_position);
assign shift_result_9c = input_c_zero_flag ? 0 : (weight_ext_9c << input_c_lo_position);
assign shift_result_9d = input_d_zero_flag ? 0 : (weight_ext_9d << input_d_lo_position);
assign shift_result_9e = input_e_zero_flag ? 0 : (weight_ext_9e << input_e_lo_position);
assign shift_result_9f = input_f_zero_flag ? 0 : (weight_ext_9f << input_f_lo_position);
assign shift_result_a0 = input_0_zero_flag ? 0 : (weight_ext_a0 << input_0_lo_position);
assign shift_result_a1 = input_1_zero_flag ? 0 : (weight_ext_a1 << input_1_lo_position);
assign shift_result_a2 = input_2_zero_flag ? 0 : (weight_ext_a2 << input_2_lo_position);
assign shift_result_a3 = input_3_zero_flag ? 0 : (weight_ext_a3 << input_3_lo_position);
assign shift_result_a4 = input_4_zero_flag ? 0 : (weight_ext_a4 << input_4_lo_position);
assign shift_result_a5 = input_5_zero_flag ? 0 : (weight_ext_a5 << input_5_lo_position);
assign shift_result_a6 = input_6_zero_flag ? 0 : (weight_ext_a6 << input_6_lo_position);
assign shift_result_a7 = input_7_zero_flag ? 0 : (weight_ext_a7 << input_7_lo_position);
assign shift_result_a8 = input_8_zero_flag ? 0 : (weight_ext_a8 << input_8_lo_position);
assign shift_result_a9 = input_9_zero_flag ? 0 : (weight_ext_a9 << input_9_lo_position);
assign shift_result_aa = input_a_zero_flag ? 0 : (weight_ext_aa << input_a_lo_position);
assign shift_result_ab = input_b_zero_flag ? 0 : (weight_ext_ab << input_b_lo_position);
assign shift_result_ac = input_c_zero_flag ? 0 : (weight_ext_ac << input_c_lo_position);
assign shift_result_ad = input_d_zero_flag ? 0 : (weight_ext_ad << input_d_lo_position);
assign shift_result_ae = input_e_zero_flag ? 0 : (weight_ext_ae << input_e_lo_position);
assign shift_result_af = input_f_zero_flag ? 0 : (weight_ext_af << input_f_lo_position);
assign shift_result_b0 = input_0_zero_flag ? 0 : (weight_ext_b0 << input_0_lo_position);
assign shift_result_b1 = input_1_zero_flag ? 0 : (weight_ext_b1 << input_1_lo_position);
assign shift_result_b2 = input_2_zero_flag ? 0 : (weight_ext_b2 << input_2_lo_position);
assign shift_result_b3 = input_3_zero_flag ? 0 : (weight_ext_b3 << input_3_lo_position);
assign shift_result_b4 = input_4_zero_flag ? 0 : (weight_ext_b4 << input_4_lo_position);
assign shift_result_b5 = input_5_zero_flag ? 0 : (weight_ext_b5 << input_5_lo_position);
assign shift_result_b6 = input_6_zero_flag ? 0 : (weight_ext_b6 << input_6_lo_position);
assign shift_result_b7 = input_7_zero_flag ? 0 : (weight_ext_b7 << input_7_lo_position);
assign shift_result_b8 = input_8_zero_flag ? 0 : (weight_ext_b8 << input_8_lo_position);
assign shift_result_b9 = input_9_zero_flag ? 0 : (weight_ext_b9 << input_9_lo_position);
assign shift_result_ba = input_a_zero_flag ? 0 : (weight_ext_ba << input_a_lo_position);
assign shift_result_bb = input_b_zero_flag ? 0 : (weight_ext_bb << input_b_lo_position);
assign shift_result_bc = input_c_zero_flag ? 0 : (weight_ext_bc << input_c_lo_position);
assign shift_result_bd = input_d_zero_flag ? 0 : (weight_ext_bd << input_d_lo_position);
assign shift_result_be = input_e_zero_flag ? 0 : (weight_ext_be << input_e_lo_position);
assign shift_result_bf = input_f_zero_flag ? 0 : (weight_ext_bf << input_f_lo_position);
assign shift_result_c0 = input_0_zero_flag ? 0 : (weight_ext_c0 << input_0_lo_position);
assign shift_result_c1 = input_1_zero_flag ? 0 : (weight_ext_c1 << input_1_lo_position);
assign shift_result_c2 = input_2_zero_flag ? 0 : (weight_ext_c2 << input_2_lo_position);
assign shift_result_c3 = input_3_zero_flag ? 0 : (weight_ext_c3 << input_3_lo_position);
assign shift_result_c4 = input_4_zero_flag ? 0 : (weight_ext_c4 << input_4_lo_position);
assign shift_result_c5 = input_5_zero_flag ? 0 : (weight_ext_c5 << input_5_lo_position);
assign shift_result_c6 = input_6_zero_flag ? 0 : (weight_ext_c6 << input_6_lo_position);
assign shift_result_c7 = input_7_zero_flag ? 0 : (weight_ext_c7 << input_7_lo_position);
assign shift_result_c8 = input_8_zero_flag ? 0 : (weight_ext_c8 << input_8_lo_position);
assign shift_result_c9 = input_9_zero_flag ? 0 : (weight_ext_c9 << input_9_lo_position);
assign shift_result_ca = input_a_zero_flag ? 0 : (weight_ext_ca << input_a_lo_position);
assign shift_result_cb = input_b_zero_flag ? 0 : (weight_ext_cb << input_b_lo_position);
assign shift_result_cc = input_c_zero_flag ? 0 : (weight_ext_cc << input_c_lo_position);
assign shift_result_cd = input_d_zero_flag ? 0 : (weight_ext_cd << input_d_lo_position);
assign shift_result_ce = input_e_zero_flag ? 0 : (weight_ext_ce << input_e_lo_position);
assign shift_result_cf = input_f_zero_flag ? 0 : (weight_ext_cf << input_f_lo_position);
assign shift_result_d0 = input_0_zero_flag ? 0 : (weight_ext_d0 << input_0_lo_position);
assign shift_result_d1 = input_1_zero_flag ? 0 : (weight_ext_d1 << input_1_lo_position);
assign shift_result_d2 = input_2_zero_flag ? 0 : (weight_ext_d2 << input_2_lo_position);
assign shift_result_d3 = input_3_zero_flag ? 0 : (weight_ext_d3 << input_3_lo_position);
assign shift_result_d4 = input_4_zero_flag ? 0 : (weight_ext_d4 << input_4_lo_position);
assign shift_result_d5 = input_5_zero_flag ? 0 : (weight_ext_d5 << input_5_lo_position);
assign shift_result_d6 = input_6_zero_flag ? 0 : (weight_ext_d6 << input_6_lo_position);
assign shift_result_d7 = input_7_zero_flag ? 0 : (weight_ext_d7 << input_7_lo_position);
assign shift_result_d8 = input_8_zero_flag ? 0 : (weight_ext_d8 << input_8_lo_position);
assign shift_result_d9 = input_9_zero_flag ? 0 : (weight_ext_d9 << input_9_lo_position);
assign shift_result_da = input_a_zero_flag ? 0 : (weight_ext_da << input_a_lo_position);
assign shift_result_db = input_b_zero_flag ? 0 : (weight_ext_db << input_b_lo_position);
assign shift_result_dc = input_c_zero_flag ? 0 : (weight_ext_dc << input_c_lo_position);
assign shift_result_dd = input_d_zero_flag ? 0 : (weight_ext_dd << input_d_lo_position);
assign shift_result_de = input_e_zero_flag ? 0 : (weight_ext_de << input_e_lo_position);
assign shift_result_df = input_f_zero_flag ? 0 : (weight_ext_df << input_f_lo_position);
assign shift_result_e0 = input_0_zero_flag ? 0 : (weight_ext_e0 << input_0_lo_position);
assign shift_result_e1 = input_1_zero_flag ? 0 : (weight_ext_e1 << input_1_lo_position);
assign shift_result_e2 = input_2_zero_flag ? 0 : (weight_ext_e2 << input_2_lo_position);
assign shift_result_e3 = input_3_zero_flag ? 0 : (weight_ext_e3 << input_3_lo_position);
assign shift_result_e4 = input_4_zero_flag ? 0 : (weight_ext_e4 << input_4_lo_position);
assign shift_result_e5 = input_5_zero_flag ? 0 : (weight_ext_e5 << input_5_lo_position);
assign shift_result_e6 = input_6_zero_flag ? 0 : (weight_ext_e6 << input_6_lo_position);
assign shift_result_e7 = input_7_zero_flag ? 0 : (weight_ext_e7 << input_7_lo_position);
assign shift_result_e8 = input_8_zero_flag ? 0 : (weight_ext_e8 << input_8_lo_position);
assign shift_result_e9 = input_9_zero_flag ? 0 : (weight_ext_e9 << input_9_lo_position);
assign shift_result_ea = input_a_zero_flag ? 0 : (weight_ext_ea << input_a_lo_position);
assign shift_result_eb = input_b_zero_flag ? 0 : (weight_ext_eb << input_b_lo_position);
assign shift_result_ec = input_c_zero_flag ? 0 : (weight_ext_ec << input_c_lo_position);
assign shift_result_ed = input_d_zero_flag ? 0 : (weight_ext_ed << input_d_lo_position);
assign shift_result_ee = input_e_zero_flag ? 0 : (weight_ext_ee << input_e_lo_position);
assign shift_result_ef = input_f_zero_flag ? 0 : (weight_ext_ef << input_f_lo_position);
assign shift_result_f0 = input_0_zero_flag ? 0 : (weight_ext_f0 << input_0_lo_position);
assign shift_result_f1 = input_1_zero_flag ? 0 : (weight_ext_f1 << input_1_lo_position);
assign shift_result_f2 = input_2_zero_flag ? 0 : (weight_ext_f2 << input_2_lo_position);
assign shift_result_f3 = input_3_zero_flag ? 0 : (weight_ext_f3 << input_3_lo_position);
assign shift_result_f4 = input_4_zero_flag ? 0 : (weight_ext_f4 << input_4_lo_position);
assign shift_result_f5 = input_5_zero_flag ? 0 : (weight_ext_f5 << input_5_lo_position);
assign shift_result_f6 = input_6_zero_flag ? 0 : (weight_ext_f6 << input_6_lo_position);
assign shift_result_f7 = input_7_zero_flag ? 0 : (weight_ext_f7 << input_7_lo_position);
assign shift_result_f8 = input_8_zero_flag ? 0 : (weight_ext_f8 << input_8_lo_position);
assign shift_result_f9 = input_9_zero_flag ? 0 : (weight_ext_f9 << input_9_lo_position);
assign shift_result_fa = input_a_zero_flag ? 0 : (weight_ext_fa << input_a_lo_position);
assign shift_result_fb = input_b_zero_flag ? 0 : (weight_ext_fb << input_b_lo_position);
assign shift_result_fc = input_c_zero_flag ? 0 : (weight_ext_fc << input_c_lo_position);
assign shift_result_fd = input_d_zero_flag ? 0 : (weight_ext_fd << input_d_lo_position);
assign shift_result_fe = input_e_zero_flag ? 0 : (weight_ext_fe << input_e_lo_position);
assign shift_result_ff = input_f_zero_flag ? 0 : (weight_ext_ff << input_f_lo_position);

assign add0_result_00 = $signed(shift_result_00) + $signed(shift_result_01);
assign add0_result_02 = $signed(shift_result_02) + $signed(shift_result_03);
assign add0_result_04 = $signed(shift_result_04) + $signed(shift_result_05);
assign add0_result_06 = $signed(shift_result_06) + $signed(shift_result_07);
assign add0_result_08 = $signed(shift_result_08) + $signed(shift_result_09);
assign add0_result_0a = $signed(shift_result_0a) + $signed(shift_result_0b);
assign add0_result_0c = $signed(shift_result_0c) + $signed(shift_result_0d);
assign add0_result_0e = $signed(shift_result_0e) + $signed(shift_result_0f);
assign add0_result_10 = $signed(shift_result_10) + $signed(shift_result_11);
assign add0_result_12 = $signed(shift_result_12) + $signed(shift_result_13);
assign add0_result_14 = $signed(shift_result_14) + $signed(shift_result_15);
assign add0_result_16 = $signed(shift_result_16) + $signed(shift_result_17);
assign add0_result_18 = $signed(shift_result_18) + $signed(shift_result_19);
assign add0_result_1a = $signed(shift_result_1a) + $signed(shift_result_1b);
assign add0_result_1c = $signed(shift_result_1c) + $signed(shift_result_1d);
assign add0_result_1e = $signed(shift_result_1e) + $signed(shift_result_1f);
assign add0_result_20 = $signed(shift_result_20) + $signed(shift_result_21);
assign add0_result_22 = $signed(shift_result_22) + $signed(shift_result_23);
assign add0_result_24 = $signed(shift_result_24) + $signed(shift_result_25);
assign add0_result_26 = $signed(shift_result_26) + $signed(shift_result_27);
assign add0_result_28 = $signed(shift_result_28) + $signed(shift_result_29);
assign add0_result_2a = $signed(shift_result_2a) + $signed(shift_result_2b);
assign add0_result_2c = $signed(shift_result_2c) + $signed(shift_result_2d);
assign add0_result_2e = $signed(shift_result_2e) + $signed(shift_result_2f);
assign add0_result_30 = $signed(shift_result_30) + $signed(shift_result_31);
assign add0_result_32 = $signed(shift_result_32) + $signed(shift_result_33);
assign add0_result_34 = $signed(shift_result_34) + $signed(shift_result_35);
assign add0_result_36 = $signed(shift_result_36) + $signed(shift_result_37);
assign add0_result_38 = $signed(shift_result_38) + $signed(shift_result_39);
assign add0_result_3a = $signed(shift_result_3a) + $signed(shift_result_3b);
assign add0_result_3c = $signed(shift_result_3c) + $signed(shift_result_3d);
assign add0_result_3e = $signed(shift_result_3e) + $signed(shift_result_3f);
assign add0_result_40 = $signed(shift_result_40) + $signed(shift_result_41);
assign add0_result_42 = $signed(shift_result_42) + $signed(shift_result_43);
assign add0_result_44 = $signed(shift_result_44) + $signed(shift_result_45);
assign add0_result_46 = $signed(shift_result_46) + $signed(shift_result_47);
assign add0_result_48 = $signed(shift_result_48) + $signed(shift_result_49);
assign add0_result_4a = $signed(shift_result_4a) + $signed(shift_result_4b);
assign add0_result_4c = $signed(shift_result_4c) + $signed(shift_result_4d);
assign add0_result_4e = $signed(shift_result_4e) + $signed(shift_result_4f);
assign add0_result_50 = $signed(shift_result_50) + $signed(shift_result_51);
assign add0_result_52 = $signed(shift_result_52) + $signed(shift_result_53);
assign add0_result_54 = $signed(shift_result_54) + $signed(shift_result_55);
assign add0_result_56 = $signed(shift_result_56) + $signed(shift_result_57);
assign add0_result_58 = $signed(shift_result_58) + $signed(shift_result_59);
assign add0_result_5a = $signed(shift_result_5a) + $signed(shift_result_5b);
assign add0_result_5c = $signed(shift_result_5c) + $signed(shift_result_5d);
assign add0_result_5e = $signed(shift_result_5e) + $signed(shift_result_5f);
assign add0_result_60 = $signed(shift_result_60) + $signed(shift_result_61);
assign add0_result_62 = $signed(shift_result_62) + $signed(shift_result_63);
assign add0_result_64 = $signed(shift_result_64) + $signed(shift_result_65);
assign add0_result_66 = $signed(shift_result_66) + $signed(shift_result_67);
assign add0_result_68 = $signed(shift_result_68) + $signed(shift_result_69);
assign add0_result_6a = $signed(shift_result_6a) + $signed(shift_result_6b);
assign add0_result_6c = $signed(shift_result_6c) + $signed(shift_result_6d);
assign add0_result_6e = $signed(shift_result_6e) + $signed(shift_result_6f);
assign add0_result_70 = $signed(shift_result_70) + $signed(shift_result_71);
assign add0_result_72 = $signed(shift_result_72) + $signed(shift_result_73);
assign add0_result_74 = $signed(shift_result_74) + $signed(shift_result_75);
assign add0_result_76 = $signed(shift_result_76) + $signed(shift_result_77);
assign add0_result_78 = $signed(shift_result_78) + $signed(shift_result_79);
assign add0_result_7a = $signed(shift_result_7a) + $signed(shift_result_7b);
assign add0_result_7c = $signed(shift_result_7c) + $signed(shift_result_7d);
assign add0_result_7e = $signed(shift_result_7e) + $signed(shift_result_7f);
assign add0_result_80 = $signed(shift_result_80) + $signed(shift_result_81);
assign add0_result_82 = $signed(shift_result_82) + $signed(shift_result_83);
assign add0_result_84 = $signed(shift_result_84) + $signed(shift_result_85);
assign add0_result_86 = $signed(shift_result_86) + $signed(shift_result_87);
assign add0_result_88 = $signed(shift_result_88) + $signed(shift_result_89);
assign add0_result_8a = $signed(shift_result_8a) + $signed(shift_result_8b);
assign add0_result_8c = $signed(shift_result_8c) + $signed(shift_result_8d);
assign add0_result_8e = $signed(shift_result_8e) + $signed(shift_result_8f);
assign add0_result_90 = $signed(shift_result_90) + $signed(shift_result_91);
assign add0_result_92 = $signed(shift_result_92) + $signed(shift_result_93);
assign add0_result_94 = $signed(shift_result_94) + $signed(shift_result_95);
assign add0_result_96 = $signed(shift_result_96) + $signed(shift_result_97);
assign add0_result_98 = $signed(shift_result_98) + $signed(shift_result_99);
assign add0_result_9a = $signed(shift_result_9a) + $signed(shift_result_9b);
assign add0_result_9c = $signed(shift_result_9c) + $signed(shift_result_9d);
assign add0_result_9e = $signed(shift_result_9e) + $signed(shift_result_9f);
assign add0_result_a0 = $signed(shift_result_a0) + $signed(shift_result_a1);
assign add0_result_a2 = $signed(shift_result_a2) + $signed(shift_result_a3);
assign add0_result_a4 = $signed(shift_result_a4) + $signed(shift_result_a5);
assign add0_result_a6 = $signed(shift_result_a6) + $signed(shift_result_a7);
assign add0_result_a8 = $signed(shift_result_a8) + $signed(shift_result_a9);
assign add0_result_aa = $signed(shift_result_aa) + $signed(shift_result_ab);
assign add0_result_ac = $signed(shift_result_ac) + $signed(shift_result_ad);
assign add0_result_ae = $signed(shift_result_ae) + $signed(shift_result_af);
assign add0_result_b0 = $signed(shift_result_b0) + $signed(shift_result_b1);
assign add0_result_b2 = $signed(shift_result_b2) + $signed(shift_result_b3);
assign add0_result_b4 = $signed(shift_result_b4) + $signed(shift_result_b5);
assign add0_result_b6 = $signed(shift_result_b6) + $signed(shift_result_b7);
assign add0_result_b8 = $signed(shift_result_b8) + $signed(shift_result_b9);
assign add0_result_ba = $signed(shift_result_ba) + $signed(shift_result_bb);
assign add0_result_bc = $signed(shift_result_bc) + $signed(shift_result_bd);
assign add0_result_be = $signed(shift_result_be) + $signed(shift_result_bf);
assign add0_result_c0 = $signed(shift_result_c0) + $signed(shift_result_c1);
assign add0_result_c2 = $signed(shift_result_c2) + $signed(shift_result_c3);
assign add0_result_c4 = $signed(shift_result_c4) + $signed(shift_result_c5);
assign add0_result_c6 = $signed(shift_result_c6) + $signed(shift_result_c7);
assign add0_result_c8 = $signed(shift_result_c8) + $signed(shift_result_c9);
assign add0_result_ca = $signed(shift_result_ca) + $signed(shift_result_cb);
assign add0_result_cc = $signed(shift_result_cc) + $signed(shift_result_cd);
assign add0_result_ce = $signed(shift_result_ce) + $signed(shift_result_cf);
assign add0_result_d0 = $signed(shift_result_d0) + $signed(shift_result_d1);
assign add0_result_d2 = $signed(shift_result_d2) + $signed(shift_result_d3);
assign add0_result_d4 = $signed(shift_result_d4) + $signed(shift_result_d5);
assign add0_result_d6 = $signed(shift_result_d6) + $signed(shift_result_d7);
assign add0_result_d8 = $signed(shift_result_d8) + $signed(shift_result_d9);
assign add0_result_da = $signed(shift_result_da) + $signed(shift_result_db);
assign add0_result_dc = $signed(shift_result_dc) + $signed(shift_result_dd);
assign add0_result_de = $signed(shift_result_de) + $signed(shift_result_df);
assign add0_result_e0 = $signed(shift_result_e0) + $signed(shift_result_e1);
assign add0_result_e2 = $signed(shift_result_e2) + $signed(shift_result_e3);
assign add0_result_e4 = $signed(shift_result_e4) + $signed(shift_result_e5);
assign add0_result_e6 = $signed(shift_result_e6) + $signed(shift_result_e7);
assign add0_result_e8 = $signed(shift_result_e8) + $signed(shift_result_e9);
assign add0_result_ea = $signed(shift_result_ea) + $signed(shift_result_eb);
assign add0_result_ec = $signed(shift_result_ec) + $signed(shift_result_ed);
assign add0_result_ee = $signed(shift_result_ee) + $signed(shift_result_ef);
assign add0_result_f0 = $signed(shift_result_f0) + $signed(shift_result_f1);
assign add0_result_f2 = $signed(shift_result_f2) + $signed(shift_result_f3);
assign add0_result_f4 = $signed(shift_result_f4) + $signed(shift_result_f5);
assign add0_result_f6 = $signed(shift_result_f6) + $signed(shift_result_f7);
assign add0_result_f8 = $signed(shift_result_f8) + $signed(shift_result_f9);
assign add0_result_fa = $signed(shift_result_fa) + $signed(shift_result_fb);
assign add0_result_fc = $signed(shift_result_fc) + $signed(shift_result_fd);
assign add0_result_fe = $signed(shift_result_fe) + $signed(shift_result_ff);

always@(posedge clk)
begin
	add1_result_00 <= $signed(add0_result_00) + $signed(add0_result_02);
end

always@(posedge clk)
begin
	add1_result_04 <= $signed(add0_result_04) + $signed(add0_result_06);
end

always@(posedge clk)
begin
	add1_result_08 <= $signed(add0_result_08) + $signed(add0_result_0a);
end

always@(posedge clk)
begin
	add1_result_0c <= $signed(add0_result_0c) + $signed(add0_result_0e);
end

always@(posedge clk)
begin
	add1_result_10 <= $signed(add0_result_10) + $signed(add0_result_12);
end

always@(posedge clk)
begin
	add1_result_14 <= $signed(add0_result_14) + $signed(add0_result_16);
end

always@(posedge clk)
begin
	add1_result_18 <= $signed(add0_result_18) + $signed(add0_result_1a);
end

always@(posedge clk)
begin
	add1_result_1c <= $signed(add0_result_1c) + $signed(add0_result_1e);
end

always@(posedge clk)
begin
	add1_result_20 <= $signed(add0_result_20) + $signed(add0_result_22);
end

always@(posedge clk)
begin
	add1_result_24 <= $signed(add0_result_24) + $signed(add0_result_26);
end

always@(posedge clk)
begin
	add1_result_28 <= $signed(add0_result_28) + $signed(add0_result_2a);
end

always@(posedge clk)
begin
	add1_result_2c <= $signed(add0_result_2c) + $signed(add0_result_2e);
end

always@(posedge clk)
begin
	add1_result_30 <= $signed(add0_result_30) + $signed(add0_result_32);
end

always@(posedge clk)
begin
	add1_result_34 <= $signed(add0_result_34) + $signed(add0_result_36);
end

always@(posedge clk)
begin
	add1_result_38 <= $signed(add0_result_38) + $signed(add0_result_3a);
end

always@(posedge clk)
begin
	add1_result_3c <= $signed(add0_result_3c) + $signed(add0_result_3e);
end

always@(posedge clk)
begin
	add1_result_40 <= $signed(add0_result_40) + $signed(add0_result_42);
end

always@(posedge clk)
begin
	add1_result_44 <= $signed(add0_result_44) + $signed(add0_result_46);
end

always@(posedge clk)
begin
	add1_result_48 <= $signed(add0_result_48) + $signed(add0_result_4a);
end

always@(posedge clk)
begin
	add1_result_4c <= $signed(add0_result_4c) + $signed(add0_result_4e);
end

always@(posedge clk)
begin
	add1_result_50 <= $signed(add0_result_50) + $signed(add0_result_52);
end

always@(posedge clk)
begin
	add1_result_54 <= $signed(add0_result_54) + $signed(add0_result_56);
end

always@(posedge clk)
begin
	add1_result_58 <= $signed(add0_result_58) + $signed(add0_result_5a);
end

always@(posedge clk)
begin
	add1_result_5c <= $signed(add0_result_5c) + $signed(add0_result_5e);
end

always@(posedge clk)
begin
	add1_result_60 <= $signed(add0_result_60) + $signed(add0_result_62);
end

always@(posedge clk)
begin
	add1_result_64 <= $signed(add0_result_64) + $signed(add0_result_66);
end

always@(posedge clk)
begin
	add1_result_68 <= $signed(add0_result_68) + $signed(add0_result_6a);
end

always@(posedge clk)
begin
	add1_result_6c <= $signed(add0_result_6c) + $signed(add0_result_6e);
end

always@(posedge clk)
begin
	add1_result_70 <= $signed(add0_result_70) + $signed(add0_result_72);
end

always@(posedge clk)
begin
	add1_result_74 <= $signed(add0_result_74) + $signed(add0_result_76);
end

always@(posedge clk)
begin
	add1_result_78 <= $signed(add0_result_78) + $signed(add0_result_7a);
end

always@(posedge clk)
begin
	add1_result_7c <= $signed(add0_result_7c) + $signed(add0_result_7e);
end

always@(posedge clk)
begin
	add1_result_80 <= $signed(add0_result_80) + $signed(add0_result_82);
end

always@(posedge clk)
begin
	add1_result_84 <= $signed(add0_result_84) + $signed(add0_result_86);
end

always@(posedge clk)
begin
	add1_result_88 <= $signed(add0_result_88) + $signed(add0_result_8a);
end

always@(posedge clk)
begin
	add1_result_8c <= $signed(add0_result_8c) + $signed(add0_result_8e);
end

always@(posedge clk)
begin
	add1_result_90 <= $signed(add0_result_90) + $signed(add0_result_92);
end

always@(posedge clk)
begin
	add1_result_94 <= $signed(add0_result_94) + $signed(add0_result_96);
end

always@(posedge clk)
begin
	add1_result_98 <= $signed(add0_result_98) + $signed(add0_result_9a);
end

always@(posedge clk)
begin
	add1_result_9c <= $signed(add0_result_9c) + $signed(add0_result_9e);
end

always@(posedge clk)
begin
	add1_result_a0 <= $signed(add0_result_a0) + $signed(add0_result_a2);
end

always@(posedge clk)
begin
	add1_result_a4 <= $signed(add0_result_a4) + $signed(add0_result_a6);
end

always@(posedge clk)
begin
	add1_result_a8 <= $signed(add0_result_a8) + $signed(add0_result_aa);
end

always@(posedge clk)
begin
	add1_result_ac <= $signed(add0_result_ac) + $signed(add0_result_ae);
end

always@(posedge clk)
begin
	add1_result_b0 <= $signed(add0_result_b0) + $signed(add0_result_b2);
end

always@(posedge clk)
begin
	add1_result_b4 <= $signed(add0_result_b4) + $signed(add0_result_b6);
end

always@(posedge clk)
begin
	add1_result_b8 <= $signed(add0_result_b8) + $signed(add0_result_ba);
end

always@(posedge clk)
begin
	add1_result_bc <= $signed(add0_result_bc) + $signed(add0_result_be);
end

always@(posedge clk)
begin
	add1_result_c0 <= $signed(add0_result_c0) + $signed(add0_result_c2);
end

always@(posedge clk)
begin
	add1_result_c4 <= $signed(add0_result_c4) + $signed(add0_result_c6);
end

always@(posedge clk)
begin
	add1_result_c8 <= $signed(add0_result_c8) + $signed(add0_result_ca);
end

always@(posedge clk)
begin
	add1_result_cc <= $signed(add0_result_cc) + $signed(add0_result_ce);
end

always@(posedge clk)
begin
	add1_result_d0 <= $signed(add0_result_d0) + $signed(add0_result_d2);
end

always@(posedge clk)
begin
	add1_result_d4 <= $signed(add0_result_d4) + $signed(add0_result_d6);
end

always@(posedge clk)
begin
	add1_result_d8 <= $signed(add0_result_d8) + $signed(add0_result_da);
end

always@(posedge clk)
begin
	add1_result_dc <= $signed(add0_result_dc) + $signed(add0_result_de);
end

always@(posedge clk)
begin
	add1_result_e0 <= $signed(add0_result_e0) + $signed(add0_result_e2);
end

always@(posedge clk)
begin
	add1_result_e4 <= $signed(add0_result_e4) + $signed(add0_result_e6);
end

always@(posedge clk)
begin
	add1_result_e8 <= $signed(add0_result_e8) + $signed(add0_result_ea);
end

always@(posedge clk)
begin
	add1_result_ec <= $signed(add0_result_ec) + $signed(add0_result_ee);
end

always@(posedge clk)
begin
	add1_result_f0 <= $signed(add0_result_f0) + $signed(add0_result_f2);
end

always@(posedge clk)
begin
	add1_result_f4 <= $signed(add0_result_f4) + $signed(add0_result_f6);
end

always@(posedge clk)
begin
	add1_result_f8 <= $signed(add0_result_f8) + $signed(add0_result_fa);
end

always@(posedge clk)
begin
	add1_result_fc <= $signed(add0_result_fc) + $signed(add0_result_fe);
end

assign add2_result_00 = $signed(add1_result_00) + $signed(add1_result_04);
assign add2_result_08 = $signed(add1_result_08) + $signed(add1_result_0c);
assign add2_result_10 = $signed(add1_result_10) + $signed(add1_result_14);
assign add2_result_18 = $signed(add1_result_18) + $signed(add1_result_1c);
assign add2_result_20 = $signed(add1_result_20) + $signed(add1_result_24);
assign add2_result_28 = $signed(add1_result_28) + $signed(add1_result_2c);
assign add2_result_30 = $signed(add1_result_30) + $signed(add1_result_34);
assign add2_result_38 = $signed(add1_result_38) + $signed(add1_result_3c);
assign add2_result_40 = $signed(add1_result_40) + $signed(add1_result_44);
assign add2_result_48 = $signed(add1_result_48) + $signed(add1_result_4c);
assign add2_result_50 = $signed(add1_result_50) + $signed(add1_result_54);
assign add2_result_58 = $signed(add1_result_58) + $signed(add1_result_5c);
assign add2_result_60 = $signed(add1_result_60) + $signed(add1_result_64);
assign add2_result_68 = $signed(add1_result_68) + $signed(add1_result_6c);
assign add2_result_70 = $signed(add1_result_70) + $signed(add1_result_74);
assign add2_result_78 = $signed(add1_result_78) + $signed(add1_result_7c);
assign add2_result_80 = $signed(add1_result_80) + $signed(add1_result_84);
assign add2_result_88 = $signed(add1_result_88) + $signed(add1_result_8c);
assign add2_result_90 = $signed(add1_result_90) + $signed(add1_result_94);
assign add2_result_98 = $signed(add1_result_98) + $signed(add1_result_9c);
assign add2_result_a0 = $signed(add1_result_a0) + $signed(add1_result_a4);
assign add2_result_a8 = $signed(add1_result_a8) + $signed(add1_result_ac);
assign add2_result_b0 = $signed(add1_result_b0) + $signed(add1_result_b4);
assign add2_result_b8 = $signed(add1_result_b8) + $signed(add1_result_bc);
assign add2_result_c0 = $signed(add1_result_c0) + $signed(add1_result_c4);
assign add2_result_c8 = $signed(add1_result_c8) + $signed(add1_result_cc);
assign add2_result_d0 = $signed(add1_result_d0) + $signed(add1_result_d4);
assign add2_result_d8 = $signed(add1_result_d8) + $signed(add1_result_dc);
assign add2_result_e0 = $signed(add1_result_e0) + $signed(add1_result_e4);
assign add2_result_e8 = $signed(add1_result_e8) + $signed(add1_result_ec);
assign add2_result_f0 = $signed(add1_result_f0) + $signed(add1_result_f4);
assign add2_result_f8 = $signed(add1_result_f8) + $signed(add1_result_fc);

assign add3_result_00 = $signed(add2_result_00) + $signed(add2_result_08);
assign add3_result_10 = $signed(add2_result_10) + $signed(add2_result_18);
assign add3_result_20 = $signed(add2_result_20) + $signed(add2_result_28);
assign add3_result_30 = $signed(add2_result_30) + $signed(add2_result_38);
assign add3_result_40 = $signed(add2_result_40) + $signed(add2_result_48);
assign add3_result_50 = $signed(add2_result_50) + $signed(add2_result_58);
assign add3_result_60 = $signed(add2_result_60) + $signed(add2_result_68);
assign add3_result_70 = $signed(add2_result_70) + $signed(add2_result_78);
assign add3_result_80 = $signed(add2_result_80) + $signed(add2_result_88);
assign add3_result_90 = $signed(add2_result_90) + $signed(add2_result_98);
assign add3_result_a0 = $signed(add2_result_a0) + $signed(add2_result_a8);
assign add3_result_b0 = $signed(add2_result_b0) + $signed(add2_result_b8);
assign add3_result_c0 = $signed(add2_result_c0) + $signed(add2_result_c8);
assign add3_result_d0 = $signed(add2_result_d0) + $signed(add2_result_d8);
assign add3_result_e0 = $signed(add2_result_e0) + $signed(add2_result_e8);
assign add3_result_f0 = $signed(add2_result_f0) + $signed(add2_result_f8);

// assign acc_result_0 = $signed(acc_0) + $signed(add3_result_00);
always@(posedge clk) begin
    if (rst)
        acc_result_0 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_0 <= acc_0;
    end
    else if(is_state_work) begin
        acc_result_0 <= $signed(acc_result_0) + $signed(add3_result_00);
    end
end

// assign acc_result_1 = $signed(acc_1) + $signed(add3_result_10);
always@(posedge clk) begin
    if (rst)
        acc_result_1 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_1 <= acc_1;
    end
    else if(is_state_work) begin
        acc_result_1 <= $signed(acc_result_1) + $signed(add3_result_10);
    end
end

// assign acc_result_2 = $signed(acc_2) + $signed(add3_result_20);
always@(posedge clk) begin
    if (rst)
        acc_result_2 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_2 <= acc_2;
    end
    else if(is_state_work) begin
        acc_result_2 <= $signed(acc_result_2) + $signed(add3_result_20);
    end
end

// assign acc_result_3 = $signed(acc_3) + $signed(add3_result_30);
always@(posedge clk) begin
    if (rst)
        acc_result_3 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_3 <= acc_3;
    end
    else if(is_state_work) begin
        acc_result_3 <= $signed(acc_result_3) + $signed(add3_result_30);
    end
end

// assign acc_result_4 = $signed(acc_4) + $signed(add3_result_40);
always@(posedge clk) begin
    if (rst)
        acc_result_4 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_4 <= acc_4;
    end
    else if(is_state_work) begin
        acc_result_4 <= $signed(acc_result_4) + $signed(add3_result_40);
    end
end

// assign acc_result_5 = $signed(acc_5) + $signed(add3_result_50);
always@(posedge clk) begin
    if (rst)
        acc_result_5 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_5 <= acc_5;
    end
    else if(is_state_work) begin
        acc_result_5 <= $signed(acc_result_5) + $signed(add3_result_50);
    end
end

// assign acc_result_6 = $signed(acc_6) + $signed(add3_result_60);
always@(posedge clk) begin
    if (rst)
        acc_result_6 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_6 <= acc_6;
    end
    else if(is_state_work) begin
        acc_result_6 <= $signed(acc_result_6) + $signed(add3_result_60);
    end
end

// assign acc_result_7 = $signed(acc_7) + $signed(add3_result_70);
always@(posedge clk) begin
    if (rst)
        acc_result_7 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_7 <= acc_7;
    end
    else if(is_state_work) begin
        acc_result_7 <= $signed(acc_result_7) + $signed(add3_result_70);
    end
end

// assign acc_result_8 = $signed(acc_8) + $signed(add3_result_80);
always@(posedge clk) begin
    if (rst)
        acc_result_8 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_8 <= acc_8;
    end
    else if(is_state_work) begin
        acc_result_8 <= $signed(acc_result_8) + $signed(add3_result_80);
    end
end

// assign acc_result_9 = $signed(acc_9) + $signed(add3_result_90);
always@(posedge clk) begin
    if (rst)
        acc_result_9 <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_9 <= acc_9;
    end
    else if(is_state_work) begin
        acc_result_9 <= $signed(acc_result_9) + $signed(add3_result_90);
    end
end

// assign acc_result_a = $signed(acc_a) + $signed(add3_result_a0);
always@(posedge clk) begin
    if (rst)
        acc_result_a <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_a <= acc_a;
    end
    else if(is_state_work) begin
        acc_result_a <= $signed(acc_result_a) + $signed(add3_result_a0);
    end
end

// assign acc_result_b = $signed(acc_b) + $signed(add3_result_b0);
always@(posedge clk) begin
    if (rst)
        acc_result_b <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_b <= acc_b;
    end
    else if(is_state_work) begin
        acc_result_b <= $signed(acc_result_b) + $signed(add3_result_b0);
    end
end

// assign acc_result_c = $signed(acc_c) + $signed(add3_result_c0);
always@(posedge clk) begin
    if (rst)
        acc_result_c <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_c <= acc_c;
    end
    else if(is_state_work) begin
        acc_result_c <= $signed(acc_result_c) + $signed(add3_result_c0);
    end
end

// assign acc_result_d = $signed(acc_d) + $signed(add3_result_d0);
always@(posedge clk) begin
    if (rst)
        acc_result_d <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_d <= acc_d;
    end
    else if(is_state_work) begin
        acc_result_d <= $signed(acc_result_d) + $signed(add3_result_d0);
    end
end

// assign acc_result_e = $signed(acc_e) + $signed(add3_result_e0);
always@(posedge clk) begin
    if (rst)
        acc_result_e <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_e <= acc_e;
    end
    else if(is_state_work) begin
        acc_result_e <= $signed(acc_result_e) + $signed(add3_result_e0);
    end
end

// assign acc_result_f = $signed(acc_f) + $signed(add3_result_f0);
always@(posedge clk) begin
    if (rst)
        acc_result_f <= 32'h0000_0000;
    else if (input_valid) begin
        acc_result_f <= acc_f;
    end
    else if(is_state_work) begin
        acc_result_f <= $signed(acc_result_f) + $signed(add3_result_f0);
    end
end

assign output_result_0 = acc_result_0[7:0];
assign output_result_1 = acc_result_1[7:0];
assign output_result_2 = acc_result_2[7:0];
assign output_result_3 = acc_result_3[7:0];
assign output_result_4 = acc_result_4[7:0];
assign output_result_5 = acc_result_5[7:0];
assign output_result_6 = acc_result_6[7:0];
assign output_result_7 = acc_result_7[7:0];
assign output_result_8 = acc_result_8[7:0];
assign output_result_9 = acc_result_9[7:0];
assign output_result_a = acc_result_a[7:0];
assign output_result_b = acc_result_b[7:0];
assign output_result_c = acc_result_c[7:0];
assign output_result_d = acc_result_d[7:0];
assign output_result_e = acc_result_e[7:0];
assign output_result_f = acc_result_f[7:0];

// acc result & reset
assign a_out_0 = gemm_reset ? 0 : acc_result_0;
assign a_out_1 = gemm_reset ? 0 : acc_result_1;
assign a_out_2 = gemm_reset ? 0 : acc_result_2;
assign a_out_3 = gemm_reset ? 0 : acc_result_3;
assign a_out_4 = gemm_reset ? 0 : acc_result_4;
assign a_out_5 = gemm_reset ? 0 : acc_result_5;
assign a_out_6 = gemm_reset ? 0 : acc_result_6;
assign a_out_7 = gemm_reset ? 0 : acc_result_7;
assign a_out_8 = gemm_reset ? 0 : acc_result_8;
assign a_out_9 = gemm_reset ? 0 : acc_result_9;
assign a_out_a = gemm_reset ? 0 : acc_result_a;
assign a_out_b = gemm_reset ? 0 : acc_result_b;
assign a_out_c = gemm_reset ? 0 : acc_result_c;
assign a_out_d = gemm_reset ? 0 : acc_result_d;
assign a_out_e = gemm_reset ? 0 : acc_result_e;
assign a_out_f = gemm_reset ? 0 : acc_result_f;

// out result
assign o_0 = output_result_0;
assign o_1 = output_result_1;
assign o_2 = output_result_2;
assign o_3 = output_result_3;
assign o_4 = output_result_4;
assign o_5 = output_result_5;
assign o_6 = output_result_6;
assign o_7 = output_result_7;
assign o_8 = output_result_8;
assign o_9 = output_result_9;
assign o_a = output_result_a;
assign o_b = output_result_b;
assign o_c = output_result_c;
assign o_d = output_result_d;
assign o_e = output_result_e;
assign o_f = output_result_f;

assign output_valid = out_valid;
assign state_done   = all_zeros;

endmodule