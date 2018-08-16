"
Logout from Fogbugz
"
Class {
	#name : #FGBLogoutCommand,
	#superclass : #FGBTokenCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #printing }
FGBLogoutCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "logoff","token": "<1s>"}' expandMacrosWith: token asString)
]
