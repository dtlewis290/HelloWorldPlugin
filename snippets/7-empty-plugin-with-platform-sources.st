!classDefinition: #HelloExternalWorldPlugin category: 'HelloWorldPlugin-plugin'!
InterpreterPlugin subclass: #HelloExternalWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-plugin'!
!HelloExternalWorldPlugin commentStamp: 'dtl 4/28/2023 22:45:53' prior: 0!
A very simple VM plugin that implements a primitive linked to external platform sources.

To compile the plugin (varies by VM and build system), edit the plugins.ext configuration file, adding HelloExternalWorldPlugin to the list of plugins to be compiled as external modules.

Also provide the external platform code to be executed. Add a header file in platforms/Cross/plugins/HelloExternalWorldPlugin to define functions to be called by the primitive, and implement the functions in (e.g. for unix) /platforms/unix/plugins/HelloExternalWorldPlugin.

The build systems for different VMs may need to be adjusted. The build system for the traditional (old) squeakvm.org VM uses a build system based on Cmake, and probably will require little or no adjustment. Requirements for opensmalltalk-vm may vary, see existing plugins in the platforms directory for examples.
!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HelloExternalWorldPlugin class' category: 'HelloWorldPlugin-plugin'!
HelloExternalWorldPlugin class
	instanceVariableNames: ''!

!HelloExternalWorldPlugin class methodsFor: 'translation' stamp: 'dtl 4/28/2023 18:55:32'!
declareCVarsIn: aCCodeGenerator

	super declareCVarsIn: aCCodeGenerator.
	aCCodeGenerator addHeaderFile: '<string.h>'.
! !

!HelloExternalWorldPlugin class methodsFor: 'translation' stamp: 'dtl 4/28/2023 17:59:50'!
hasHeaderFile
	^true! !

BrowserWindow fullOnClass: HelloExternalWorldPlugin !

