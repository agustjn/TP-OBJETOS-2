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
	aCanvas label
		with:
			answer likes asString , ' likes | ' , answer dislikes asString
				, ' dislikes'.
	aCanvas paragraph.
	self renderizarLikes: aCanvas.

	
]

{ #category : #rendering }
AnswerComponent >> renderizarLikes: aCanvas [
	aCanvas anchor 	
				callback: [ answer 
							agregarReaccion: (Reaccion newConEstado:true Usuario:self session user).
							 ] ;
					with: 'like'.
	aCanvas space.
	aCanvas space.
	aCanvas anchor 		
					callback: [ answer 
							agregarReaccion: (Reaccion newConEstado:false Usuario:self session user). ] ;
					with: 'dislike'.
]
