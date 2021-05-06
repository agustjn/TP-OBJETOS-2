Class {
	#name : #SocialQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #query }
SocialQuestionsRetriever >> questionsFilter: anUser [ 
	^ anUser followingQuestions 
	
	
]
