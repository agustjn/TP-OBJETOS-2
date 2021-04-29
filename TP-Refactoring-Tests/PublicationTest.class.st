Class {
	#name : #PublicationTest,
	#superclass : #TestCase,
	#instVars : [
		'question',
		'answer'
	],
	#category : #'TP-Refactoring-Tests'
}

{ #category : #running }
PublicationTest >> setUp [
	question := Question  newWithTitle: 'Question  title' description: 'Question description' user: (User new) 

]

{ #category : #'tests - testing' }
PublicationTest >> testNegativeVotes [
question addVote: (Vote user: (User new) dislikesPublication: question).
	self assert: (question negativeVotes size) equals: 1.
	
	question addVote: (Vote user: (User new) dislikesPublication: question).
	self assert: (question negativeVotes size) equals: 2.
]

{ #category : #'tests - testing' }
PublicationTest >> testPositiveAndNegativeVotesInterference [
	question addVote: (Vote user: User new dislikesPublication: question).
	self assert: question positiveVotes size equals: 0.
	self assert: question negativeVotes size equals: 1.
	question addVote: (Vote user: User new likesPublication: question).
	self assert: question positiveVotes size equals: 1.
	self assert: question negativeVotes size equals: 1.
	self assert: question votes size equals: 2
]

{ #category : #'tests - testing' }
PublicationTest >> testPositiveVotes [
	question addVote: (Vote user: User new likesPublication: question).
	self assert: question positiveVotes size equals: 1.
	question addVote: (Vote user: User new likesPublication: question).
	self assert: question positiveVotes size equals: 2
]
