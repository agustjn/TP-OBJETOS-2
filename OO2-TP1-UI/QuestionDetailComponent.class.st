Class {
	#name : #QuestionDetailComponent,
	#superclass : #WebComponent,
	#instVars : [
		'question'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #initialization }
QuestionDetailComponent class >> of: aQuestion [
	| instance |
	instance := self new.
	instance question: aQuestion.
	^instance
]

{ #category : #accessing }
QuestionDetailComponent >> crearRespuesta [
	self call: FormAnswerComponent new
]

{ #category : #accessing }
QuestionDetailComponent >> question [
	^ question
]

{ #category : #accessing }
QuestionDetailComponent >> question: anObject [
	question := anObject
]

{ #category : #rendering }
QuestionDetailComponent >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas render: (QuestionComponent of: question).
	self renderizarRespuestas: aCanvas ofQuestion: question.
	aCanvas horizontalRule.
	aCanvas render: (FormAnswerComponent ofQuestion: question).
	
]

{ #category : #rendering }
QuestionDetailComponent >> renderizarRespuestas: aCanvas ofQuestion: aQuestion [
	aCanvas unorderedList: [  aQuestion 
										respuestas do: [  :rta | aCanvas 
																		listItem: [ aCanvas render:(AnswerComponent of: rta)] . ] ]

]
