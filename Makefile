# Makefile automatically generated by ghdl
# Version: GHDL 0.36 (tarball) [Dunoon edition] - llvm code generator
# Command used to generate this makefile:
# ghdl --gen-makefile --ieee=synopsys --warn-no-vital-generic --workdir=simu --work=work slr8bits_test

GHDL=ghdl
GHDLFLAGS= --ieee=synopsys --workdir=simu --work=work

# Default target
all: slr8bits_test

# Elaboration target
slr8bits_test: /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164.o /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164_body.o /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std.o /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std-body.o simu/w03_d3_test.o simu/w03_d3_shift_register.o
	$(GHDL) -e $(GHDLFLAGS) $@

# Run target
run: slr8bits_test
	$(GHDL) -r slr8bits_test $(GHDLRUNFLAGS) --stop-time=1000ns --vcd=out.vcd

# Targets to analyze files
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164.o: /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/../../src/ieee/std_logic_1164.v93
	@echo "This file was not locally built ($<)"
	exit 1
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164_body.o: /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/../../src/ieee/std_logic_1164_body.v93
	@echo "This file was not locally built ($<)"
	exit 1
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std.o: /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/../../src/ieee/numeric_std.v93
	@echo "This file was not locally built ($<)"
	exit 1
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std-body.o: /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/../../src/ieee/numeric_std-body.v93
	@echo "This file was not locally built ($<)"
	exit 1
simu/w03_d3_test.o: testbench/w03_d3_test.vhd
	$(GHDL) -a $(GHDLFLAGS) $<
simu/w03_d3_shift_register.o: src/w03_d3_shift_register.vhd
	$(GHDL) -a $(GHDLFLAGS) $<

# Files dependences
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164.o: 
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164_body.o:  /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164.o
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std.o:  /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164.o
/Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std-body.o:  /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std.o
simu/w03_d3_test.o:  /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164.o /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164_body.o /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std.o /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/numeric_std-body.o
simu/w03_d3_shift_register.o:  /Users/biplavkarna/mydocs/ghdl-0.36-macosx-llvm/lib/ghdl/synopsys/v93/std_logic_1164.o
