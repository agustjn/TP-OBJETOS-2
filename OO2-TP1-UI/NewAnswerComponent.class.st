Class {
	#name : #NewAnswerComponent,
	#superclass : #WebComponent,
	#instVars : [
		'text'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
NewAnswerComponent >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas label: 'respuesta'.
	aCanvas
		form: [ (aCanvas textArea on: #text of: self)
				columns: 80;
				rows: 5.
			aCanvas break.
			aCanvas submitButton
				callback: [ self responder ];
				with: 'Guardar' ]
]

{ #category : #accessing }
NewAnswerComponent >> responder [
	text ifEmpty: [ ^self ].
	
]

{ #category : #accessing }
NewAnswerComponent >> text [
	^ text
]

{ #category : #accessing }
NewAnswerComponent >> text: anObject [
	text := anObject
]
