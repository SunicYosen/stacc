#!/bin/bash

compute_ip_path="/home/sun/File/TVM/projects/stacc/svta/build/hardware/xilinx/hls/pynq_1x16_i8w8a32_15_15_18_17/vta_compute/soln/impl/ip"
compute_ip_zip="${compute_ip_path}/xilinx_com_hls_compute_1_0.zip"
unzip_target_path="${compute_ip_path}/xilinx_com_hls_compute_1_0"
vhdl_path="${unzip_target_path}/hdl/vhdl"
gemm_core="/home/sun/File/TVM/projects/stacc/svta/hardware/xilinx/src/gemm_core.v"

# unzip ip zip
rm -rf ${unzip_target_path}
unzip -o -q ${compute_ip_zip} -d ${unzip_target_path}
mv ${compute_ip_zip} "${compute_ip_zip}.old"

# Remove vhdl
rm -rf ${vhdl_path}

# Change compute.v


# Copy gemm_core.v
cp ${gemm_core} ${unzip_target_path}

# zip modified ip
cd ${unzip_target_path}
zip -q -r ${compute_ip_zip} ./*

echo "No Warning(s), No Error(s)!"
