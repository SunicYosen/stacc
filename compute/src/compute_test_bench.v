module compute_tb();

parameter    C_S_AXI_CONTROL_BUS_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_BUS_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_UOP_PORT_ID_WIDTH = 1;
parameter    C_M_AXI_UOP_PORT_ADDR_WIDTH = 32;
parameter    C_M_AXI_UOP_PORT_DATA_WIDTH = 32;
parameter    C_M_AXI_UOP_PORT_AWUSER_WIDTH = 1;
parameter    C_M_AXI_UOP_PORT_ARUSER_WIDTH = 1;
parameter    C_M_AXI_UOP_PORT_WUSER_WIDTH = 1;
parameter    C_M_AXI_UOP_PORT_RUSER_WIDTH = 1;
parameter    C_M_AXI_UOP_PORT_BUSER_WIDTH = 1;
parameter    C_M_AXI_UOP_PORT_USER_VALUE = 0;
parameter    C_M_AXI_UOP_PORT_PROT_VALUE = 0;
parameter    C_M_AXI_UOP_PORT_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_DATA_PORT_ID_WIDTH = 1;
parameter    C_M_AXI_DATA_PORT_ADDR_WIDTH = 32;
parameter    C_M_AXI_DATA_PORT_DATA_WIDTH = 64;
parameter    C_M_AXI_DATA_PORT_AWUSER_WIDTH = 1;
parameter    C_M_AXI_DATA_PORT_ARUSER_WIDTH = 1;
parameter    C_M_AXI_DATA_PORT_WUSER_WIDTH = 1;
parameter    C_M_AXI_DATA_PORT_RUSER_WIDTH = 1;
parameter    C_M_AXI_DATA_PORT_BUSER_WIDTH = 1;
parameter    C_M_AXI_DATA_PORT_USER_VALUE = 0;
parameter    C_M_AXI_DATA_PORT_PROT_VALUE = 0;
parameter    C_M_AXI_DATA_PORT_CACHE_VALUE = 3;

parameter C_S_AXI_CONTROL_BUS_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_UOP_PORT_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_DATA_PORT_WSTRB_WIDTH = (64 / 8);


reg clk;
reg reset;
wire [127: 0] instruction;

reg [31:0]  inst_address;
reg [127:0] inst_memory[0:64];

