!HelloWorldPlugin methodsFor: 'primitives' stamp: 'dtl 4/27/2023 15:19:21'!
primitivePrintHello
	"Enter the primitive, print a message to the external console, and
	return without doing anything else."

	<export: true>
	self
		cCode: 'printf("Hello world!!\n")';
		cCode: 'fflush(stdout)'.! !
