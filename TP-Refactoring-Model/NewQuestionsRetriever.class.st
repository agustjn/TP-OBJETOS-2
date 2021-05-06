Class {
	#name : #NewQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #query }
NewQuestionsRetriever >> questionsFilter: anUser [
	^ cuoora questions select: [ :q | q timestamp asDate = Date today ]
]
