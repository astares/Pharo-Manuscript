Extension { #name : #ManuscriptClient }

{ #category : #'*Manuscript-Tools' }
ManuscriptClient class >> getWorkingClientByAskingUser [
	| potentialCredentials client |
	client := nil.
	potentialCredentials := ManuscriptSettings credentials.
	[ client isNil ] whileTrue: [
		potentialCredentials ifNil: [ potentialCredentials := ManuscriptLoginPresenter getCredentials ].
		potentialCredentials ifNil: [ ManuscriptUserCancelledLogin signal ].
		[ client := self loginUser: potentialCredentials username password: potentialCredentials password.		
		  ManuscriptSettings 
				useCredentials: true;
				credentials: potentialCredentials ]
			on: Error
			do: [ :err |
				potentialCredentials := nil.
				UIManager default alert: err messageText title: 'Could not log into Manuscript.' ] ].
	^ client
]
