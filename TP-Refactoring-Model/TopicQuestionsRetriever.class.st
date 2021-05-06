Class {
	#name : #TopicQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #query }
TopicQuestionsRetriever >> questionsFilter: anUser [ 
	^ anUser topicsQuestions 
	
	
]
