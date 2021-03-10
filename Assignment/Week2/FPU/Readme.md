FPU
===
The FPU consists of the following files:
		verilog/fpu.v
		verilog/pre_norm.v
		verilog/primitives.v
		verilog/post_norm.v
		verilog/except.v",
		verilog/pre_norm_fmul.v
(fpu.v is the top level)

The testbench is in: test_bench/test_top.v

To simulate the FPU using the included test bench
use a comand like:

verilog		test_bench/test_top.v	\
		verilog/fpu.v		\
		verilog/pre_norm.v	\
		verilog/primitives.v	\
		verilog/post_norm.v	\
		verilog/except.v	\
		verilog/pre_norm_fmul.v

MISC
====
Do not change the directory structure, the testbench
depends on it !
