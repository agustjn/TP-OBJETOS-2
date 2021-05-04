Class {
	#name : #TopicQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #abstract }
TopicQuestionsRetriever >> retrieveQuestions: anUser [
	| topicsCol temp qRet |
	topicsCol := OrderedCollection new.
	anUser topics do: [ :topic | topicsCol addAll: topic questions ].
	temp := topicsCol
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]
