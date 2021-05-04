Class {
	#name : #Option,
	#superclass : #Object,
	#instVars : [
		'questions'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Option class >> newWithQuestions: someQuestions [
	| instance |
	instance := self new.
	instance initializeWithQuestions: someQuestions.
	^ instance
]

{ #category : #initialization }
Option >> initializeWithQuestions: someQuestions [
	questions := someQuestions
]

{ #category : #abstract }
Option >> relevantQuestions: anUser [
	self subclassResponsibility
]
