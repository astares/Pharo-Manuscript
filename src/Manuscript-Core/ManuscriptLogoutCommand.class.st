"
Logout from Fogbugz
"
Class {
	#name : #ManuscriptLogoutCommand,
	#superclass : #ManuscriptTokenCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #printing }
ManuscriptLogoutCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "logoff","token": "<1s>"}' expandMacrosWith: token asString)
]
