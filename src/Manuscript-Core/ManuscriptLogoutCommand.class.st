"
Logout from Fogbugz
"
Class {
	#name : #ManuscriptLogoutCommand,
	#superclass : #ManuscriptTokenCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #conversion }
ManuscriptLogoutCommand >> asJSONString [

	^'{"cmd": "logoff","token": "<1s>"}' expandMacrosWith: token asString
]
