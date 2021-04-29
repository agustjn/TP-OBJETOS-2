Class {
	#name : #Publication,
	#superclass : #Object,
	#instVars : [
		'votes',
		'timestamp',
		'description',
		'user'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #adding }
Publication >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Publication >> description [
	^ description
]

{ #category : #accessing }
Publication >> description: anObject [
	description := anObject
]

{ #category : #initalize }
Publication >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #adding }
Publication >> negativeVotes [
	^ votes reject:[ :vote | vote isLike ]
	"| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifFalse:[r add: vote]].
	^r"
]

{ #category : #adding }
Publication >> positiveVotes [
	^ votes select:[ :vote | vote isLike]
	"| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifTrue:[r add: vote]].
	^r"
]

{ #category : #accessing }
Publication >> timestamp [
	^ timestamp
]

{ #category : #private }
Publication >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Publication >> user [
	^ user
]

{ #category : #private }
Publication >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Publication >> votes [
	^ votes
]
