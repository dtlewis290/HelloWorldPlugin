
!HelloExternalWorldPlugin methodsFor: 'primitives' stamp: 'dtl 4/28/2023 22:26:40'!
primitiveCallLibraryFunctionThatAnswersCString
	"This primitive links to a function in a compiled external code
	module. The function answers a C string 'Hello world!!'. Allocate
	a String object in the object memory, copy the C string data into the
	data portion of that object, and push the object onto the stack to
	return it to the image."

	| cstring len stringObject stringObjectData |
	<export: true>
	<var: 'cstring' type: 'char *'>
	<var: 'stringObjectData' type: 'char *'>
	cstring := self helloworld. "undeclared, will translate to helloworld()"
	len := self strn: cstring len: 200. "undeclared, will translate to strnlen(cstring, 200)"
	stringObject := interpreterProxy
		instantiateClass: interpreterProxy classString 
		indexableSize: len.
	stringObjectData := interpreterProxy arrayValueOf: stringObject.
	self st: stringObjectData rn: cstring cpy: len. "undeclared, will translate to strncpy()"
	interpreterProxy pop: 1; push: stringObject.
! !

