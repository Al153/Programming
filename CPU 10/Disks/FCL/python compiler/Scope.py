# A scope is a list of namespaces

def scopeLookup(scope,name):
	found = False
	for nameSpace in scope[::-1]:
		if nameSpace.containsName(name):
			return nameSpace.getValue(name)



