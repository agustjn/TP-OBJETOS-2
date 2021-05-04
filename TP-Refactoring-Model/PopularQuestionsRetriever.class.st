Class {
	#name : #PopularQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #abstract }
PopularQuestionsRetriever >> relevantQuestions: anUser [
	| popularTCol averageVotes temp qRet |
	popularTCol := OrderedCollection new.
	cuoora questions
		do: [ :q | 
			q timestamp asDate = Date today
				ifTrue: [ popularTCol add: q ] ].
	averageVotes := (cuoora questions sum: [ :q | q positiveVotes size ])
		/ popularTCol size.
	temp := (popularTCol
		select: [ :q | q positiveVotes size >= averageVotes ])
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]

{ #category : #abstract }
PopularQuestionsRetriever >> retrieveQuestions: anUser [
	| popularTCol averageVotes temp qRet |
	popularTCol := OrderedCollection new.
	cuoora questions
		do: [ :q | 
			q timestamp asDate = Date today
				ifTrue: [ popularTCol add: q ] ].
	averageVotes := (cuoora questions sum: [ :q | q positiveVotes size ])
		/ popularTCol size.
	temp := (popularTCol
		select: [ :q | q positiveVotes size >= averageVotes ])
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]
