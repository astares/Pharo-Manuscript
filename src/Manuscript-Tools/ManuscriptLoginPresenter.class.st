"
Login dialog
"
Class {
	#name : #ManuscriptLoginPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'usernameLabel',
		'usernameField',
		'passwordLabel',
		'passwordField'
	],
	#category : #'Manuscript-Tools-Dialogs'
}

{ #category : #specs }
ManuscriptLoginPresenter class >> defaultSpec [
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
ManuscriptLoginPresenter class >> getCredentials [
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
ManuscriptLoginPresenter >> credentials [
	^ ManuscriptCredentials username: usernameField text password: passwordField text
]

{ #category : #defaults }
ManuscriptLoginPresenter >> initialExtent [
  ^ 350 @ 150
]

{ #category : #'initialization widgets' }
ManuscriptLoginPresenter >> initializeFromSettings [

	ManuscriptSettings useCredentials ifFalse: [ ^false ].
	ManuscriptSettings credentials username
		ifNotEmpty: [:x | usernameField text: x ].
	ManuscriptSettings credentials password
		ifNotEmpty: [:x | passwordField text: x ]	
	
]

{ #category : #'initialization widgets' }
ManuscriptLoginPresenter >> initializeWidgets [
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
ManuscriptLoginPresenter >> passwordField [
	^ passwordField
]

{ #category : #accessing }
ManuscriptLoginPresenter >> passwordField: anObject [
	passwordField := anObject
]

{ #category : #accessing }
ManuscriptLoginPresenter >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
ManuscriptLoginPresenter >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #defaults }
ManuscriptLoginPresenter >> title [
  ^ 'Manuscript Login'
]

{ #category : #accessing }
ManuscriptLoginPresenter >> usernameField [
	^ usernameField
]

{ #category : #accessing }
ManuscriptLoginPresenter >> usernameField: anObject [
	usernameField := anObject
]

{ #category : #accessing }
ManuscriptLoginPresenter >> usernameLabel [
	^ usernameLabel
]

{ #category : #accessing }
ManuscriptLoginPresenter >> usernameLabel: anObject [
	usernameLabel := anObject
]
