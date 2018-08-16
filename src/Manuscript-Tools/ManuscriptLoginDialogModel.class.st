"
Login dialog
"
Class {
	#name : #ManuscriptLoginDialogModel,
	#superclass : #ComposableModel,
	#instVars : [
		'usernameLabel',
		'usernameField',
		'passwordLabel',
		'passwordField'
	],
	#category : #'Manuscript-Tools-Dialogs'
}

{ #category : #specs }
ManuscriptLoginDialogModel class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newColumn: [ :col |
        col 
          newRow: [ :row | 
            row 
              add: #usernameLabel width: 80; 
              add: #usernameField ]
          height: self inputTextHeight;
          newRow: [ :row | 
            row 
              add: #passwordLabel width: 80; 
              add: #passwordField ]
          height: self inputTextHeight ];
       yourself
]

{ #category : #'instance creation' }
ManuscriptLoginDialogModel class >> getCredentials [
	"self getCredentials"
	<script>
	
  | login dialog |
  login := self new.
  dialog := login openDialogWithSpec.
  dialog modalRelativeTo: self currentWorld.
  dialog cancelled ifTrue: [ ^ nil ].
  ^ login credentials
]

{ #category : #defaults }
ManuscriptLoginDialogModel >> credentials [
  ^ usernameField text -> passwordField text

]

{ #category : #defaults }
ManuscriptLoginDialogModel >> initialExtent [
  ^ 350 @ 150
]

{ #category : #'initialization widgets' }
ManuscriptLoginDialogModel >> initializeFromSettings [

	ManuscriptSettings useCredentials ifFalse: [ ^false ].
	ManuscriptSettings credentials username
		ifNotEmpty: [:x | usernameField text: x ].
	ManuscriptSettings credentials password
		ifNotEmpty: [:x | passwordField text: x ]	
	
]

{ #category : #'initialization widgets' }
ManuscriptLoginDialogModel >> initializeWidgets [
  usernameLabel := self newLabel.
  usernameLabel label: 'Username'.
  usernameField := self newTextInput.
  usernameField autoAccept: true; ghostText: 'pharo@manuscript.com'.
  passwordLabel := self newLabel.
  passwordLabel label: 'Password'.
  passwordField := self newTextInput.
  passwordField beEncrypted; autoAccept: true; ghostText: '******'.
  self focusOrder add: usernameField; add: passwordField.
  self initializeFromSettings
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> passwordField [
	^ passwordField
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> passwordField: anObject [
	passwordField := anObject
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #defaults }
ManuscriptLoginDialogModel >> title [
  ^ 'Manuscript Login'
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> usernameField [
	^ usernameField
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> usernameField: anObject [
	usernameField := anObject
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> usernameLabel [
	^ usernameLabel
]

{ #category : #accessing }
ManuscriptLoginDialogModel >> usernameLabel: anObject [
	usernameLabel := anObject
]