wire                                          ap_clk;                        // Input
wire                                          ap_rst_n;                      // Input
wire                                          m_axi_uop_port_AWVALID;        // Gen By compute_uop_port_m_axi_U
wire                                          m_axi_uop_port_AWREADY;        // Input
wire  [C_M_AXI_UOP_PORT_ADDR_WIDTH - 1:0]     m_axi_uop_port_AWADDR;         // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_ID_WIDTH - 1:0]       m_axi_uop_port_AWID;           // Gen By compute_uop_port_m_axi_U
wire  [7:0]                                   m_axi_uop_port_AWLEN;          // Gen By compute_uop_port_m_axi_U
wire  [2:0]                                   m_axi_uop_port_AWSIZE;         // Gen By compute_uop_port_m_axi_U
wire  [1:0]                                   m_axi_uop_port_AWBURST;        // Gen By compute_uop_port_m_axi_U
wire  [1:0]                                   m_axi_uop_port_AWLOCK;         // Gen By compute_uop_port_m_axi_U
wire  [3:0]                                   m_axi_uop_port_AWCACHE;        // Gen By compute_uop_port_m_axi_U
wire  [2:0]                                   m_axi_uop_port_AWPROT;         // Gen By compute_uop_port_m_axi_U
wire  [3:0]                                   m_axi_uop_port_AWQOS;          // Gen By compute_uop_port_m_axi_U
wire  [3:0]                                   m_axi_uop_port_AWREGION;       // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_AWUSER_WIDTH - 1:0]   m_axi_uop_port_AWUSER;         // Gen By compute_uop_port_m_axi_U
wire                                          m_axi_uop_port_WVALID;         // Gen By compute_uop_port_m_axi_U
wire                                          m_axi_uop_port_WREADY;         // Input
wire  [C_M_AXI_UOP_PORT_DATA_WIDTH - 1:0]     m_axi_uop_port_WDATA;          // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_WSTRB_WIDTH - 1:0]    m_axi_uop_port_WSTRB;          // Gen By compute_uop_port_m_axi_U
wire                                          m_axi_uop_port_WLAST;          // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_ID_WIDTH - 1:0]       m_axi_uop_port_WID;            // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_WUSER_WIDTH - 1:0]    m_axi_uop_port_WUSER;          // Gen By compute_uop_port_m_axi_U
wire                                          m_axi_uop_port_ARVALID;        // Gen By compute_uop_port_m_axi_U
wire                                          m_axi_uop_port_ARREADY;        // Input
wire  [C_M_AXI_UOP_PORT_ADDR_WIDTH - 1:0]     m_axi_uop_port_ARADDR;         // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_ID_WIDTH - 1:0]       m_axi_uop_port_ARID;           // Gen By compute_uop_port_m_axi_U
wire  [7:0]                                   m_axi_uop_port_ARLEN;          // Gen By compute_uop_port_m_axi_U
wire  [2:0]                                   m_axi_uop_port_ARSIZE;         // Gen By compute_uop_port_m_axi_U
wire  [1:0]                                   m_axi_uop_port_ARBURST;        // Gen By compute_uop_port_m_axi_U
wire  [1:0]                                   m_axi_uop_port_ARLOCK;         // Gen By compute_uop_port_m_axi_U
wire  [3:0]                                   m_axi_uop_port_ARCACHE;        // Gen By compute_uop_port_m_axi_U
wire  [2:0]                                   m_axi_uop_port_ARPROT;         // Gen By compute_uop_port_m_axi_U
wire  [3:0]                                   m_axi_uop_port_ARQOS;          // Gen By compute_uop_port_m_axi_U
wire  [3:0]                                   m_axi_uop_port_ARREGION;       // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_ARUSER_WIDTH - 1:0]   m_axi_uop_port_ARUSER;         // Gen By compute_uop_port_m_axi_U
wire                                          m_axi_uop_port_RVALID;         // Input
wire                                          m_axi_uop_port_RREADY;         // Gen By compute_uop_port_m_axi_U
wire  [C_M_AXI_UOP_PORT_DATA_WIDTH - 1:0]     m_axi_uop_port_RDATA;          // Input
wire                                          m_axi_uop_port_RLAST;          // Input
wire  [C_M_AXI_UOP_PORT_ID_WIDTH - 1:0]       m_axi_uop_port_RID;            // Input
wire  [C_M_AXI_UOP_PORT_RUSER_WIDTH - 1:0]    m_axi_uop_port_RUSER;          // Input
wire  [1:0]                                   m_axi_uop_port_RRESP;          // Input
wire                                          m_axi_uop_port_BVALID;         // Input
wire                                          m_axi_uop_port_BREADY;         // Gen By compute_uop_port_m_axi_U
wire  [1:0]                                   m_axi_uop_port_BRESP;          // Input
wire  [C_M_AXI_UOP_PORT_ID_WIDTH - 1:0]       m_axi_uop_port_BID;            // Input
wire  [C_M_AXI_UOP_PORT_BUSER_WIDTH - 1:0]    m_axi_uop_port_BUSER;          // Input
wire                                          m_axi_data_port_AWVALID;       // Gen By compute_data_port_m_axi_U
wire                                          m_axi_data_port_AWREADY;       // Input
wire  [C_M_AXI_DATA_PORT_ADDR_WIDTH - 1:0]    m_axi_data_port_AWADDR;        // Gen By compute_data_port_m_axi_U
wire  [C_M_AXI_DATA_PORT_ID_WIDTH - 1:0]      m_axi_data_port_AWID;          // Gen By compute_data_port_m_axi_U
wire  [7:0]                                   m_axi_data_port_AWLEN;         // Gen By compute_data_port_m_axi_U
wire  [2:0]                                   m_axi_data_port_AWSIZE;        // Gen By compute_data_port_m_axi_U
wire  [1:0]                                   m_axi_data_port_AWBURST;       // Gen By compute_data_port_m_axi_U
wire  [1:0]                                   m_axi_data_port_AWLOCK;        // Gen By compute_data_port_m_axi_U
wire  [3:0]                                   m_axi_data_port_AWCACHE;       // Gen By compute_data_port_m_axi_U
wire  [2:0]                                   m_axi_data_port_AWPROT;        // Gen By compute_data_port_m_axi_U
wire  [3:0]                                   m_axi_data_port_AWQOS;         // Gen By compute_data_port_m_axi_U
wire  [3:0]                                   m_axi_data_port_AWREGION;      // Gen By compute_data_port_m_axi_U
wire  [C_M_AXI_DATA_PORT_AWUSER_WIDTH - 1:0]  m_axi_data_port_AWUSER;        // Gen By compute_data_port_m_axi_U
wire                                          m_axi_data_port_WVALID;        // Gen By compute_data_port_m_axi_U
wire                                          m_axi_data_port_WREADY;        // Input
wire  [C_M_AXI_DATA_PORT_DATA_WIDTH - 1:0]    m_axi_data_port_WDATA;         // Gen By compute_data_port_m_axi_U
wire  [C_M_AXI_DATA_PORT_WSTRB_WIDTH - 1:0]   m_axi_data_port_WSTRB;         // Gen By compute_data_port_m_axi_U
wire                                          m_axi_data_port_WLAST;         // Gen By compute_data_port_m_axi_U
wire  [C_M_AXI_DATA_PORT_ID_WIDTH - 1:0]      m_axi_data_port_WID;           // Gen By compute_data_port_m_axi_U
wire  [C_M_AXI_DATA_PORT_WUSER_WIDTH - 1:0]   m_axi_data_port_WUSER;         // Gen By compute_data_port_m_axi_U
wire                                          m_axi_data_port_ARVALID;       // Gen By compute_data_port_m_axi_U
wire                                          m_axi_data_port_ARREADY;       // Input
wire  [C_M_AXI_DATA_PORT_ADDR_WIDTH - 1:0]    m_axi_data_port_ARADDR;        // Gen By compute_data_port_m_axi_U
wire  [C_M_AXI_DATA_PORT_ID_WIDTH - 1:0]      m_axi_data_port_ARID;          // Gen By compute_data_port_m_axi_U
wire  [7:0]                                   m_axi_data_port_ARLEN;         // Gen By compute_data_port_m_axi_U
wire  [2:0]                                   m_axi_data_port_ARSIZE;        // Gen By compute_data_port_m_axi_U
wire  [1:0]                                   m_axi_data_port_ARBURST;       // Gen By compute_data_port_m_axi_U
wire  [1:0]                                   m_axi_data_port_ARLOCK;        // Gen By compute_data_port_m_axi_U
wire  [3:0]                                   m_axi_data_port_ARCACHE;       // Gen By compute_data_port_m_axi_U
wire  [2:0]                                   m_axi_data_port_ARPROT;        // Gen By compute_data_port_m_axi_U
wire  [3:0]                                   m_axi_data_port_ARQOS;         // Gen By compute_data_port_m_axi_U
wire  [3:0]                                   m_axi_data_port_ARREGION;      // Gen By compute_data_port_m_axi_U
wire  [C_M_AXI_DATA_PORT_ARUSER_WIDTH - 1:0]  m_axi_data_port_ARUSER;        // Gen By compute_data_port_m_axi_U
wire                                          m_axi_data_port_RVALID;        // Input
wire                                          m_axi_data_port_RREADY;        // Gen By compute_data_port_m_axi_U
wire   [C_M_AXI_DATA_PORT_DATA_WIDTH - 1:0]   m_axi_data_port_RDATA;         // Input
wire                                          m_axi_data_port_RLAST;         // Input
wire   [C_M_AXI_DATA_PORT_ID_WIDTH - 1:0]     m_axi_data_port_RID;           // Input
wire   [C_M_AXI_DATA_PORT_RUSER_WIDTH - 1:0]  m_axi_data_port_RUSER;         // Input
wire   [1:0]                                  m_axi_data_port_RRESP;         // Input
wire                                          m_axi_data_port_BVALID;        // Input
wire                                          m_axi_data_port_BREADY;        // Gen By compute_data_port_m_axi_U
wire   [1:0]                                  m_axi_data_port_BRESP;         // Input
wire   [C_M_AXI_DATA_PORT_ID_WIDTH - 1:0]     m_axi_data_port_BID;           // Input
wire   [C_M_AXI_DATA_PORT_BUSER_WIDTH - 1:0]  m_axi_data_port_BUSER;         // Input
wire   [127:0]                                gemm_queue_V_V_TDATA;          // Input
wire                                          gemm_queue_V_V_TVALID;         // Input
wire                                          gemm_queue_V_V_TREADY;         // TODO
wire   [7:0]                                  l2g_dep_queue_V_TDATA;         // Input
wire                                          l2g_dep_queue_V_TVALID;        // Input
wire                                          l2g_dep_queue_V_TREADY;        // TODO
wire   [7:0]                                  s2g_dep_queue_V_TDATA;         // Input
wire                                          s2g_dep_queue_V_TVALID;        // Input
wire                                          s2g_dep_queue_V_TREADY;        // TODO
wire  [7:0]                                   g2l_dep_queue_V_TDATA;         // Gen regslice_both_g2l_dep_queue_V_U
wire                                          g2l_dep_queue_V_TVALID;        // TODO
wire                                          g2l_dep_queue_V_TREADY;        // Input
wire  [7:0]                                   g2s_dep_queue_V_TDATA;         // Gen By regslice_both_g2s_dep_queue_V_U
wire                                          g2s_dep_queue_V_TVALID;        // TODO
wire                                          g2s_dep_queue_V_TREADY;        // Input
wire  [31:0]                                  inp_mem_V_Addr_A;              // TODO Gemm
wire                                          inp_mem_V_EN_A;                // TODO Gemm
wire  [15:0]                                  inp_mem_V_WEN_A;               // TODO = 0
wire  [127:0]                                 inp_mem_V_Din_A;               // TODO = 0
wire   [127:0]                                inp_mem_V_Dout_A;              // Input 
wire                                          inp_mem_V_Clk_A;               // TODO = ap_clk
wire                                          inp_mem_V_Rst_A;               // TODO = ap_rst_n_inv
wire  [31:0]                                  wgt_mem_0_V_Addr_A;            // TODO
wire                                          wgt_mem_0_V_EN_A;              // TODO
wire  [127:0]                                 wgt_mem_0_V_WEN_A;             // TODO = 0
wire  [1023:0]                                wgt_mem_0_V_Din_A;             // TODO = 0
wire   [1023:0]                               wgt_mem_0_V_Dout_A;            // Input
wire                                          wgt_mem_0_V_Clk_A;             // TODO = ap_clk
wire                                          wgt_mem_0_V_Rst_A;             // TODO = ap_rst_n_inv
wire  [31:0]                                  wgt_mem_1_V_Addr_A;            // TODO
wire                                          wgt_mem_1_V_EN_A;              // TODO
wire  [127:0]                                 wgt_mem_1_V_WEN_A;             // TODO = 0
wire  [1023:0]                                wgt_mem_1_V_Din_A;             // TODO = 0
wire   [1023:0]                               wgt_mem_1_V_Dout_A;            // Input
wire                                          wgt_mem_1_V_Clk_A;             // TODO = ap_clk
wire                                          wgt_mem_1_V_Rst_A;             // TODO = ap_rst_n_inv
wire  [31:0]                                  out_mem_V_Addr_A;              // TODO  Gemm Result / ALU Result
wire                                          out_mem_V_EN_A;                // TODO  0/1
wire  [15:0]                                  out_mem_V_WEN_A;               // TODO  16'd65535 / 16'd0
wire  [127:0]                                 out_mem_V_Din_A;               // TODO  Gemm Result / ALU Result
wire   [127:0]                                out_mem_V_Dout_A;              // Input
wire                                          out_mem_V_Clk_A;               // TODO = ap_clk
wire                                          out_mem_V_Rst_A;               // TODO = ap_rst_n_inv
wire                                          s_axi_CONTROL_BUS_AWVALID;     // Input
wire                                          s_axi_CONTROL_BUS_AWREADY;     // Gen By compute_CONTROL_BUS_s_axi_U
wire   [C_S_AXI_CONTROL_BUS_ADDR_WIDTH - 1:0] s_axi_CONTROL_BUS_AWADDR;      // Input
wire                                          s_axi_CONTROL_BUS_WVALID;      // Input
wire                                          s_axi_CONTROL_BUS_WREADY;      // Gen By compute_CONTROL_BUS_s_axi_U
wire   [C_S_AXI_CONTROL_BUS_DATA_WIDTH - 1:0] s_axi_CONTROL_BUS_WDATA;       // Input
wire   [C_S_AXI_CONTROL_BUS_WSTRB_WIDTH - 1:0]s_axi_CONTROL_BUS_WSTRB;       // Input
wire                                          s_axi_CONTROL_BUS_ARVALID;     // Input
wire                                          s_axi_CONTROL_BUS_ARREADY;     // Gen By compute_CONTROL_BUS_s_axi_U
wire   [C_S_AXI_CONTROL_BUS_ADDR_WIDTH - 1:0] s_axi_CONTROL_BUS_ARADDR;      // Input
wire                                          s_axi_CONTROL_BUS_RVALID;      // Gen By compute_CONTROL_BUS_s_axi_U
wire                                          s_axi_CONTROL_BUS_RREADY;      // Input
wire  [C_S_AXI_CONTROL_BUS_DATA_WIDTH - 1:0]  s_axi_CONTROL_BUS_RDATA;       // Gen By compute_CONTROL_BUS_s_axi_U
wire  [1:0]                                   s_axi_CONTROL_BUS_RRESP;       // Gen By compute_CONTROL_BUS_s_axi_U
wire                                          s_axi_CONTROL_BUS_BVALID;      // Gen By compute_CONTROL_BUS_s_axi_U
wire                                          s_axi_CONTROL_BUS_BREADY;      // Input
wire  [1:0]                                   s_axi_CONTROL_BUS_BRESP;       // Gen By compute_CONTROL_BUS_s_axi_U
wire                                          interrupt;                     // Gen By compute_CONTROL_BUS_s_axi_U

