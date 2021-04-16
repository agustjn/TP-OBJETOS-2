Class {
	#name : #NewQuestionComponent,
	#superclass : #WebComponent,
	#instVars : [
		'titulo',
		'texto',
		'topicoText'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
NewQuestionComponent >> publicar [
	| tops |
	topicoText parseLiterals. 
	tops := topicoText splitOn: ','.
	self model
		agregarPreguntaConTitulo: titulo
		descripcion: texto
		topicos: tops
		usuario: self session user.
	self answer
]

{ #category : #rendering }
NewQuestionComponent >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas strong: 'Crear Pregunta'.
	aCanvas
		div: [ self renderInputElementsOn: aCanvas.
			self renderPublicButtonOn: aCanvas ]
]

{ #category : #rendering }
NewQuestionComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Titulo'.
	aCanvas paragraph: [ aCanvas textInput on: #titulo of: self ].
	aCanvas label: 'Desarrollo'.
	aCanvas paragraph: [ (aCanvas textArea on: #texto of: self )
								columns: 80;
								rows: 5 ].
	aCanvas label: 'Topicos/s (separado por comas)'.
	aCanvas paragraph: [ aCanvas textInput on: #topicoText of: self ]
]

{ #category : #rendering }
NewQuestionComponent >> renderPublicButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self publicar ];
		with: 'Publicar'
]

{ #category : #rendering }
NewQuestionComponent >> texto [
	^texto 
]

{ #category : #rendering }
NewQuestionComponent >> texto: aText [
	texto := aText
]

{ #category : #rendering }
NewQuestionComponent >> titulo [
	^titulo 
]

{ #category : #rendering }
NewQuestionComponent >> titulo: aTitle [
	titulo := aTitle .
]

{ #category : #rendering }
NewQuestionComponent >> topicoText [
	^topicoText 
]

{ #category : #rendering }
NewQuestionComponent >> topicoText: aTopicText [
	topicoText := aTopicText 
]
