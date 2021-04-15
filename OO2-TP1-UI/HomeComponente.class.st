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
		with: aQuestion titulo.	"aca habia un first pero no se xq"
	"aCanvas
		paragraph: [ aCanvas
				label:
					'Realizada por: '
						, (self model obtenerAutorDePregunta: aQuestion) nombre ]"
]

{ #category : #rendering }
HomeComponente >> renderizarPreguntas: aCanvas [
	| questions p |
	questions := self model
		preguntasRelevantesParaUsuario: self session user.
	aCanvas heading: 'Ultimas preguntas'.
	p := Pregunta newConTitulo: 'Hola' yTexto: 'as' relacionadoA: nil.
	questions add: p.
	aCanvas
		unorderedList: [ questions
				do: [ :pregunta | 
					aCanvas
						listItem: [ aCanvas anchor
								callback: [  ];
								with: pregunta titulo ] ] ].
	aCanvas anchor
		callback: [ self createNewQuestion  ];
		with: [ aCanvas button: 'Nueva pregunta' ]
]

{ #category : #styles }
HomeComponente >> style [
	^ ' 
	    *  { background:lightgreen ;
	 			 }
		 div  { background: green }
	'
]
