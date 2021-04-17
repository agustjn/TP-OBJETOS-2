"
app := WAAdmin register: InicioSesionComponent asApplicationAt: 'login'.
app sessionClass: CuOOraSession.

"
Class {
	#name : #HomeComponente,
	#superclass : #WebComponent,
	#category : #'OO2-TP1-UI'
}

{ #category : #private }
HomeComponente >> createNewQuestion [
	self call: NewQuestionComponent new 
]

{ #category : #rendering }
HomeComponente >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	
	aCanvas div class:'div-questions';with: [ self renderizarPreguntas: aCanvas ].
	aCanvas div class:'new-question'; with:[
	aCanvas anchor
		callback: [ self createNewQuestion ];
		with: [ aCanvas button: 'Nueva pregunta' ]
		.]
]

{ #category : #private }
HomeComponente >> renderizarDetalles: aCanvas DePregunta: aQuestion [
	aCanvas render: (QuestionComponent of: aQuestion andParent: self).
]

{ #category : #private }
HomeComponente >> renderizarHeading: aCanvas [
	aCanvas label: 'Bienvenido ' , self session user nombre.

]

{ #category : #private }
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

{ #category : #private }
HomeComponente >> renderizarPreguntas: aCanvas [
	| questions |
	
	questions := self model
		preguntasRelevantesParaUsuario: self session user.
	aCanvas heading level2 with: 'Ultimas preguntas'.
	aCanvas
		unorderedList: [ questions
				do: [ :pregunta | 
					aCanvas
						listItem: [ 
							aCanvas
								render: (QuestionComponent of: pregunta andParent: self).
							aCanvas horizontalRule ] ] ]
]
