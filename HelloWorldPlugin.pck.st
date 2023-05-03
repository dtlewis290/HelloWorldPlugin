'From Cuis 6.0 [latest update: #5772] on 2 May 2023 at 9:14:30 pm'!
'Description '!
!provides: 'HelloWorldPlugin' 1 0!
SystemOrganization addCategory: 'HelloWorldPlugin-plugin'!
SystemOrganization addCategory: 'HelloWorldPlugin-running'!


!classDefinition: #TryHelloExternalWorldPlugin category: 'HelloWorldPlugin-running'!
Object subclass: #TryHelloExternalWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-running'!
!classDefinition: 'TryHelloExternalWorldPlugin class' category: 'HelloWorldPlugin-running'!
TryHelloExternalWorldPlugin class
	instanceVariableNames: ''!

!classDefinition: #TryHelloWorldPlugin category: 'HelloWorldPlugin-running'!
Object subclass: #TryHelloWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-running'!
!classDefinition: 'TryHelloWorldPlugin class' category: 'HelloWorldPlugin-running'!
TryHelloWorldPlugin class
	instanceVariableNames: ''!

!classDefinition: #HelloExternalWorldPlugin category: 'HelloWorldPlugin-plugin'!
ProtoObject subclass: #HelloExternalWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-plugin'!
!classDefinition: 'HelloExternalWorldPlugin class' category: 'HelloWorldPlugin-plugin'!
HelloExternalWorldPlugin class
	instanceVariableNames: ''!

!classDefinition: #HelloWorldPlugin category: 'HelloWorldPlugin-plugin'!
ProtoObject subclass: #HelloWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-plugin'!
!classDefinition: 'HelloWorldPlugin class' category: 'HelloWorldPlugin-plugin'!
HelloWorldPlugin class
	instanceVariableNames: ''!


!TryHelloExternalWorldPlugin commentStamp: 'dtl 4/28/2023 22:32:43' prior: 0!
Call primitives in the HelloExternalWorldPlugin VM module:

	TryHelloExternalWorldPlugin answerHelloToTheImage
!

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

!HelloExternalWorldPlugin commentStamp: 'dtl 4/28/2023 22:45:53' prior: 0!
A very simple VM plugin that implements a primitive linked to external platform sources.

To compile the plugin (varies by VM and build system), edit the plugins.ext configuration file, adding HelloExternalWorldPlugin to the list of plugins to be compiled as external modules.

Also provide the external platform code to be executed. Add a header file in platforms/Cross/plugins/HelloExternalWorldPlugin to define functions to be called by the primitive, and implement the functions in (e.g. for unix) /platforms/unix/plugins/HelloExternalWorldPlugin.

The build systems for different VMs may need to be adjusted. The build system for the traditional (old) squeakvm.org VM uses a build system based on Cmake, and probably will require little or no adjustment. Requirements for opensmalltalk-vm may vary, see existing plugins in the platforms directory for examples.
!

!HelloWorldPlugin commentStamp: 'dtl 4/28/2023 22:46:06' prior: 0!
HelloWorldPlugin is a "Hello world!!" VM plugin that provides some simple primitives as examples. The example primitives do nothing useful, but illustrate the basics of passing objects from the image on the interpreter stack, accessing the stack in a primitive, pushing result objects to the stack, and error handling.

To translate the plugin to C code:

	HelloWorldPlugin translateInDirectory: DirectoryEntry currentDirectory doInlining: true.

To compile the plugin (varies by VM and build system), edit the plugins.ext configuration file, adding HelloWorldPlugin to the list of plugins to be compiled as external modules.

Then (for example), the plugin C code might be translated directly into the src/plugins directory:

	HelloWorldPlugin translateInDirectory: (DirectoryEntry withPathName: './src/plugins/HelloWorldPlugin') doInlining: true.!

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

!HelloExternalWorldPlugin class methodsFor: 'translation' stamp: 'dtl 4/28/2023 18:55:32'!
declareCVarsIn: aCCodeGenerator

	super declareCVarsIn: aCCodeGenerator.
	aCCodeGenerator addHeaderFile: '<string.h>'.
! !

!HelloExternalWorldPlugin class methodsFor: 'translation' stamp: 'dtl 4/28/2023 17:59:50'!
hasHeaderFile
	^true! !

!HelloWorldPlugin methodsFor: 'primitives' stamp: 'dtl 4/27/2023 17:02:59'!
primitiveAnswerTrue
	"Return an object to the image. The VM knows how to find the
	singleton true object (it is in the special objects array, shared
	between the image and the VM). A plugin can talk to the VM through
	the InterpreterProxy to find the true object. This primitive will pop
	one item (self, the sender of the primitive), then push the true
	object back onto the stack."

	<export: true>
	interpreterProxy pop: 1 thenPush: interpreterProxy trueObject
! !

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

!HelloWorldPlugin methodsFor: 'primitives' stamp: 'dtl 4/27/2023 10:38:32'!
primitiveDoNothingAtAll

	<export: true>
! !

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

!HelloWorldPlugin methodsFor: 'primitives' stamp: 'dtl 4/27/2023 15:19:21'!
primitivePrintHello
	"Enter the primitive, print a message to the external console, and
	return without doing anything else."

	<export: true>
	self
		cCode: 'printf("Hello world!!\n")';
		cCode: 'fflush(stdout)'.! !
