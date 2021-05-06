Class {
	#name : #CuOOra2,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics',
		'questions'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #adding }
CuOOra2 >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #adding }
CuOOra2 >> addQuestion: aQuestion forUser: aUser [
	aUser addQuestion: aQuestion.
	questions add: aQuestion.
]

{ #category : #adding }
CuOOra2 >> addTopic: aTopic [
	topics add: aTopic 

]

{ #category : #adding }
CuOOra2 >> addUser: aUser [
	users add: aUser 

]

{ #category : #initialize }
CuOOra2 >> initialize [
	users := OrderedCollection new.
	topics := OrderedCollection new.
	questions := OrderedCollection new
]

{ #category : #accessing }
CuOOra2 >> questions [
	^ questions
]

{ #category : #accessing }
CuOOra2 >> questionsOfToday [
	^ questions select: [ :question | question isOfToday ]
]

{ #category : #accessing }
CuOOra2 >> topics [
	^ topics
]

{ #category : #queries }
CuOOra2 >> totalPositiveVotes [
	^ questions sum:[ :question | question positiveVotes size ]
]

{ #category : #accessing }
CuOOra2 >> users [
	^ users
]
