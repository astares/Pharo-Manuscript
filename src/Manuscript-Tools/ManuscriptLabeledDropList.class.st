"
I am the combination of a label and drop list in a single widget.
"
Class {
	#name : #ManuscriptLabeledDropList,
	#superclass : #ComposablePresenter,
	#instVars : [
		'dropList',
		'label',
		'filteringBlock',
		'items'
	],
	#category : #'Manuscript-Tools-Components'
}

{ #category : #specs }
ManuscriptLabeledDropList class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newRow: [ :row |
			row
				add: #label;
				add: #dropList ]
			
]

{ #category : #private }
ManuscriptLabeledDropList >> defaultFilteringBlock [
	"Filters nothing."
	^ [ :item | true ]
]

{ #category : #api }
ManuscriptLabeledDropList >> displayBlock: aBlock [
	self dropList
		displayBlock: aBlock
]

{ #category : #accessing }
ManuscriptLabeledDropList >> dropList [
	^ dropList
]

{ #category : #api }
ManuscriptLabeledDropList >> filteringBlock [
	^ filteringBlock
]

{ #category : #api }
ManuscriptLabeledDropList >> filteringBlock: anObject [
	filteringBlock := anObject.
	self items: items
]

{ #category : #initialization }
ManuscriptLabeledDropList >> initialize [
	super initialize.
	items := OrderedCollection new.
	self resetFilter.
]

{ #category : #initialization }
ManuscriptLabeledDropList >> initializeWidgets [
	label := self newLabel.
	dropList := self newDropList
]

{ #category : #api }
ManuscriptLabeledDropList >> items [
	^ items
]

{ #category : #api }
ManuscriptLabeledDropList >> items: aCollectionOfObjects [
	items := aCollectionOfObjects.
	self dropList
		items: (aCollectionOfObjects select: filteringBlock)
]

{ #category : #accessing }
ManuscriptLabeledDropList >> label [
	^ label
]

{ #category : #accessing }
ManuscriptLabeledDropList >> selectedItem [
	^ self dropList selectedItem
]
