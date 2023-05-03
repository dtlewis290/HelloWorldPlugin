
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

