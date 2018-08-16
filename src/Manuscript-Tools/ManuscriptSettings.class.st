"
Personal settings for issue tracker
"
Class {
	#name : #ManuscriptSettings,
	#superclass : #Object,
	#classVars : [
		'Credentials',
		'StoreCredentials',
		'UseCredentials'
	],
	#category : #'Manuscript-Tools-Settings'
}

{ #category : #settings }
ManuscriptSettings class >> credentialSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #useCredentials)
		parent: #Manuscript;
		noOrdering;
		target: self;
		label: 'Store Credentials';
		description: 'Check if you want to have issue tracker credentials stored';
		with: [ (aBuilder setting: #username)
				target: self;
				targetSelector: #credentials;
				label: 'Username';
				description: 'Username to login to issue tracker'.
			(aBuilder setting: #password)
				target: self;
				targetSelector: #credentials;
				type: #Password;
				label: 'Password';
				description: 'Password to login to issue tracker' ]
]

{ #category : #'private - accessing' }
ManuscriptSettings class >> credentials [
	^Credentials ifNil: [ Credentials := ManuscriptCredentials new ]
]

{ #category : #'private - accessing' }
ManuscriptSettings class >> credentials: credentials [
	Credentials := credentials 
]

{ #category : #'class initialization' }
ManuscriptSettings class >> initialize [
	self reset
]

{ #category : #'initialize - release' }
ManuscriptSettings class >> reset [
	<script>
	
	Credentials := nil.
	StoreCredentials := false 
]

{ #category : #settings }
ManuscriptSettings class >> settingsOn: aBuilder [ 
	<systemsettings>
	(aBuilder group: #Manuscript)
		label: 'Manuscript';
		noOrdering; 
		parent: #tools;
		description: 'All Pharo issue tracker related settings'
]

{ #category : #accessing }
ManuscriptSettings class >> useCredentials [
	^UseCredentials ifNil: [ UseCredentials := false ]
]

{ #category : #accessing }
ManuscriptSettings class >> useCredentials: aBoolean [
 
	UseCredentials := aBoolean 
]