initial begin
    clk   = 0;
    reset = 1;
    inst_address = 32'b0;
    #10 reset = 0;
    #2000 $finish;
end

initial $readmemb("/home/sun/File/TVM/projects/vta_sim/compute/rtl/instructions.dat", inst_memory);

assign m_axi_uop_port_AWREADY    = 1;
assign m_axi_uop_port_WREADY     = 1;
assign m_axi_uop_port_ARREADY    = 1;
assign m_axi_uop_port_RVALID     = 1;
assign m_axi_uop_port_RDATA      = 0;
assign m_axi_uop_port_RLAST      = 0;
assign m_axi_uop_port_RID        = 0;
assign m_axi_uop_port_RUSER      = 0;
assign m_axi_uop_port_RRESP      = 0;
assign m_axi_uop_port_BVALID     = 1;
assign m_axi_uop_port_BRESP      = 0;
assign m_axi_uop_port_BID        = 0;
assign m_axi_uop_port_BUSER      = 0;

assign m_axi_data_port_AWREADY   = 1;
assign m_axi_data_port_WREADY    = 1;
assign m_axi_data_port_ARREADY   = 1;
assign m_axi_data_port_RVALID    = 1;
assign m_axi_data_port_RDATA     = 64'h0000_0001_0000_0001;
assign m_axi_data_port_RLAST     = 0;
assign m_axi_data_port_RID       = 0;
assign m_axi_data_port_RUSER     = 0;
assign m_axi_data_port_RRESP     = 0;
assign m_axi_data_port_BVALID    = 1;
assign m_axi_data_port_BRESP     = 0;
assign m_axi_data_port_BID       = 0;
assign m_axi_data_port_BUSER     = 0;

