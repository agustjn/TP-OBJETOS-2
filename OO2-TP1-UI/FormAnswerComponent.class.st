Class {
	#name : #FormAnswerComponent,
	#superclass : #WebComponent,
	#instVars : [
		'text',
		'question'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #initialize }
FormAnswerComponent class >> ofQuestion: aQuestion [
	| instance |
	instance := self new.
	instance question: aQuestion.
	instance text: ''.
	^instance
	
]

{ #category : #accessing }
FormAnswerComponent >> question [
	^ question
]

{ #category : #accessing }
FormAnswerComponent >> question: anObject [
	question := anObject
]

{ #category : #rendering }
FormAnswerComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ (aCanvas textArea on: #text of: self)
				columns: 80;
				rows: 5.
			aCanvas break.
			aCanvas submitButton
				callback: [ self responder ];
				with: 'Guardar' .
			aCanvas submitButton
				callback: [ self answer ];
				value: 'Cancelar' ] .
			
]

{ #category : #private }
FormAnswerComponent >> responder [
    text ifEmpty: [ ^ self ].
    question
        agregarRespuesta: (Respuesta newCon: text Usuario: self session user).
    self answer
	
]

{ #category : #accessing }
FormAnswerComponent >> text [
	^ text
]

{ #category : #accessing }
FormAnswerComponent >> text: anObject [
	text := anObject
]
