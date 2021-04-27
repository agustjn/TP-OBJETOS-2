Class {
	#name : #AnswerComponent,
	#superclass : #WAComponent,
	#instVars : [
		'answer'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #initialization }
AnswerComponent class >> of: anAnswer [
	| instance |
	instance := self new.
	instance answer: anAnswer .
	^instance
]

{ #category : #accessing }
AnswerComponent >> answer [
	^ answer
]

{ #category : #accessing }
AnswerComponent >> answer: anObject [
	answer := anObject
]

{ #category : #accessing }
AnswerComponent >> model [
	^ CuOOra soleInstance 
]

{ #category : #rendering }
AnswerComponent >> renderContentOn: aCanvas [
	aCanvas label: 'Respuesta de ' , answer usuario nombre.
	aCanvas paragraph.
	aCanvas label: answer text.
	aCanvas paragraph.
	aCanvas render:(LikesComponent of: answer).


	
]
