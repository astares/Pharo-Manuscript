"
Unit tests for ManuscriptCase
"
Class {
	#name : #ManuscriptCaseTest,
	#superclass : #TestCase,
	#category : #'Manuscript-Tests-Core-Model'
}

{ #category : #tests }
ManuscriptCaseTest >> testAsURL [

	|c|
	c := ManuscriptCase new.
	c id: 666.
	self assert: c asURL equals: 'https://pharo.manuscript.com/f/cases/666'
]
