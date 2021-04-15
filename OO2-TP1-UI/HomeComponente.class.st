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
	aCanvas paragraph.
	self renderizarTopicos: aQuestion topicos conCanvas: aCanvas.
	aCanvas
		paragraph: [ aCanvas label: 'Realizada por: '.
			aCanvas anchor
				callback: [ self call: (PerfilUserComponent of: (self model obtenerAutorDePregunta: aQuestion)) ];
				with: (self model obtenerAutorDePregunta: aQuestion) nombre ].
	aCanvas space.
	aCanvas anchor
		callback: [  ];
		with: aQuestion respuestas size asString , ' respuestas'.
	aCanvas paragraph.
	aCanvas label
		with:
			aQuestion likes asString , ' likes | ' , aQuestion dislikes asString
				, ' dislikes'.
	aCanvas paragraph.
	self renderizarLikes: aCanvas dePregunta: aQuestion
]

{ #category : #rendering }
HomeComponente >> renderizarLikes: aCanvas [
	aCanvas anchor 	
					callback: [  ] ;
					with: 'like'.
	aCanvas space.
	aCanvas space.
	aCanvas anchor 		
					callback: [  ] ;
					with: 'dislike'
]

{ #category : #rendering }
HomeComponente >> renderizarLikes: aCanvas dePregunta: aQuestion [
	aCanvas anchor 	
				callback: [ aQuestion 
							agregarReaccion: (Reaccion newConEstado:true Usuario:self session user).
							 ] ;
					with: 'like'.
	aCanvas space.
	aCanvas space.
	aCanvas anchor 		
					callback: [ aQuestion 
							agregarReaccion: (Reaccion newConEstado:false Usuario:self session user). ] ;
					with: 'dislike'.
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
					[ :pregunta | aCanvas listItem:  [ self renderizarItem: aCanvas de: pregunta ] ] ].
	aCanvas anchor
		callback: [ self createNewQuestion ];
		with: [ aCanvas button: 'Nueva pregunta' ]
]

{ #category : #rendering }
HomeComponente >> renderizarTopicos: aTopics conCanvas: aCanvas [
	aTopics do: [ :topic | aCanvas label:topic nombre.
								  aCanvas space.]
]
