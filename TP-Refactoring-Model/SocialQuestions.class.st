Class {
	#name : #SocialQuestions,
	#superclass : #Option,
	#category : #'TP-Refactoring-Model'
}

{ #category : #abstract }
SocialQuestions >> relevantQuestions: anUser [
	| followingCol temp qRet |
	followingCol := OrderedCollection new.
	anUser following
		do: [ :follow | followingCol addAll: follow questions ].
	temp := followingCol
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]
