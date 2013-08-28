class Register:
	def __init__(self,bitlength,sign_flag,writeable_flag,preloaded_value,flag_reg_flag):
		#value input and output are (-s,data)
		self.value = preloaded_value
		self.value_limit = (2**bitlength)-1
		self.writeable_flag = writeable_flag
		self.flag_reg_flag = flag_reg_flag
		self.sign_flag = sign_flag

	def write(self,value,overwrite_flag,keep_dest_sign):
		#print value
		if not self.writeable_flag:
			pass

		elif self.flag_reg_flag:
			if overwrite_flag:
				self.value = value
			else:
				self.value = self.value^value

		elif self.sign_flag:
			if keep_dest_sign:
				if self.value < 0:
					self.value = 0-(abs(value)&self.value_limit)
				else:
					self.value = abs(value)&self.value_limit
			else:
				self.value = value
				if self.value<0:
					if self.value<= -self.value_limit:
						self.value += self.value_limit
				else:
					self.value = self.value&self.value_limit
		else:
			self.value = self.value&self.value_limit
				

	def read(self,clear_flag,abs_flag):
		out = self.value
		if abs_flag:
		 out = abs(out)
		if clear_flag:
			self.value = 0
		return out

	def clear(self,bitaddr):
		bitaddr = 15 - bitaddr
		mask = 0xffff-(1<<bitaddr)
		self.value = self.value&mask

	def toggle(self,value):
		self.value = self.value^value

	def test(self,bitaddr,dont_clear_bit):
		bitaddr = 15-bitaddr
		if (self.value>>bitaddr)&1:
			if not dont_clear_bit:
				mask = 0xffff-(1<<bitaddr)
				self.value = self.value&mask
			return True
		else:
			return False