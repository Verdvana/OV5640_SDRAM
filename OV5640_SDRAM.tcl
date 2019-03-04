# Copyright (C) 2018  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.

# Quartus Prime Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
# File: C:\Users\Verdvana\Desktop\AC620_OV5640V2_SDRAM_TFT800_30FPS\prj\OV5640_SDRAM.tcl
# Generated on: Sun Mar 03 19:53:48 2019

package require ::quartus::project


set_location_assignment PIN_AF14 -to clk

set_location_assignment PIN_AK27 -to cmos_sdat
set_location_assignment PIN_AJ26 -to cmos_sclk
set_location_assignment PIN_AK29 -to cmos_href
set_location_assignment PIN_AK28 -to cmos_vsync
set_location_assignment PIN_AH27 -to cmos_xclk
set_location_assignment PIN_AJ27 -to cmos_pclk
set_location_assignment PIN_AH24 -to cmos_data[7]
set_location_assignment PIN_AG26 -to cmos_data[6]
set_location_assignment PIN_AF26 -to cmos_data[5]
set_location_assignment PIN_AG25 -to cmos_data[4]
set_location_assignment PIN_AE24 -to cmos_data[3]
set_location_assignment PIN_AF25 -to cmos_data[2]
set_location_assignment PIN_AD24 -to cmos_data[1]
set_location_assignment PIN_AE23 -to cmos_data[0]
set_location_assignment PIN_AC23 -to cmos_pwdn
set_location_assignment PIN_AB21 -to cmos_rst_n

set_location_assignment PIN_AA14 -to reset_n
set_location_assignment PIN_AA13 -to sdram_we_n
set_location_assignment PIN_AE13 -to sdram_ras_n
set_location_assignment PIN_AK12 -to sdram_dqm[1]
set_location_assignment PIN_AB13 -to sdram_dqm[0]
set_location_assignment PIN_AJ5 -to sdram_dq[15]
set_location_assignment PIN_AJ6 -to sdram_dq[14]
set_location_assignment PIN_AH7 -to sdram_dq[13]
set_location_assignment PIN_AH8 -to sdram_dq[12]
set_location_assignment PIN_AH9 -to sdram_dq[11]
set_location_assignment PIN_AJ9 -to sdram_dq[10]
set_location_assignment PIN_AJ10 -to sdram_dq[9]
set_location_assignment PIN_AH10 -to sdram_dq[8]
set_location_assignment PIN_AJ11 -to sdram_dq[7]
set_location_assignment PIN_AK11 -to sdram_dq[6]
set_location_assignment PIN_AG10 -to sdram_dq[5]
set_location_assignment PIN_AK9 -to sdram_dq[4]
set_location_assignment PIN_AK8 -to sdram_dq[3]
set_location_assignment PIN_AK7 -to sdram_dq[2]
set_location_assignment PIN_AJ7 -to sdram_dq[1]
set_location_assignment PIN_AK6 -to sdram_dq[0]
set_location_assignment PIN_AG11 -to sdram_cs_n
set_location_assignment PIN_AH12 -to sdram_clk
set_location_assignment PIN_AK13 -to sdram_cke
set_location_assignment PIN_AF11 -to sdram_cas_n
set_location_assignment PIN_AJ12 -to sdram_ba[1]
set_location_assignment PIN_AF13 -to sdram_ba[0]
set_location_assignment PIN_AJ14 -to sdram_addr[12]
set_location_assignment PIN_AH13 -to sdram_addr[11]
set_location_assignment PIN_AG12 -to sdram_addr[10]
set_location_assignment PIN_AG13 -to sdram_addr[9]
set_location_assignment PIN_AH15 -to sdram_addr[8]
set_location_assignment PIN_AF15 -to sdram_addr[7]
set_location_assignment PIN_AD14 -to sdram_addr[6]
set_location_assignment PIN_AC14 -to sdram_addr[5]
set_location_assignment PIN_AB15 -to sdram_addr[4]
set_location_assignment PIN_AE14 -to sdram_addr[3]
set_location_assignment PIN_AG15 -to sdram_addr[2]
set_location_assignment PIN_AH14 -to sdram_addr[1]
set_location_assignment PIN_AK14 -to sdram_addr[0]

set_location_assignment PIN_AK21 -to TFT_RGB[15]
set_location_assignment PIN_AH20 -to TFT_RGB[14]
set_location_assignment PIN_AD20 -to TFT_RGB[13]
set_location_assignment PIN_AD19 -to TFT_RGB[12]
set_location_assignment PIN_AE19 -to TFT_RGB[11]
set_location_assignment PIN_AA19 -to TFT_RGB[10]
set_location_assignment PIN_AA18 -to TFT_RGB[9]
set_location_assignment PIN_AC20 -to TFT_RGB[8]
set_location_assignment PIN_AE17 -to TFT_RGB[7]
set_location_assignment PIN_AJ20 -to TFT_RGB[6]
set_location_assignment PIN_AH19 -to TFT_RGB[5]
set_location_assignment PIN_AH18 -to TFT_RGB[4]
set_location_assignment PIN_AE16 -to TFT_RGB[3]
set_location_assignment PIN_AG16 -to TFT_RGB[2]
set_location_assignment PIN_AG17 -to TFT_RGB[1]
set_location_assignment PIN_AF16 -to TFT_RGB[0]
set_location_assignment PIN_AJ16 -to TFT_VS
set_location_assignment PIN_AJ17 -to TFT_HS
set_location_assignment PIN_AH17 -to TFT_VCLK
set_location_assignment PIN_AK19 -to TFT_BL

