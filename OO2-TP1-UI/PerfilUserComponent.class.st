Class {
	#name : #PerfilUserComponent,
	#superclass : #WebComponent,
	#instVars : [
		'user'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #'instance creation' }
PerfilUserComponent class >> of: aUser [
	| instance |
	instance := self new.
	instance user: aUser.
	^instance
]

{ #category : #rendering }
PerfilUserComponent >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas heading:'Preguntas de ' , user nombre , '  '.
	aCanvas anchor
					callback: [ self session user seguirUsuario: user ] ;
					with: 'Seguir'.
	aCanvas paragraph: [ self renderizarPreguntas: aCanvas. ]
	
]

{ #category : #rendering }
PerfilUserComponent >> renderizarLikes: aCanvas dePregunta: aQuestion [
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
PerfilUserComponent >> renderizarPregunta: aCanvas de: aQuestion [
	aCanvas label: aQuestion titulo.
	aCanvas paragraph.
	aCanvas label:'Topicos: '.
	self renderizarTopicos: aQuestion topicos conCanvas:aCanvas.
	aCanvas paragraph.
	aCanvas label: 'Realizada por: ', user nombre, ' | '.
	aCanvas label: aQuestion respuestas size asString, ' respuestas '.
	aCanvas paragraph.
	aCanvas label with: aQuestion likes asString, ' likes | ' , aQuestion dislikes asString, ' dislikes'.
	aCanvas paragraph.
	self renderizarLikes: aCanvas  dePregunta: aQuestion.
	
	
	
]

{ #category : #rendering }
PerfilUserComponent >> renderizarPreguntas: aCanvas [
	| questions |
	questions := user preguntas.
	aCanvas
		unorderedList: [ questions
				do: [ :question | 
					aCanvas
						listItem: [ (QuestionComponent of: question andParent: self) renderContentOn: aCanvas ] ] ]
]

{ #category : #rendering }
PerfilUserComponent >> renderizarTopicos: aTopics conCanvas: aCanvas [
	aTopics do: [ :topic | aCanvas label:topic nombre.
								  aCanvas space.]
]

{ #category : #accessing }
PerfilUserComponent >> user [
	^ user
]

{ #category : #accessing }
PerfilUserComponent >> user: anObject [
	user := anObject
]
