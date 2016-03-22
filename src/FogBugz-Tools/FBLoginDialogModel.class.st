"
Login dialog
"
Class {
	#name : #FBLoginDialogModel,
	#superclass : #ComposableModel,
	#instVars : [
		'usernameLabel',
		'usernameField',
		'passwordLabel',
		'passwordField'
	],
	#category : #'FogBugz-Tools-Dialogs'
}

{ #category : #specs }
FBLoginDialogModel class >> defaultSpec [
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
FBLoginDialogModel class >> getCredentials [
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
FBLoginDialogModel >> credentials [
  ^ usernameField text -> passwordField text

]

{ #category : #defaults }
FBLoginDialogModel >> initialExtent [
  ^ 350 @ 150
]

{ #category : #'initialization widgets' }
FBLoginDialogModel >> initializeWidgets [
  usernameLabel := self newLabel.
  usernameLabel label: 'Username'.
  usernameField := self newTextInput.
  usernameField autoAccept: true; ghostText: 'pharo@fogbugz.com'.
  passwordLabel := self newLabel.
  passwordLabel label: 'Password'; yourself.
  passwordField := self newTextInput.
  passwordField beEncrypted; autoAccept: true; ghostText: '******'.
  self focusOrder add: usernameField; add: passwordField
]

{ #category : #accessing }
FBLoginDialogModel >> passwordField [
	^ passwordField
]

{ #category : #accessing }
FBLoginDialogModel >> passwordField: anObject [
	passwordField := anObject
]

{ #category : #accessing }
FBLoginDialogModel >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
FBLoginDialogModel >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #defaults }
FBLoginDialogModel >> title [
  ^ 'Login'
]

{ #category : #accessing }
FBLoginDialogModel >> usernameField [
	^ usernameField
]

{ #category : #accessing }
FBLoginDialogModel >> usernameField: anObject [
	usernameField := anObject
]

{ #category : #accessing }
FBLoginDialogModel >> usernameLabel [
	^ usernameLabel
]

{ #category : #accessing }
FBLoginDialogModel >> usernameLabel: anObject [
	usernameLabel := anObject
]
