"
A browser for Fogbugz cases
"
Class {
	#name : #FogBugzBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'client',
		'caseModel',
		'toolBar'
	],
	#category : #'FogBugz-Tools-UI'
}

{ #category : #spec }
FogBugzBrowser class >> contentSpec [
	<spec>
	| searchBarOffset delta |
	searchBarOffset := 5 + StandardFonts defaultFont height + 10.
	delta := 25.
	^SpecLayout composed 
		add: #caseModel origin: 0@0 corner: 1@1 offsetOrigin: 0@searchBarOffset offsetCorner: 0@0;
		add: #caseSearchField origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@searchBarOffset
]

{ #category : #spec }
FogBugzBrowser class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newColumn: [ :c | 
			c 
				add: #toolBar height: self toolbarHeight;
				add: self contentSpec ];	
		yourself
]

{ #category : #accessing }
FogBugzBrowser class >> icon [

	^FGBIconCache fogBugzIcon
]

{ #category : #menu }
FogBugzBrowser class >> menuCommandOn: aBuilder [
	<worldMenu> 		 
		
	(aBuilder item: #'FogBugz Browser')	 	 
		action: [ self open ]; 
		icon: self icon.
	aBuilder withSeparatorAfter.		
]

{ #category : #'instance creation' }
FogBugzBrowser class >> open [
	<script>
	
	(self basicNew)	 
		initialize;
		openWithSpec 
]

{ #category : #'private - accessing' }
FogBugzBrowser >> caseModel [

	^caseModel
]

{ #category : #'private - accessing' }
FogBugzBrowser >> caseModel: anObject [
	caseModel := anObject
]

{ #category : #'private - accessing' }
FogBugzBrowser >> caseSearchField [
	
	^ SearchMorph new
		model: self;
		setIndexSelector: #caseSearchAccept:; 
		updateSelector: #caseSearchAccept:;
		searchList: #();
		asSpecAdapter
]

{ #category : #'private - accessing' }
FogBugzBrowser >> iconProvider [

	^FGBIconCache 
]

{ #category : #initialization }
FogBugzBrowser >> initialExtent [

	^800@500
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeToolBar [

	toolBar := MenuModel new
		addGroup: [ :group |			 
			group addItem: [ :item |
				item
					name: nil;
					description: 'Login';
					icon: (self iconProvider fogBugzLoginIcon);
					action: [ self login ] ].
			group addItem: [ :item |
				item
					name: nil;
					description: 'Logout';
					icon: (self iconProvider fogBugzLogoutIcon);
					action: [ self logout ] ].	
			group addItem: [ :item |
				item
					name: nil;
					description: 'Search';
					icon: (self iconProvider fogBugzSearchIcon);
					action: [ self search ] ].	
					
			 
		 
		].
		
	toolBar applyTo: self.
]

{ #category : #'initialization widgets' }
FogBugzBrowser >> initializeWidgets [
	self initializeToolBar.
	caseModel := self instantiate: IconListModel.
]

{ #category : #'private - actions' }
FogBugzBrowser >> login [

	|cr fog|
	cr :=	FGBLoginDialogModel getCredentials.
	cr ifNil: [ ^self ].
	fog := FogBugzClient loginUser: cr key password: cr value.
	fog isLoggedIn 
		ifTrue: [ client := fog ]
		ifFalse: [ self inform: fog summarizedErrors ]
]

{ #category : #'private - actions' }
FogBugzBrowser >> logout [
	client ifNotNil: [ 
		client logout ].
]

{ #category : #'private - actions' }
FogBugzBrowser >> search [

	 
]

{ #category : #accessing }
FogBugzBrowser >> taskbarIcon [

	^self class icon
]

{ #category : #accessing }
FogBugzBrowser >> title [

	^'FogBugz Browser'
]

{ #category : #'private - accessing' }
FogBugzBrowser >> toolBar [
	^ toolBar
]

{ #category : #'private - accessing' }
FogBugzBrowser >> toolBar: anObject [
	toolBar := anObject
]
