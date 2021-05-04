Class {
	#name : #NewQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #abstract }
NewQuestionsRetriever >> retrieveQuestions: anUser [
	| newsCol temp qRet |
	newsCol := OrderedCollection new.
	cuoora questions
		do: [ :q | 
			q timestamp asDate = Date today
				ifTrue: [ newsCol add: q ] ].
	temp := newsCol
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]
