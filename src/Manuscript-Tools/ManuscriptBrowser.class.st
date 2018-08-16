"
A browser for Fogbugz cases
"
Class {
	#name : #ManuscriptBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'client',
		'casesModel',
		'toolBar',
		'mainMenu',
		'statusBar',
		'casesSearchField'
	],
	#category : #'Manuscript-Tools-UI'
}

{ #category : #spec }
ManuscriptBrowser class >> contentSpec [
	<spec>
	| searchBarOffset delta |
	searchBarOffset := 5 + StandardFonts defaultFont height + 10.
	delta := 25.
	^SpecLayout composed 
		add: #casesModel origin: 0@0 corner: 1@1 offsetOrigin: 0@searchBarOffset offsetCorner: 0@0;
		add: #caseSearchField origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@searchBarOffset
]

{ #category : #spec }
ManuscriptBrowser class >> defaultSpec [
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
ManuscriptBrowser class >> icon [

	^ManuscriptIconCache manuscriptIcon
]

{ #category : #menu }
ManuscriptBrowser class >> menuCommandOn: aBuilder [
	<worldMenu> 		 
		
	(aBuilder item: #'Manuscript Browser')	 	 
		action: [ self open ]; 
		parent: #Tools;
		icon: self icon.
	aBuilder withSeparatorAfter.		
]

{ #category : #'instance creation' }
ManuscriptBrowser class >> open [
	<script>
	
	(self basicNew)	 
		initialize;
		openWithSpec 
]

{ #category : #defaults }
ManuscriptBrowser class >> statusBarHeight [

	^ StandardFonts defaultFont height + 2
]

{ #category : #'private - actions' }
ManuscriptBrowser >> browseCase [
	casesModel selectedItem ifNotNil: [ :case | WebBrowser openOn: case asURL ]
]

{ #category : #'private - events' }
ManuscriptBrowser >> caseSearchAccept: aString [ 
	| cases |
	client ifNil: [ ^self ].
	self casesModel items: OrderedCollection new.
	World doOneCycle.
	UIManager default showWaitCursorWhile: [ 
	cases := (client query: aString) asSortedCollection ].
	self casesModel items: cases.
	self statusBar label: cases size asString, ' found'
]

{ #category : #'private - accessing' }
ManuscriptBrowser >> caseSearchField [
	
	^casesSearchField
]

{ #category : #'private - initialization' }
ManuscriptBrowser >> casesListMenu: aMenu [ 

	casesModel selectedItem ifNil: [ ^nil ].
	aMenu target: self.
	aMenu addTitle:  'Case'.
	aMenu add: 'Browse online' selector: #browseCase.
	^aMenu
]

{ #category : #'private - accessing' }
ManuscriptBrowser >> casesModel [

	^casesModel
]

{ #category : #'private - accessing' }
ManuscriptBrowser >> casesModel: anObject [
	casesModel := anObject
]

{ #category : #'private - accessing' }
ManuscriptBrowser >> iconProvider [

	^ManuscriptIconCache 
]

{ #category : #'private - initialization menues' }
ManuscriptBrowser >> initalQueryMenu [
	|builder|
	builder := ManuscriptMenuBuilder new.
	builder
		addItem: 'Search'
		icon: self iconProvider manuscriptSearchIcon 
		action: [ self search ].
	^builder menu	
]

{ #category : #'private - initialization menues' }
ManuscriptBrowser >> initalSessionMenu [
	|builder|
	builder := ManuscriptMenuBuilder new.
	builder
		addItem: 'Login'
		icon: self iconProvider manuscriptLoginIcon 
		action: [ self login ].
	builder
		addItem: 'Logout'
		icon: self iconProvider manuscriptLogoutIcon 
		action: [ self logout ].	
	^builder menu	
]

{ #category : #initialization }
ManuscriptBrowser >> initialExtent [

	^530@360
]

{ #category : #'private - initialization' }
ManuscriptBrowser >> initializeCasesModel [
		
	casesModel := self instantiate: IconListModel.
	casesModel 
 		items: SortedCollection new;
		displayBlock: [ :case | case printString ];
		icons: [:user |  self iconProvider manuscriptIcon ];
		menu: [:menu | self casesListMenu: menu ]
]

{ #category : #'private - initialization' }
ManuscriptBrowser >> initializeMainMenu [

	| builder |
	mainMenu := MenuModel new.
	builder := ManuscriptMenuBuilder forMenu: mainMenu.
	builder addItem: 'Manuscript' icon: nil subMenu: self initalSessionMenu.
	builder addItem: 'Query' icon: nil subMenu: self initalQueryMenu.						
	"builder addItem: 'Help' icon: nil subMenu: self initalHelpMenu.	"	
]

{ #category : #'private - initialization' }
ManuscriptBrowser >> initializeSearchField [

	casesSearchField := SearchMorph new
								model: self;
								acceptSelector: #caseSearchAccept:; 		 
								searchList: OrderedCollection new;
								asSpecAdapter
]

{ #category : #'private - initialization' }
ManuscriptBrowser >> initializeStatusBar [
	statusBar := LabelModel new.
	self statusBar 
		color: Color gray;
		label: 'Ready'
]

{ #category : #'private - initialization' }
ManuscriptBrowser >> initializeToolBar [

	toolBar := MenuModel new
		addGroup: [ :group |			 
			group addItem: [ :item |
				item
					name: nil;
					description: 'Login';
					icon: (self iconProvider manuscriptLoginIcon);
					action: [ self login ] ].
			group addItem: [ :item |
				item
					name: nil;
					description: 'Logout';
					icon: (self iconProvider manuscriptLogoutIcon);
					action: [ self logout ] ].	
			group addItem: [ :item |
				item
					name: nil;
					description: 'Search';
					icon: (self iconProvider manuscriptSearchIcon);
					action: [ self search ] ].	
					
			 
		 
		].
		
	toolBar applyTo: self.
]

{ #category : #'private - initialization' }
ManuscriptBrowser >> initializeWidgets [
	self 
		initializeMainMenu; 		
		initializeToolBar;
		initializeStatusBar;
		initializeSearchField;
		initializeCasesModel

]

{ #category : #'private - actions' }
ManuscriptBrowser >> login [

	|cr fog|
	cr :=	ManuscriptLoginDialogModel getCredentials.
	cr ifNil: [ ^self ].
	fog := ManuscriptClient loginUser: cr key password: cr value.
	fog isLoggedIn 
		ifTrue: [ client := fog.
			self statusBar label: 'Connected' ]
		ifFalse: [ self inform: fog summarizedErrors ]
]

{ #category : #'private - actions' }
ManuscriptBrowser >> logout [
	client ifNotNil: [ 
		client logout.
		self casesModel items: OrderedCollection new.
		self statusBar label: 'Ready'. 
		client := nil. ].
]

{ #category : #accessing }
ManuscriptBrowser >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
ManuscriptBrowser >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #'private - actions' }
ManuscriptBrowser >> search [

	self caseSearchAccept: self caseSearchField widget searchString
]

{ #category : #accessing }
ManuscriptBrowser >> statusBar [
	^ statusBar
]

{ #category : #accessing }
ManuscriptBrowser >> statusBar: anObject [
	statusBar := anObject
]

{ #category : #accessing }
ManuscriptBrowser >> taskbarIcon [

	^self class icon
]

{ #category : #accessing }
ManuscriptBrowser >> title [

	^'FogBugz Browser'
]

{ #category : #'private - accessing' }
ManuscriptBrowser >> toolBar [
	^ toolBar
]

{ #category : #'private - accessing' }
ManuscriptBrowser >> toolBar: anObject [
	toolBar := anObject
]
