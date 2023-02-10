#NAME is the name of the top_module which should be inside the file top_module.v

SRC = SPI_Slave.v
SRC_TB = SPI_Slave_TB.v
NAME= $(basename $(SRC))

sim: $(NAME)

$(NAME): $(SRC_TB)
	#iverilog -g2005-sv -o $(NAME) $(SRC) $(SRC_TB)
	iverilog -g2005-sv -o $(NAME) $(SRC_TB)
	vvp $(NAME)

plot: $(NAME) dump.vcd
	gtkwave dump.vcd

bin: $(SRC_TB)
	@echo Synthetize	
	yosys -p 'synth_ice40 -top $(NAME) -blif $(NAME).blif' $(SRC)
	@echo Place and Route
	arachne-pnr -d 8k -P cm81 -o $(NAME).asc -p pins.pcf $(NAME).blif
	@echo bitfile
	icepack $(NAME).asc $(NAME).bin

time: 	$(NAME).asc
	icetime -d lp8k -mtr $(NAME).rpt $(NAME).asc
	

upload: $(NAME).bin
	tinyprog -p $(NAME).bin
clean: 
	rm -rf $(NAME) *.asc *.rpt *.blif *.bin *.vcd

