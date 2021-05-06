Class {
	#name : #PopularQuestionsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #query }
PopularQuestionsRetriever >> questionsFilter: anUser [
	^ self retrievePositiveQuestionsOf: cuoora questionsOfToday .


]

{ #category : #query }
PopularQuestionsRetriever >> retrievePositiveQuestionsOf: questionsOfToday [
	| averageVotes |
	averageVotes := (cuoora totalPositiveVotes) / questionsOfToday size.
	^ questionsOfToday select:[ :question | question haveMoreVotesThan: averageVotes  ]
	
	
	
	
]