assign gemm_queue_V_V_TDATA      = instruction;
assign gemm_queue_V_V_TVALID     = 1;

assign l2g_dep_queue_V_TDATA     = 8'h01;
assign l2g_dep_queue_V_TVALID    = 1;

assign s2g_dep_queue_V_TDATA     = 8'h01;
assign s2g_dep_queue_V_TVALID    = 1;

assign g2l_dep_queue_V_TREADY    = 1;
assign g2s_dep_queue_V_TREADY    = 1;

assign inp_mem_V_Dout_A          = 128'h0101_0101_0101_0101_0101_0101_0101_0101;
assign wgt_mem_0_V_Dout_A        = 1024'h0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101;
assign wgt_mem_1_V_Dout_A        = 1024'h0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101_0101;
assign out_mem_V_Dout_A          = 0;

assign s_axi_CONTROL_BUS_AWVALID = 1;
assign s_axi_CONTROL_BUS_AWADDR  = 0;
assign s_axi_CONTROL_BUS_WVALID  = 1;
assign s_axi_CONTROL_BUS_WDATA   = 32'h0000_0001;
assign s_axi_CONTROL_BUS_WSTRB   = 4'b0001;
assign s_axi_CONTROL_BUS_ARVALID = 0;
assign s_axi_CONTROL_BUS_ARADDR  = 0;
assign s_axi_CONTROL_BUS_RREADY  = 0;
assign s_axi_CONTROL_BUS_BREADY  = 1;

