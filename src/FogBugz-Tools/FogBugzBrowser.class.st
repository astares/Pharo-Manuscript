"
A browser for Fogbugz cases
"
Class {
	#name : #FogBugzBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'client',
		'caseModel'
	],
	#category : #'FogBugz-Tools-UI'
}

{ #category : #spec }
FogBugzBrowser class >> defaultSpec [
	<spec>
	| searchBarOffset delta |
	searchBarOffset := 5 + StandardFonts defaultFont height + 10.
	delta := 25.
	^SpecLayout composed 
		add: #caseModel origin: 0@0 corner: 1@1 offsetOrigin: 0@searchBarOffset offsetCorner: 0@0;
		add: #caseSearchField origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@searchBarOffset
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
FogBugzBrowser >> caseSearchField [
	
	^ SearchMorph new
		model: self;
		setIndexSelector: #caseSearchAccept:; 
		updateSelector: #caseSearchAccept:;
		searchList: #();
		asSpecAdapter
]

{ #category : #initialization }
FogBugzBrowser >> initialExtent [

	^800@500
]

{ #category : #'initialization widgets' }
FogBugzBrowser >> initializeWidgets [

	caseModel := self instantiate: IconListModel.
]

{ #category : #accessing }
FogBugzBrowser >> taskbarIcon [

	^self class icon
]

{ #category : #accessing }
FogBugzBrowser >> title [

	^'FogBugz Browser'
]
