!HelloWorldPlugin methodsFor: 'primitives' stamp: 'dtl 4/27/2023 21:07:45'!
primitiveCountStackParameters
	"Parameters are passed on the stack. Try calling this primitive with different
	numbers of parameters. Note that it is important for your primitive implementation
	to keep the stack balanced, so pop the arguments before returning."

	<export: true>
	| argumentCount |
	argumentCount := interpreterProxy methodArgumentCount.
	interpreterProxy pop: argumentCount + 1. "arguments plus receiver"
	interpreterProxy pushInteger: argumentCount
! !