set_location_assignment PIN_AA15 -to key[1]
set_location_assignment PIN_W15 -to key[2]
set_location_assignment PIN_Y16 -to key[3]
set_location_assignment PIN_AE12 -to sw[9]
set_location_assignment PIN_AD10 -to sw[8]
set_location_assignment PIN_AC9 -to sw[7]
set_location_assignment PIN_AE11 -to sw[6]
set_location_assignment PIN_AD12 -to sw[5]
set_location_assignment PIN_AD11 -to sw[4]
set_location_assignment PIN_AF10 -to sw[3]
set_location_assignment PIN_AF9 -to sw[2]
set_location_assignment PIN_AC12 -to sw[1]
set_location_assignment PIN_AB12 -to sw[0]
set_location_assignment PIN_Y21 -to led[9]
set_location_assignment PIN_W21 -to led[8]
set_location_assignment PIN_W21 -to led[7]
set_location_assignment PIN_Y19 -to led[6]
set_location_assignment PIN_W19 -to led[5]
set_location_assignment PIN_W17 -to led[4]
set_location_assignment PIN_V18 -to led[3]
set_location_assignment PIN_V17 -to led[2]
set_location_assignment PIN_W16 -to led[1]
set_location_assignment PIN_V16 -to led[0]
set_location_assignment PIN_AE26 -to hex0[0]
set_location_assignment PIN_AE27 -to hex0[1]
set_location_assignment PIN_AE28 -to hex0[2]
set_location_assignment PIN_AG27 -to hex0[3]
set_location_assignment PIN_AF28 -to hex0[4]
set_location_assignment PIN_AG28 -to hex0[5]
set_location_assignment PIN_AH28 -to hex0[6]
set_location_assignment PIN_AJ29 -to hex1[0]
set_location_assignment PIN_AH29 -to hex1[1]
set_location_assignment PIN_AH30 -to hex1[2]
set_location_assignment PIN_AG30 -to hex1[3]
set_location_assignment PIN_AF29 -to hex1[4]
set_location_assignment PIN_AF30 -to hex1[5]
set_location_assignment PIN_AD27 -to hex1[6]
set_location_assignment PIN_AB23 -to hex2[0]
set_location_assignment PIN_AE29 -to hex2[1]
set_location_assignment PIN_AD29 -to hex2[2]
set_location_assignment PIN_AC28 -to hex2[3]
set_location_assignment PIN_AD30 -to hex2[4]
set_location_assignment PIN_AC29 -to hex2[5]
set_location_assignment PIN_AC30 -to hex2[6]
set_location_assignment PIN_AD26 -to hex3[0]
set_location_assignment PIN_AC27 -to hex3[1]
set_location_assignment PIN_AD25 -to hex3[2]
set_location_assignment PIN_AC25 -to hex3[3]
set_location_assignment PIN_AB28 -to hex3[4]
set_location_assignment PIN_AB25 -to hex3[5]
set_location_assignment PIN_AB22 -to hex3[6]
set_location_assignment PIN_AA24 -to hex4[0]
set_location_assignment PIN_Y23 -to hex4[1]
set_location_assignment PIN_Y24 -to hex4[2]
set_location_assignment PIN_W22 -to hex4[3]
set_location_assignment PIN_W24 -to hex4[4]
set_location_assignment PIN_V23 -to hex4[5]
set_location_assignment PIN_W25 -to hex4[6]
set_location_assignment PIN_V25 -to hex5[0]
set_location_assignment PIN_AA28 -to hex5[1]
set_location_assignment PIN_Y27 -to hex5[2]
set_location_assignment PIN_AB27 -to hex5[3]
set_location_assignment PIN_AB26 -to hex5[4]
set_location_assignment PIN_AA26 -to hex5[5]
set_location_assignment PIN_AA25 -to hex5[6]
set_location_assignment PIN_AJ4 -to adc_cs_n
set_location_assignment PIN_AK3 -to adc_dout
set_location_assignment PIN_AK4 -to adc_din
set_location_assignment PIN_AK2 -to adc_sclk
set_location_assignment PIN_A13 -to vga_r[0]
set_location_assignment PIN_C13 -to vga_r[1]
set_location_assignment PIN_E13 -to vga_r[2]
set_location_assignment PIN_B12 -to vga_r[3]
set_location_assignment PIN_C12 -to vga_r[4]
set_location_assignment PIN_D12 -to vga_r[5]
set_location_assignment PIN_E12 -to vga_r[6]
set_location_assignment PIN_F13 -to vga_r[7]
set_location_assignment PIN_J9 -to vga_g[0]
set_location_assignment PIN_J10 -to vga_g[1]
set_location_assignment PIN_H12 -to vga_g[2]
set_location_assignment PIN_G10 -to vga_g[3]
set_location_assignment PIN_G11 -to vga_g[4]
set_location_assignment PIN_G12 -to vga_g[5]
set_location_assignment PIN_F11 -to vga_g[6]
set_location_assignment PIN_E11 -to vga_g[7]
set_location_assignment PIN_B13 -to vga_b[0]
set_location_assignment PIN_G13 -to vga_b[1]
set_location_assignment PIN_H13 -to vga_b[2]
set_location_assignment PIN_F14 -to vga_b[3]
set_location_assignment PIN_H14 -to vga_b[4]
set_location_assignment PIN_F15 -to vga_b[5]
set_location_assignment PIN_G15 -to vga_b[6]
set_location_assignment PIN_AJ16 -to vga_b[7]
set_location_assignment PIN_A11 -to vga_clk
set_location_assignment PIN_F10 -to vga_blank_n
set_location_assignment PIN_B11 -to vga_hsync
set_location_assignment PIN_D11 -to vga_vsync
set_location_assignment PIN_C10 -to vga_sync_n
