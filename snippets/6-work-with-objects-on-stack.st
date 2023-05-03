
!HelloWorldPlugin methodsFor: 'primitives' stamp: 'dtl 4/27/2023 22:40:39'!
primitiveObjectsOnTheStack
	"Some reasonable error handling should be done when manipulating
	objects on the stack. For this primitive, require two arguments. The
	first must be an array, and the second can be any object. Populate
	the array with the object and answer the number of array elements
	changed."

	<export: true>
	| argumentCount theArray arraySize theObject count |
	argumentCount := interpreterProxy methodArgumentCount.
	argumentCount = 2
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	theObject := interpreterProxy stackValue: 0.
	theArray := interpreterProxy stackValue: 1.
	(interpreterProxy isArray: theArray)
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	arraySize := interpreterProxy stSizeOf: theArray.
	count := 0.
	[count < arraySize]
		whileTrue: [ "pardon my FORTRAN but Slang has some limitations"
			count := count + 1.
			interpreterProxy stObject: theArray at: count put: theObject].
	interpreterProxy pop: 3; pushInteger: arraySize.
! !

