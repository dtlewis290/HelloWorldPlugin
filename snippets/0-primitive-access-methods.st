!classDefinition: #TryHelloExternalWorldPlugin category: 'HelloWorldPlugin-running'!
Object subclass: #TryHelloExternalWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-running'!
!TryHelloExternalWorldPlugin commentStamp: 'dtl 4/28/2023 22:32:43' prior: 0!
Call primitives in the HelloExternalWorldPlugin VM module:

	TryHelloExternalWorldPlugin answerHelloToTheImage
!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TryHelloExternalWorldPlugin class' category: 'HelloWorldPlugin-running'!
TryHelloExternalWorldPlugin class
	instanceVariableNames: ''!

!TryHelloExternalWorldPlugin class methodsFor: 'primitive access' stamp: 'dtl 4/28/2023 22:29:23'!
answerHelloToTheImage
	"Call a primitive that links to compiled external code. The external
	function answers a C string 'Hello world!!'. Let the primitive allocate
	a String object in the object memory, copy the C string data into the
	data portion of that object, and push the object onto the stack to
	return it to the image."

	"TryHelloExternalWorldPlugin answerHelloToTheImage"
	
	<primitive: 'primitiveCallLibraryFunctionThatAnswersCString' module: 'HelloExternalWorldPlugin'>
	self primitiveFailed! !


!classDefinition: #TryHelloWorldPlugin category: 'HelloWorldPlugin-running'!
Object subclass: #TryHelloWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-running'!
!TryHelloWorldPlugin commentStamp: 'dtl 4/28/2023 23:13:03' prior: 0!
Call primitives in the HelloPlugin VM module:

	TryHelloWorldPlugin doNothing.
	TryHelloWorldPlugin printHelloOnConsole.
	TryHelloWorldPlugin returnTheTrueObjectFromVMObjectMemoryOnTheStack.
	TryHelloWorldPlugin callWithNoArguments.
	TryHelloWorldPlugin callWith: 3 with: Array new with: 'aString'.
	TryHelloWorldPlugin populateArray: (Array new: 10) with: 'A string to put into the array slots'.
	
	| array result |
	array := Array new: 20.
	result := TryHelloWorldPlugin populateArray: array with: 'A string to put into the array slots'.
	{ array . result } explore.!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TryHelloWorldPlugin class' category: 'HelloWorldPlugin-running'!
TryHelloWorldPlugin class
	instanceVariableNames: ''!

!TryHelloWorldPlugin class methodsFor: 'primitive access' stamp: 'dtl 4/28/2023 23:12:07'!
callWith: arg1 with: arg2 with: arg3
	"TryHelloWorldPlugin callWith: 3 with: Array new with: 'aString' "
	
	<primitive: 'primitiveCountStackParameters' module: 'HelloWorldPlugin'>
	self primitiveFailed! !

!TryHelloWorldPlugin class methodsFor: 'primitive access' stamp: 'dtl 4/28/2023 23:12:13'!
callWithNoArguments
	"TryHelloWorldPlugin callWithNoArguments"
	
	<primitive: 'primitiveCountStackParameters' module: 'HelloWorldPlugin'>
	self primitiveFailed! !

!TryHelloWorldPlugin class methodsFor: 'primitive access' stamp: 'dtl 4/28/2023 23:12:18'!
doNothing
	"TryHelloWorldPlugin doNothing"
	
	<primitive: 'primitiveDoNothingAtAll' module: 'HelloWorldPlugin'>
	self primitiveFailed! !

!TryHelloWorldPlugin class methodsFor: 'primitive access' stamp: 'dtl 4/28/2023 23:12:26'!
populateArray: array with: object

	"| array result |
	array := Array new: 20.
	result := TryHelloWorldPlugin populateArray: array with: 'A string to put into the array slots'.
	{ array . result } explore"
	
	<primitive: 'primitiveObjectsOnTheStack' module: 'HelloWorldPlugin'>
	self primitiveFailed
	! !

!TryHelloWorldPlugin class methodsFor: 'primitive access' stamp: 'dtl 4/28/2023 23:12:33'!
printHelloOnConsole
	"TryHelloWorldPlugin printHelloOnConsole"
	
	<primitive: 'primitivePrintHello' module: 'HelloWorldPlugin'>
	self primitiveFailed! !

!TryHelloWorldPlugin class methodsFor: 'primitive access' stamp: 'dtl 4/28/2023 23:12:39'!
returnTheTrueObjectFromVMObjectMemoryOnTheStack
	"TryHelloWorldPlugin returnTheTrueObjectFromVMObjectMemoryOnTheStack"
	
	<primitive: 'primitiveAnswerTrue' module: 'HelloWorldPlugin'>
	self primitiveFailed! !
