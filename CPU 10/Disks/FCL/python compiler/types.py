# datatype Type = Primitive of String | Array of Type | Defined of String | Function of ( TypeList * Type)

class Type:
	def __init__(self,typeClass,value):
		self.typeClass = typeClass
		self.value = value
	@staticmethod
	def compare(type1,type2):
		# (Type * Type -> Bool)
		if type1.typeClass == "Null" or type2.typeClass == "Null":
			return True									# Null value always has the right type
		if type1.typeClass != type2.typeClass: # compares two type
			return False
		if type1.typeClass == 'primitive':
			return type1.value == type2.value
		if type1.typeClass == 'function':
			return compare(type1.value[0],type2.value[0]) and compare(type1.value[1],type2.value[1])
		if type1.typeClass == 'defined':
			return type1.value == type2.value
		if type1.typeClass == 'array':
			return compare(type1.value,type2.value)
		if type1.typeClass == 'list':
			type2 = type2.value
			for type1 in type1.value:
				if type2.type = "Nil":
					return false
				if not(compare(type1.head.value,type2.head.value)): return False
				type2 = type2.tail
			return type2.type == "Nil"
		raise TypeError()

	@staticmethod
	def toString(type1): # renders a type object into a string
		# ( Type -> unit)
		if type1.typeClass in ('primitive','defined'):
			return type1.value
		elif type1.typeClass == 'function':
			return "(" + toString(type1.value[0]) + " -> " + toString(type1.value[0])
		elif type1.typeClass == 'array':
			return toString(type1.value)+ "[]"
		elif type1.typeClass == 'list':
			result = toString(type1.value.head)
			for t in type1.value.tail:
				result += " * "+ toString(t.head)
			return result

class ParseTreeType(Type):
	def __init__(self,parseTreeNode,scope):
		if parseTreeNode.type == "Type": # simple types
			if len(parseTreeNode.children) == 1: # either function types or primitives
				try:
					typeClass = { 					# gets the class
						'FunType':'function'
						'"int"':'primitive'
						'"char"':'primitive'
						'"float"':'primitive'
						'"unit"':'primitive'
						'"bool"':'primitive'
					}[parseTreeNode.children[0].type]
					if typeClass == 'primitive': 				# primitive's value is just name of the type
						value = parseTreeNode.children[0].string
						super(typeClass,value)
					elif typeClass == 'function':
						parseTreeNode = parseTreeNode.children[0] # if it is a function, then we need to look at the function's arguments and parameters
						value = (ParseTreeType(parseTreeNode.children[1],scope),ParseTreeType(parseTreeNode.children[4],scope))
						super(typeClass,value)
					else: raise NodeError()	
				except KeyError:
					raise NodeError()
	
			elif len(parseTreeNode.children) == 2: # defined types contain an id which needs to be checked against the dicitionary of types
				if parseTreeNode.children[0].type == "type":
					typeClass = "defined"
					value = parseTreeNode.children[1].string
					if value in getDefinedTypes(scope):
						super(typeClass,value)
					else: raise NodeError()
				else:
					raise NodeError()
			elif len(parseTreeNode.children) == 3: # primarily array types
				if parseTreeNode.children[1].type == '"["' and parseTreeNode.children[2].type == '"]"':
					typeClass = "array"
					value = ParseTreeType(parseTreeNode.children[0],scope)
					super(typeClass,value)
				else: raise NodeError()

			else:
				raise NodeError()
		elif parseTreeNode.type == "TypeList":
			typeClass = "list"
			value = FunTypeToList(,Nil(),scope)
		else: raise NodeError()
	
def FunTypeToList(parseTreeNode,result,scope):
	# ParseTreeNode -> TypeList
	if parseTreeNode.type != "FunType": raise NodeError()
	elif len(parseTreeNode.children) == 3: # Typelist -> TypeList * Type
		nextNode = parseTreeNode.children[0]
		x = ParseTreeType(parseTreeNode.children[2],scope)
		xs = result
		return FunTypeToList(nextNode,List(x,xs),scope)
	elif len(parseTreeNode) == 1: # TypeList -> Type
		x = ParseTreeType(parseTreeNode.children[0],scope)
		xs = result
		return List(x,xs)
	else raise NodeError()



