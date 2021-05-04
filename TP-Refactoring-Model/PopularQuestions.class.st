Class {
	#name : #PopularQuestions,
	#superclass : #Option,
	#category : #'TP-Refactoring-Model'
}

{ #category : #abstract }
PopularQuestions >> relevantQuestions: anUser [
	| popularTCol averageVotes temp qRet |
	popularTCol := OrderedCollection new.
	questions
		do: [ :q | 
			q timestamp asDate = Date today
				ifTrue: [ popularTCol add: q ] ].
	averageVotes := (questions sum: [ :q | q positiveVotes size ])
		/ popularTCol size.
	temp := (popularTCol
		select: [ :q | q positiveVotes size >= averageVotes ])
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = anUser ]
]
