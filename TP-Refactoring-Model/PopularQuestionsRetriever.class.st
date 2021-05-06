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
	averageVotes := (cuoora questions sum: [ :q | q positiveVotes size ])/ questionsOfToday size.
	^ questionsOfToday select:[ :question | question positiveVotes size >= averageVotes ]
	
	
	
	
]