always #2 clk = ~clk;

assign ap_clk = clk;
assign ap_rst_n = ~reset;

assign instruction = inst_memory[inst_address];

always @(*)
begin
    if(gemm_queue_V_V_TREADY)
    begin
        inst_address = inst_address + 1'b1;
    end 
end

compute compute1 (
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .m_axi_uop_port_AWVALID(m_axi_uop_port_AWVALID),
        .m_axi_uop_port_AWREADY(m_axi_uop_port_AWREADY),
        .m_axi_uop_port_AWADDR(m_axi_uop_port_AWADDR),
        .m_axi_uop_port_AWID(m_axi_uop_port_AWID),
        .m_axi_uop_port_AWLEN(m_axi_uop_port_AWLEN),
        .m_axi_uop_port_AWSIZE(m_axi_uop_port_AWSIZE),
        .m_axi_uop_port_AWBURST(m_axi_uop_port_AWBURST),
        .m_axi_uop_port_AWLOCK(m_axi_uop_port_AWLOCK),
        .m_axi_uop_port_AWCACHE(m_axi_uop_port_AWCACHE),
        .m_axi_uop_port_AWPROT(m_axi_uop_port_AWPROT),
        .m_axi_uop_port_AWQOS(m_axi_uop_port_AWQOS),
        .m_axi_uop_port_AWREGION(m_axi_uop_port_AWREGION),
        .m_axi_uop_port_AWUSER(m_axi_uop_port_AWUSER),
        .m_axi_uop_port_WVALID(m_axi_uop_port_WVALID),
        .m_axi_uop_port_WREADY(m_axi_uop_port_WREADY),
        .m_axi_uop_port_WDATA(m_axi_uop_port_WDATA),
        .m_axi_uop_port_WSTRB(m_axi_uop_port_WSTRB),
        .m_axi_uop_port_WLAST(m_axi_uop_port_WLAST),
        .m_axi_uop_port_WID(m_axi_uop_port_WID),
        .m_axi_uop_port_WUSER(m_axi_uop_port_WUSER),
        .m_axi_uop_port_ARVALID(m_axi_uop_port_ARVALID),
        .m_axi_uop_port_ARREADY(m_axi_uop_port_ARREADY),
        .m_axi_uop_port_ARADDR(m_axi_uop_port_ARADDR),
        .m_axi_uop_port_ARID(m_axi_uop_port_ARID),
        .m_axi_uop_port_ARLEN(m_axi_uop_port_ARLEN),
        .m_axi_uop_port_ARSIZE(m_axi_uop_port_ARSIZE),
        .m_axi_uop_port_ARBURST(m_axi_uop_port_ARBURST),
        .m_axi_uop_port_ARLOCK(m_axi_uop_port_ARLOCK),
        .m_axi_uop_port_ARCACHE(m_axi_uop_port_ARCACHE),
        .m_axi_uop_port_ARPROT(m_axi_uop_port_ARPROT),
        .m_axi_uop_port_ARQOS(m_axi_uop_port_ARQOS),
        .m_axi_uop_port_ARREGION(m_axi_uop_port_ARREGION),
        .m_axi_uop_port_ARUSER(m_axi_uop_port_ARUSER),
        .m_axi_uop_port_RVALID(m_axi_uop_port_RVALID),
        .m_axi_uop_port_RREADY(m_axi_uop_port_RREADY),
        .m_axi_uop_port_RDATA(m_axi_uop_port_RDATA),
        .m_axi_uop_port_RLAST(m_axi_uop_port_RLAST),
        .m_axi_uop_port_RID(m_axi_uop_port_RID),
        .m_axi_uop_port_RUSER(m_axi_uop_port_RUSER),
        .m_axi_uop_port_RRESP(m_axi_uop_port_RRESP),
        .m_axi_uop_port_BVALID(m_axi_uop_port_BVALID),
        .m_axi_uop_port_BREADY(m_axi_uop_port_BREADY),
        .m_axi_uop_port_BRESP(m_axi_uop_port_BRESP),
        .m_axi_uop_port_BID(m_axi_uop_port_BID),
        .m_axi_uop_port_BUSER(m_axi_uop_port_BUSER),
        .m_axi_data_port_AWVALID(m_axi_data_port_AWVALID),
        .m_axi_data_port_AWREADY(m_axi_data_port_AWREADY),
        .m_axi_data_port_AWADDR(m_axi_data_port_AWADDR),
        .m_axi_data_port_AWID(m_axi_data_port_AWID),
        .m_axi_data_port_AWLEN(m_axi_data_port_AWLEN),
        .m_axi_data_port_AWSIZE(m_axi_data_port_AWSIZE),
        .m_axi_data_port_AWBURST(m_axi_data_port_AWBURST),
        .m_axi_data_port_AWLOCK(m_axi_data_port_AWLOCK),
        .m_axi_data_port_AWCACHE(m_axi_data_port_AWCACHE),
        .m_axi_data_port_AWPROT(m_axi_data_port_AWPROT),
        .m_axi_data_port_AWQOS(m_axi_data_port_AWQOS),
        .m_axi_data_port_AWREGION(m_axi_data_port_AWREGION),
        .m_axi_data_port_AWUSER(m_axi_data_port_AWUSER),
        .m_axi_data_port_WVALID(m_axi_data_port_WVALID),
        .m_axi_data_port_WREADY(m_axi_data_port_WREADY),
        .m_axi_data_port_WDATA(m_axi_data_port_WDATA),
        .m_axi_data_port_WSTRB(m_axi_data_port_WSTRB),
        .m_axi_data_port_WLAST(m_axi_data_port_WLAST),
        .m_axi_data_port_WID(m_axi_data_port_WID),
        .m_axi_data_port_WUSER(m_axi_data_port_WUSER),
        .m_axi_data_port_ARVALID(m_axi_data_port_ARVALID),
        .m_axi_data_port_ARREADY(m_axi_data_port_ARREADY),
        .m_axi_data_port_ARADDR(m_axi_data_port_ARADDR),
        .m_axi_data_port_ARID(m_axi_data_port_ARID),
        .m_axi_data_port_ARLEN(m_axi_data_port_ARLEN),
        .m_axi_data_port_ARSIZE(m_axi_data_port_ARSIZE),
        .m_axi_data_port_ARBURST(m_axi_data_port_ARBURST),
        .m_axi_data_port_ARLOCK(m_axi_data_port_ARLOCK),
        .m_axi_data_port_ARCACHE(m_axi_data_port_ARCACHE),
        .m_axi_data_port_ARPROT(m_axi_data_port_ARPROT),
        .m_axi_data_port_ARQOS(m_axi_data_port_ARQOS),
        .m_axi_data_port_ARREGION(m_axi_data_port_ARREGION),
        .m_axi_data_port_ARUSER(m_axi_data_port_ARUSER),
        .m_axi_data_port_RVALID(m_axi_data_port_RVALID),
        .m_axi_data_port_RREADY(m_axi_data_port_RREADY),
        .m_axi_data_port_RDATA(m_axi_data_port_RDATA),
        .m_axi_data_port_RLAST(m_axi_data_port_RLAST),
        .m_axi_data_port_RID(m_axi_data_port_RID),
        .m_axi_data_port_RUSER(m_axi_data_port_RUSER),
        .m_axi_data_port_RRESP(m_axi_data_port_RRESP),
        .m_axi_data_port_BVALID(m_axi_data_port_BVALID),
        .m_axi_data_port_BREADY(m_axi_data_port_BREADY),
        .m_axi_data_port_BRESP(m_axi_data_port_BRESP),
        .m_axi_data_port_BID(m_axi_data_port_BID),
        .m_axi_data_port_BUSER(m_axi_data_port_BUSER),
        .gemm_queue_V_V_TDATA(gemm_queue_V_V_TDATA),
        .gemm_queue_V_V_TVALID(gemm_queue_V_V_TVALID),
        .gemm_queue_V_V_TREADY(gemm_queue_V_V_TREADY),
        .l2g_dep_queue_V_TDATA(l2g_dep_queue_V_TDATA),
        .l2g_dep_queue_V_TVALID(l2g_dep_queue_V_TVALID),
        .l2g_dep_queue_V_TREADY(l2g_dep_queue_V_TREADY),
        .s2g_dep_queue_V_TDATA(s2g_dep_queue_V_TDATA),
        .s2g_dep_queue_V_TVALID(s2g_dep_queue_V_TVALID),
        .s2g_dep_queue_V_TREADY(s2g_dep_queue_V_TREADY),
        .g2l_dep_queue_V_TDATA(g2l_dep_queue_V_TDATA),
        .g2l_dep_queue_V_TVALID(g2l_dep_queue_V_TVALID),
        .g2l_dep_queue_V_TREADY(g2l_dep_queue_V_TREADY),
        .g2s_dep_queue_V_TDATA(g2s_dep_queue_V_TDATA),
        .g2s_dep_queue_V_TVALID(g2s_dep_queue_V_TVALID),
        .g2s_dep_queue_V_TREADY(g2s_dep_queue_V_TREADY),
        .inp_mem_V_Addr_A(inp_mem_V_Addr_A),
        .inp_mem_V_EN_A(inp_mem_V_EN_A),
        .inp_mem_V_WEN_A(inp_mem_V_WEN_A),
        .inp_mem_V_Din_A(inp_mem_V_Din_A),
        .inp_mem_V_Dout_A(inp_mem_V_Dout_A),
        .inp_mem_V_Clk_A(inp_mem_V_Clk_A),
        .inp_mem_V_Rst_A(inp_mem_V_Rst_A),
        .wgt_mem_0_V_Addr_A(wgt_mem_0_V_Addr_A),
        .wgt_mem_0_V_EN_A(wgt_mem_0_V_EN_A),
        .wgt_mem_0_V_WEN_A(wgt_mem_0_V_WEN_A),
        .wgt_mem_0_V_Din_A(wgt_mem_0_V_Din_A),
        .wgt_mem_0_V_Dout_A(wgt_mem_0_V_Dout_A),
        .wgt_mem_0_V_Clk_A(wgt_mem_0_V_Clk_A),
        .wgt_mem_0_V_Rst_A(wgt_mem_0_V_Rst_A),
        .wgt_mem_1_V_Addr_A(wgt_mem_1_V_Addr_A),
        .wgt_mem_1_V_EN_A(wgt_mem_1_V_EN_A),
        .wgt_mem_1_V_WEN_A(wgt_mem_1_V_WEN_A),
        .wgt_mem_1_V_Din_A(wgt_mem_1_V_Din_A),
        .wgt_mem_1_V_Dout_A(wgt_mem_1_V_Dout_A),
        .wgt_mem_1_V_Clk_A(wgt_mem_1_V_Clk_A),
        .wgt_mem_1_V_Rst_A(wgt_mem_1_V_Rst_A),
        .out_mem_V_Addr_A(out_mem_V_Addr_A),
        .out_mem_V_EN_A(out_mem_V_EN_A),
        .out_mem_V_WEN_A(out_mem_V_WEN_A),
        .out_mem_V_Din_A(out_mem_V_Din_A),
        .out_mem_V_Dout_A(out_mem_V_Dout_A),
        .out_mem_V_Clk_A(out_mem_V_Clk_A),
        .out_mem_V_Rst_A(out_mem_V_Rst_A),
        .s_axi_CONTROL_BUS_AWVALID(s_axi_CONTROL_BUS_AWVALID),
        .s_axi_CONTROL_BUS_AWREADY(s_axi_CONTROL_BUS_AWREADY),
        .s_axi_CONTROL_BUS_AWADDR(s_axi_CONTROL_BUS_AWADDR),
        .s_axi_CONTROL_BUS_WVALID(s_axi_CONTROL_BUS_WVALID),
        .s_axi_CONTROL_BUS_WREADY(s_axi_CONTROL_BUS_WREADY),
        .s_axi_CONTROL_BUS_WDATA(s_axi_CONTROL_BUS_WDATA),
        .s_axi_CONTROL_BUS_WSTRB(s_axi_CONTROL_BUS_WSTRB),
        .s_axi_CONTROL_BUS_ARVALID(s_axi_CONTROL_BUS_ARVALID),
        .s_axi_CONTROL_BUS_ARREADY(s_axi_CONTROL_BUS_ARREADY),
        .s_axi_CONTROL_BUS_ARADDR(s_axi_CONTROL_BUS_ARADDR),
        .s_axi_CONTROL_BUS_RVALID(s_axi_CONTROL_BUS_RVALID),
        .s_axi_CONTROL_BUS_RREADY(s_axi_CONTROL_BUS_RREADY),
        .s_axi_CONTROL_BUS_RDATA(s_axi_CONTROL_BUS_RDATA),
        .s_axi_CONTROL_BUS_RRESP(s_axi_CONTROL_BUS_RRESP),
        .s_axi_CONTROL_BUS_BVALID(s_axi_CONTROL_BUS_BVALID),
        .s_axi_CONTROL_BUS_BREADY(s_axi_CONTROL_BUS_BREADY),
        .s_axi_CONTROL_BUS_BRESP(s_axi_CONTROL_BUS_BRESP),
        .interrupt(interrupt));
endmodule