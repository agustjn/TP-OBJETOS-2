Class {
	#name : #QuestionComponent,
	#superclass : #WebComponent,
	#instVars : [
		'aQuestion',
		'parent'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #'instance creation' }
QuestionComponent class >> of: aQuestion andParent: aParent [
	| instance |
	instance := self new.
	instance aQuestion: aQuestion.
	instance parent: aParent.
	^instance
]

{ #category : #accessing }
QuestionComponent >> aQuestion [
	^ aQuestion
]

{ #category : #accessing }
QuestionComponent >> aQuestion: anObject [
	aQuestion := anObject
]

{ #category : #accessing }
QuestionComponent >> parent [
	^ parent
]

{ #category : #accessing }
QuestionComponent >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [
	aCanvas anchor
		callback: [  ];
		with: aQuestion titulo.
	aCanvas paragraph.
	self renderizarTopicos: aQuestion topicos conCanvas: aCanvas.
	aCanvas
		paragraph: [ aCanvas label: 'Realizada por: '.
			aCanvas anchor
				callback: [ self parent
						call:
							(PerfilUserComponent
								of: (self model obtenerAutorDePregunta: aQuestion)) ];
				with: (self model obtenerAutorDePregunta: aQuestion) nombre ].
	aCanvas space.
	aCanvas label: aQuestion respuestas size asString ,' respuestas'.
	aCanvas paragraph.
	aCanvas label
		with:
			aQuestion likes asString , ' likes | ' , aQuestion dislikes asString
				, ' dislikes'.
	aCanvas paragraph.
	self renderizarLikes: aCanvas
]

{ #category : #rendering }
QuestionComponent >> renderizarDetalleDeRespuestas: aCanvas [
	aCanvas paragraph: 'hola'.
]

{ #category : #rendering }
QuestionComponent >> renderizarLikes: aCanvas [
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
QuestionComponent >> renderizarTopicos: aTopics conCanvas: aCanvas [
	aTopics do: [ :topic | aCanvas label:topic nombre.
								  aCanvas space.]
]
