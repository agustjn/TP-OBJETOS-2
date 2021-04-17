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
   
   aCanvas div class:'question-detail'; with:[
	self renderNavOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas render: (QuestionComponent of: question).
	self renderizarRespuestas: aCanvas ofQuestion: question.
	aCanvas horizontalRule.
	aCanvas render: (FormAnswerComponent ofQuestion: question).]
	
	
]

{ #category : #rendering }
QuestionDetailComponent >> renderizarRespuestas: aCanvas ofQuestion: aQuestion [
	aCanvas
		unorderedList: [ aQuestion respuestasOrdenadas 
				do:
					[ :rta | aCanvas listItem: [ aCanvas render: (AnswerComponent of: rta) ] ] ]
]
