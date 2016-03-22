"
A browser for Fogbugz cases
"
Class {
	#name : #FogBugzBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'client',
		'caseModel',
		'toolBar',
		'mainMenu',
		'statusBar'
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
		add: #mainMenu
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ 0
			offsetCorner: 0 @ self toolbarHeight;
		add: #toolBar
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ self toolbarHeight
			offsetCorner: 0 @ (self toolbarHeight + (self toolbarHeight + 4));
		add: #statusBar
			origin: 0 @ 1
			corner: 1 @ 1
			offsetOrigin: 0 @ (0 - self statusBarHeight)
			offsetCorner: 0 @ 0;
		add: self contentSpec
			origin: 0 @ 0
			corner: 1 @ 1
			offsetOrigin: 0 @ (self toolbarHeight + (self toolbarHeight + 4))
			offsetCorner: 0 @ (0 - self statusBarHeight);
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

{ #category : #defaults }
FogBugzBrowser class >> statusBarHeight [

	^ StandardFonts defaultFont height + 2
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

{ #category : #'private - initialization' }
FogBugzBrowser >> initalFogBugzMenu [
	|builder|
	builder := FGBMenuBuilder new.
	builder
		addItem: 'Login'
		icon: self iconProvider fogBugzLoginIcon 
		action: [ self login ].
	^builder menu	
]

{ #category : #initialization }
FogBugzBrowser >> initialExtent [

	^530@360
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeMainMenu [

	| builder |
	builder := FGBMenuBuilder forMenu: mainMenu.
	builder addItem: 'FogBugz' icon: nil subMenu: self initalFogBugzMenu.
"	builder addItem: 'Edit' icon: nil subMenu: self initalEditMenu.						
	builder addItem: 'Help' icon: nil subMenu: self initalHelpMenu.	"	
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
	self 
		initializeMainMenu; 		
		initializeToolBar.	
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

{ #category : #accessing }
FogBugzBrowser >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
FogBugzBrowser >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #'private - actions' }
FogBugzBrowser >> search [

	 
]

{ #category : #accessing }
FogBugzBrowser >> statusBar [
	^ statusBar
]

{ #category : #accessing }
FogBugzBrowser >> statusBar: anObject [
	statusBar := anObject
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
