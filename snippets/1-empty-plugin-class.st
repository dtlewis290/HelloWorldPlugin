!classDefinition: #HelloWorldPlugin category: 'HelloWorldPlugin-plugin'!
InterpreterPlugin subclass: #HelloWorldPlugin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HelloWorldPlugin-plugin'!
!HelloWorldPlugin commentStamp: 'dtl 4/28/2023 22:46:06' prior: 0!
HelloWorldPlugin is a "Hello world!!" VM plugin that provides some simple primitives as examples. The example primitives do nothing useful, but illustrate the basics of passing objects from the image on the interpreter stack, accessing the stack in a primitive, pushing result objects to the stack, and error handling.

To translate the plugin to C code:

	HelloWorldPlugin translateInDirectory: DirectoryEntry currentDirectory doInlining: true.

To compile the plugin (varies by VM and build system), edit the plugins.ext configuration file, adding HelloWorldPlugin to the list of plugins to be compiled as external modules.

Then (for example), the plugin C code might be translated directly into the src/plugins directory:

	HelloWorldPlugin translateInDirectory: (DirectoryEntry withPathName: './src/plugins/HelloWorldPlugin') doInlining: true.!

BrowserWindow fullOnClass: HelloWorldPlugin !



