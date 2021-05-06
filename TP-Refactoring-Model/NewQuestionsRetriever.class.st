Class {
	#name : #NewQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #query }
NewQuestionsRetriever >> questionsFilter: anUser [
	^ cuoora questionsOfToday
]
