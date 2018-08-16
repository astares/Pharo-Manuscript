"
I am the widget allowing to describe a case to submit to fogBugz.

To try me:

[[[
	self example
]]]
"
Class {
	#name : #ManuscriptCaseCreationPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'titleLabel',
		'titleInput',
		'contentLabel',
		'contentText',
		'contentTemplate',
		'projectsLabel',
		'projectsDropList',
		'categoriesLabel',
		'categoriesDropList',
		'areasDropList',
		'milestonesDropList',
		'prioritiesDropList',
		'statusesDropList',
		'assignToDropList',
		'submitButton'
	],
	#category : #'Manuscript-Tools-Dialogs'
}

{ #category : #specs }
ManuscriptCaseCreationPresenter class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newColumn: [ :col |
        col
			newRow: #titleLabel height: self defaultFont height;
			newRow: #titleInput height: self inputTextHeight;
			newRow: [ :dropRow1 |
				dropRow1
					newColumn: #projectsDropList;
					newColumn: #areasDropList;
					newColumn: #milestonesDropList ] height: self inputTextHeight;
			newRow: [ :dropRow2 |
				dropRow2
					newColumn: #categoriesDropList;
					newColumn: #assignToDropList;
					newColumn: #statusesDropList ] height: self inputTextHeight;
			newRow: [ :mainRow |
				mainRow
					newColumn: [ :metadataColumn |
						metadataColumn
							newRow: #prioritiesDropList height: self inputTextHeight ];
					addSplitter;
					newColumn: [ :issueDescriptionColumn |
						issueDescriptionColumn
							newRow: #contentLabel height: self defaultFont height;
							newRow: #contentText ] ];
			newRow: [ :submitRow |
				submitRow
					newColumn: #submitButton width: self buttonWidth ] height: self buttonHeight ];
       yourself
]

{ #category : #examples }
ManuscriptCaseCreationPresenter class >> example [
	| client |
	client := [ FogBugzClient getWorkingClientByAskingUser ] on: ManuscriptUserCancelledLogin do: [ "abort" ^ self ].
	^ self openForClient: client withTemplate: 'A custom template for issue description.'
]

{ #category : #'instance creation' }
ManuscriptCaseCreationPresenter class >> openForClient: aFogBugzClient withTemplate: aString [
	| caseCreator window |
	caseCreator := self new
						contentTemplate: aString;
						adaptToClient: aFogBugzClient;
						yourself.
	window := caseCreator openWithSpec.
	window
		extent: World extent * 0.55;
		centered;
		whenClosedDo: [ aFogBugzClient logout ].
	^ caseCreator
]

{ #category : #adapting }
ManuscriptCaseCreationPresenter >> adaptToClient: aManuscriptClient [
	| todo |
	todo := #(
		areas: listAreas
		milestones: listMilestones
		priorities: listPriorities
		statuses: listStatuses
		users: listUsers
		projects: listProjects
		categories: listCategories).
	UIManager default displayProgress: 'Fetching data from Manuscript' from: 0 to: todo size during: [ :bar |
		|i|
		i := 0.
		todo pairsDo: [ :mutator :accessor |
			bar
				current: (i := i + 1);
				title: ('Fetching data from Manuscript: {1}' format: { mutator allButLast }).
			self perform: mutator with: (accessor value: aManuscriptClient) ] ].
	submitButton
		action: [ 
			[
				aManuscriptClient newCase: self asManuscriptCase.
				UIManager default inform: 'Case opened.'.
				self delete ]
				on: ManuscriptInvalidInput
				do: [ :err | UIManager default alert: err messageText title: err class name ] ].
	self postAdaptationActions.
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> areaSelected [
	^ self areasDropList selectedItem
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> areas: aCollectionOfAreas [
	self areasDropList
		items: aCollectionOfAreas
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> areasDropList [
	^ areasDropList
]

{ #category : #conversion }
ManuscriptCaseCreationPresenter >> asManuscriptCase [
	self checkUserInputs.
	^ ManuscriptCase new
		title: self caseTitle;
		content: self content;
		status: self statusSelected;
		project: self projectSelected;
		priority: self prioritySelected;
		milestone: self milestoneSelected;
		category: self categorySelected;
		assignee: self userSelected;
		area: self areaSelected;
		yourself
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> assignToDropList [
	^ assignToDropList
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> caseTitle [
	^ self titleInput text
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> categories: anOrderedCollectionOfString [
	self categoriesDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> categoriesDropList [
	^ categoriesDropList
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> categorySelected [
	^ self categoriesDropList selectedItem
]

{ #category : #checking }
ManuscriptCaseCreationPresenter >> checkUserInputs [
	self title
		ifEmpty: [ ManuscriptInvalidInput signal: 'The title of an issue can not be empty.' ].
		
	self content
		ifEmpty: [ ManuscriptInvalidInput signal: 'The content of an issue can not be empty.' ]
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> content [
	^ self contentText text
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> contentLabel [
	^ contentLabel
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> contentTemplate [
	^ contentTemplate ifNil: [ contentTemplate := '' ]
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> contentTemplate: anObject [
	contentTemplate := anObject.
	contentText
		text: self contentTemplate
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> contentText [
	^ contentText
]

{ #category : #initialization }
ManuscriptCaseCreationPresenter >> initialize [
	super initialize.
	self title: 'Open a case' translated
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializeAreasDropList [
	areasDropList := self newLabelledDropList.
	areasDropList
		label: 'Area:' translated;
		displayBlock: [ :area | area name ]
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializeAssignToDropList [
	assignToDropList := self newLabelledDropList.
	assignToDropList
		label: 'Assign to:' translated;
		displayBlock: [ :user | user name ]
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializeCategoriesDropList [
	categoriesDropList := self newLabelledDropList.
	categoriesDropList
		label: 'Category:' translated;
		displayBlock: [ :category | category name ];
		whenSelectedItemChanged: [ :category |
			"When category modified, filter statuses selectable and modify currently selected status to default status for the category."
			category ifNotNil: [
				self statusesDropList
					filteringBlock: [ :status | category id = status categoryId ];
					selectedItem: (self statusesDropList items detect: [ :status | status id = category defaultStatusIdWhenActive ]) ] ]
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializeLabelledDropLists [
	self
		initializeAreasDropList;
		initializeAssignToDropList;
		initializeMilestonesDropList;
		initializePrioritiesDropList;
		initializeStatusesDropList;
		initializeCategoriesDropList;
		initializeProjectsDropList
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializeMilestonesDropList [
	milestonesDropList := self newLabelledDropList.
	milestonesDropList
		label: 'Milestone:' translated;
		displayBlock: [ :milestone | milestone name ]
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializePrioritiesDropList [
	prioritiesDropList := self newLabelledDropList.
	prioritiesDropList
		label: 'Priority:' translated;
		displayBlock: [ :priority | priority name ]
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializeProjectsDropList [
	projectsDropList := self newLabelledDropList.
	projectsDropList
		label: 'Project:' translated;
		displayBlock: [ :project | project name ];
		whenSelectedItemChanged: [ :project |
			project ifNotNil: [ 
				"When project modified, set default assignee."
				assignToDropList
					selectedItem: (assignToDropList items detect: [ :user | user id = project defaultAssigneeId ]).
				"When project modified, filter areas valid for the selected project."
				areasDropList
					filteringBlock: [ :area | area projectId = project id ] ] ]
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> initializeStatusesDropList [
	statusesDropList := self newLabelledDropList.
	statusesDropList
		label: 'Status:' translated;
		displayBlock: [ :status | status name ]
]

{ #category : #initialization }
ManuscriptCaseCreationPresenter >> initializeWidgets [
	titleLabel := self newLabel.
	titleLabel label: 'Title:'.
	titleInput := self newTextInput.
	titleInput
		ghostText: 'Short title to describe the issue';
		autoAccept: true.
	contentLabel := self newLabel.
	contentLabel label: 'Description:'.
	contentText := self newText.
	contentText
		text: self contentTemplate;
		autoAccept: true.
	self initializeLabelledDropLists.
	submitButton := self newButton.
	submitButton label: 'Submit'
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> milestoneSelected [
	^ self milestonesDropList selectedItem
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> milestones: aCollectionOfMilestones [
	self milestonesDropList
		items: aCollectionOfMilestones
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> milestonesDropList [
	^ milestonesDropList
]

{ #category : #'private - initialization' }
ManuscriptCaseCreationPresenter >> newLabelledDropList [
	^ self instantiate: ManuscriptLabeledDropList
]

{ #category : #adapting }
ManuscriptCaseCreationPresenter >> postAdaptationActions [
	self prioritiesDropList
		setSelectedItem: (self priorities detect: #isDefault).
	
	self statusesDropList
		items: (self statusesDropList items sorted: [ :a :b | a orderIndex < b orderIndex ]).
		
	self projectsDropList
		selectedItem: self projectsDropList items first.
	self categoriesDropList
		selectedItem: self categoriesDropList items first.
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> priorities [
	^ self prioritiesDropList items
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> priorities: aCollectionOfPriorities [
	self prioritiesDropList
		items: aCollectionOfPriorities
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> prioritiesDropList [
	^ prioritiesDropList
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> prioritySelected [
	^ self prioritiesDropList selectedItem
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> projects: anOrderedCollectionOfString [
	self projectsDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> projectsDropList [
	^ projectsDropList
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> statusSelected [
	^ self statusesDropList selectedItem
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> statuses: aCollectionOfStatuses [
	self statusesDropList
		items: aCollectionOfStatuses
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> statusesDropList [
	^ statusesDropList
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> submitButton [
	^ submitButton
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> titleInput [
	^ titleInput
]

{ #category : #accessing }
ManuscriptCaseCreationPresenter >> titleLabel [
	^ titleLabel
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> userSelected [
	^ self assignToDropList selectedItem
]

{ #category : #api }
ManuscriptCaseCreationPresenter >> users: aCollectionOfUsers [
	self assignToDropList
		items: aCollectionOfUsers
]
