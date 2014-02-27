import CPU

memory_dict = {
			0:3,1:9,2:0,3:0,4:128,5:0,6:0,7:16,
			16:5,17:255,18:4,19:132
			}



CPU_instance = CPU.CPU(memory_dict)
CPU_instance.run()
print CPU_instance.Registers.registers[9].data