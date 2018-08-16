"
A menu builder
"
Class {
	#name : #ManuscriptMenuBuilder,
	#superclass : #Object,
	#instVars : [
		'menu'
	],
	#category : #'Manuscript-Tools-Utilities'
}

{ #category : #'instance creation' }
ManuscriptMenuBuilder class >> forMenu: aMenu [

	^(self new)
		menu: aMenu;
		yourself
]

{ #category : #adding }
ManuscriptMenuBuilder >> addItem: aName action: aBlock [
	self group
		addItem: [ :item | 
			item
				name: aName;
				action: aBlock ]
]

{ #category : #adding }
ManuscriptMenuBuilder >> addItem: aName icon: anIcon action: aBlock [
	self group
		addItem: [ :item | 
			item
				name: aName;
				icon: anIcon;
				action: aBlock ]
]

{ #category : #adding }
ManuscriptMenuBuilder >> addItem: aName icon: anIcon subMenu: aMenu [
	self group
		addItem: [ :item | 
			item
				name: aName;
				icon: anIcon;
				subMenu: aMenu ]
]

{ #category : #adding }
ManuscriptMenuBuilder >> addItem: aName subMenu: aMenu [
	self group
		addItem: [ :item | 
			item
				name: aName;
				subMenu: aMenu ]
]

{ #category : #accessing }
ManuscriptMenuBuilder >> group [
	^ menu menuGroups
		ifEmpty: [ menu addGroup: [ :group |  ] ];
		first
]

{ #category : #initialization }
ManuscriptMenuBuilder >> initialize [
 
	super initialize.	
	menu := MenuModel new
]

{ #category : #accessing }
ManuscriptMenuBuilder >> menu [
	^ menu
]

{ #category : #accessing }
ManuscriptMenuBuilder >> menu: aMenu [
	menu := aMenu
]
