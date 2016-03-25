"
Utility class to open a webbrowser
"
Class {
	#name : #FGBBrowserHelper,
	#superclass : #Object,
	#category : #'FogBugz-Tools-Utilities'
}

{ #category : #operating }
FGBBrowserHelper class >> openBrowserOn: url [

	Smalltalk os isUnix ifTrue: [ ^self unixBrowse: url ].
	Smalltalk os isWindows ifTrue: [ ^self winBrowse: url ].
	self error: 'Browsing for platform not implemented'
]

{ #category : #'private - windows' }
FGBBrowserHelper class >> shellExecute: lpOperation file: lpFile parameters: lpParameters directory: lpDirectory show: nShowCmd [
	
	^self ffiCall: #( 
			FFIConstantHandle ShellExecuteA(
     				0,
     				String* lpOperation,
         			String* lpFile,
     				String* lpParameters,
     				String* lpDirectory,
        			int nShowCmd)) module: #shell32
	

]

{ #category : #'private - linux' }
FGBBrowserHelper class >> system: command [
	
	 ^self ffiCall: #(int system(char* command) ) 
			  module: LibC
]

{ #category : #'private - linux' }
FGBBrowserHelper class >> unixBrowse: url [

	^self system: 'xdg-open ',url,' &'
]

{ #category : #'private - windows' }
FGBBrowserHelper class >> winBrowse: url [
	"
	self winBrowse: 'http://www.pharo-project.org'
	"
	^self shellExecute: 'open' file: url parameters: '' directory: '' show: 5 "SW_SHOW"
]
