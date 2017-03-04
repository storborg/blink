flash: blink.bin
	iceprog blink.bin

blink.blif: blink.v
	yosys -p "synth_ice40 -blif blink.blif" blink.v

blink.txt: blink.blif icestick.pcf
	arachne-pnr -d 1k -p icestick.pcf blink.blif -o blink.txt

blink.bin: blink.txt
	icepack blink.txt blink.bin
