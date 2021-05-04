Class {
	#name : #TopicQuestions,
	#superclass : #Option,
	#category : #'TP-Refactoring-Model'
}

{ #category : #abstract }
TopicQuestions >> relevantQuestions: anUser [
	| topicsCol temp qRet |
	topicsCol := OrderedCollection new.
	anUser topics do: [ :topic | topicsCol addAll: topic questions ].
	temp := topicsCol
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]
