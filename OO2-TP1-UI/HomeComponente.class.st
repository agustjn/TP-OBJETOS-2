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
	
	aCanvas div class:'div-questions';with: [ self renderizarPreguntas: aCanvas ].
	aCanvas div class:'new-question'; with:[
	aCanvas anchor
		callback: [ self createNewQuestion ];
		with: [ aCanvas button: 'Nueva pregunta' ]
		.]
]

{ #category : #rendering }
HomeComponente >> renderizarDetalles: aCanvas DePregunta: aQuestion [
	aCanvas render: (QuestionComponent of: aQuestion andParent: self).
]

{ #category : #rendering }
HomeComponente >> renderizarHeading: aCanvas [
	aCanvas label: 'Bienvenido ' , self session user nombre.

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

{ #category : #styles }
HomeComponente >> style [
	^ self componentsStyles, '

	'
]
