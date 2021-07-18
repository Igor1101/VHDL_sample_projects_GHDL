GHDL?=ghdl
GHDLFLAGS?=
TARGET?=target

test: $(MODULES)
	$(GHDL) -r $(TARGET) --vcd=$(TARGET).vcd

# Binary depends on the object file
%: %.o
	$(GHDL) -e $(GHDLFLAGS) $@

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a $(GHDLFLAGS) $<

clean:
	echo "Cleaning up..."
	rm -f *.o *_testbench $(TARGET) work*.cf e*.lst *.vcd
view:
	gtkwave $(TARGET).vcd
