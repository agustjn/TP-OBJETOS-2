Class {
	#name : #SocialQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #abstract }
SocialQuestionsRetriever >> retrieveQuestions: anUser [
	| followingCol temp qRet |
	followingCol := OrderedCollection new.
	anUser following
		do: [ :follow | followingCol addAll: follow questions ].
	temp := followingCol
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]
