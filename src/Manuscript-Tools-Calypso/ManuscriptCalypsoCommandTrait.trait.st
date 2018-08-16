"
A trait to be reused by Manuscript commands
"
Trait {
	#name : #ManuscriptCalypsoCommandTrait,
	#category : #'Manuscript-Tools-Calypso-Traits'
}

{ #category : #defaults }
ManuscriptCalypsoCommandTrait classSide >> defaultMenuItemName [
	^ 'Open case on Manuscript'
]

{ #category : #defaults }
ManuscriptCalypsoCommandTrait classSide >> itemOrder [
	^ 21
]

{ #category : #defaults }
ManuscriptCalypsoCommandTrait >> defaultMenuIcon [

	^ManuscriptIconCache manuscriptIcon
]
