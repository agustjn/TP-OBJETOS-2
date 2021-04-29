Class {
	#name : #QuestionTest,
	#superclass : #TestCase,
	#instVars : [
		'question'
	],
	#category : #'TP-Refactoring-Tests'
}

{ #category : #setup }
QuestionTest >> setUp [
	question := Question  newWithTitle: 'Question  title' description: 'Question description' user: (User new) 

]

{ #category : #deprecated }
QuestionTest >> testNegativeVotes [		
	question addVote: (Vote user: (User new) dislikesPublication: question).
	self assert: (question negativeVotes size) equals: 1.
	
	question addVote: (Vote user: (User new) dislikesPublication: question).
	self assert: (question negativeVotes size) equals: 2.

]

{ #category : #deprecated }
QuestionTest >> testPositiveAndNegativeVotesInterference [	
	question addVote: (Vote user: (User new) dislikesPublication: question).
	self assert: (question positiveVotes size) equals: 0.
	self assert: (question negativeVotes size) equals: 1.
	
	question addVote: (Vote user: (User new) likesPublication: question).	
	self assert: (question positiveVotes size) equals: 1.
	self assert: (question negativeVotes size) equals: 1.
	
	self assert: question votes size equals: 2.
]

{ #category : #deprecated }
QuestionTest >> testPositiveVotes [
	question addVote: (Vote user: (User new) likesPublication: question).	
	self assert: (question positiveVotes size) equals: 1.
	
	question addVote: (Vote user: (User new) likesPublication: question).	
	self assert: (question positiveVotes size) equals: 2.
	
]

{ #category : #testing }
QuestionTest >> testVotesForNewQuestion [
	self assert: (question negativeVotes size) equals: 0.
	self assert: (question positiveVotes size) equals: 0.
		
]
