Class {
	#name : #HomeComponente,
	#superclass : #WebComponent,
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
HomeComponente >> createNewQuestion [
	self call: NewQuestionComponent new 
]

{ #category : #accessing }
HomeComponente >> model [
	^ CuOOra soleInstance
]

{ #category : #rendering }
HomeComponente >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas div with: [ self renderizarHeading: aCanvas ].
	aCanvas horizontalRule.
	aCanvas div with: [ self renderizarPreguntas: aCanvas ]
]

{ #category : #rendering }
HomeComponente >> renderizarHeading: aCanvas [
	aCanvas label: 'Bienvenido ' , self session user nombre.
	aCanvas horizontalRule.
]

{ #category : #rendering }
HomeComponente >> renderizarItem: aCanvas de: aQuestion [
	aCanvas anchor
		callback: [  ];
		with: aQuestion titulo.
	aCanvas
		paragraph: [ aCanvas
				label:
					'Realizada por: '
						, (self model obtenerAutorDePregunta: aQuestion) nombre ].
	aCanvas space.
	aCanvas anchor
		callback: [  ];
		with: aQuestion respuestas size asString , ' respuestas' 
	
]

{ #category : #rendering }
HomeComponente >> renderizarPreguntas: aCanvas [
	| questions |
	questions := self model
		preguntasRelevantesParaUsuario: self session user.
	aCanvas heading: 'Ultimas preguntas'.
	aCanvas
		unorderedList: [ questions
				do:
					[ :pregunta | aCanvas listItem:  [self renderizarItem: aCanvas de: pregunta] ] ].
	aCanvas anchor
		callback: [ self createNewQuestion ];
		with: [ aCanvas button: 'Nueva pregunta' ]
]
