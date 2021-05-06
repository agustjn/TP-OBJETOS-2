Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'cuoora'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #accessing }
QuestionRetriever >> cuoora [
	^ cuoora
]

{ #category : #accessing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #query }
QuestionRetriever >> orderQuestions: someQuestions [
	|temp |
	temp := someQuestions 
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	^ temp last: (100 min: temp size).
	
]

{ #category : #query }
QuestionRetriever >> questionsFilter: anUser [
	self subclassResponsibility
]

{ #category : #retrieving }
QuestionRetriever >> retrieveQuestions: anUser [
	^ (self orderQuestions: (self questionsFilter: anUser))
		reject: [ :q | q user = anUser ]
]
