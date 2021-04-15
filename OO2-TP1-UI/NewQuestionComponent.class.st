Class {
	#name : #NewQuestionComponent,
	#superclass : #WebComponent,
	#instVars : [
		'titulo',
		'texto',
		'topicos'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
NewQuestionComponent >> publicar [
	|pregunta |
	pregunta := Pregunta
		newConTitulo: titulo
		yTexto: texto
		relacionadoA: nil.
	self model agregarPregunta: pregunta deTopicos: nil delUsuario: self session user .
	self answer
]

{ #category : #rendering }
NewQuestionComponent >> renderContentOn: aCanvas [
	aCanvas strong: 'Crear Pregunta'.
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderPublicButtonOn: aCanvas ]
]

{ #category : #rendering }
NewQuestionComponent >> renderInputElementsOn: aCanvas [
"aCanvas label: 'Topico/s'."
	"aCanvas paragraph: [ aCanvas textInput on: #Topico of: self ]"
	aCanvas label: 'Titulo'.
	aCanvas paragraph: [ aCanvas textInput on: #titulo of: self ].
	aCanvas label: 'Descripcion'.
	aCanvas paragraph: [ aCanvas textInput on: #texto of: self ]
	
	
	
	
	
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
