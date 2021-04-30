Class {
	#name : #AnswerTest,
	#superclass : #TestCase,
	#instVars : [
		'answer'
	],
	#category : #'TP-Refactoring-Tests'
}

{ #category : #setup }
AnswerTest >> setUp [
	answer := Answer new:'An answer'  user:(User new)  question:(Question new).
]

{ #category : #deprecated }
AnswerTest >> testNegativeVotes [		
	answer addVote: (Vote user: (User new) dislikesPublication: answer).
	self assert: (answer negativeVotes size) equals: 1.
	
	answer addVote: (Vote user: (User new) dislikesPublication: answer).
	self assert: (answer negativeVotes size) equals: 2.

]

{ #category : #deprecated }
AnswerTest >> testPositiveAndNegativeVotesInterference [
	
	answer addVote: (Vote user: (User new) dislikesPublication: answer).
	self assert: (answer positiveVotes size) equals: 0.
	
	answer addVote: (Vote user: (User new) likesPublication: answer).	
	self assert: (answer positiveVotes size) equals: 1.
	
	answer addVote: (Vote user: (User new) likesPublication: answer).	
	self assert: (answer positiveVotes size) equals: 2.
	
	answer addVote: (Vote user: (User new) dislikesPublication: answer).
	self assert: (answer positiveVotes size) equals: 2.
	
	self assert: answer votes size equals: 4.
]

{ #category : #deprecated }
AnswerTest >> testPositiveVotes [
	answer addVote: (Vote user: (User new) likesPublication: answer).	
	self assert: (answer positiveVotes size) equals: 1.
	
	answer addVote: (Vote user: (User new) likesPublication: answer).	
	self assert: (answer positiveVotes size) equals: 2.
	
]

{ #category : #testing }
AnswerTest >> testVotesForNewAnswer [
	self assert: (answer negativeVotes size) equals: 0.
	self assert: (answer positiveVotes size) equals: 0.
		
]