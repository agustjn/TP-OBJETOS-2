Class {
	#name : #QuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'aQuestion',
		'parent'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #'instance creation' }
QuestionComponent class >> of: aQuestion [
	| instance |
	instance := self new.
	instance aQuestion: aQuestion.
	instance parent: nil.
	^instance
]

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
QuestionComponent >> model [
	^ CuOOra soleInstance
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
		callback: [ parent
				ifNotNil: [ self parent call: (QuestionDetailComponent of: aQuestion) ] ];
		with: aQuestion titulo.
	"Si soy un componente hijo y tengo padre, que el padre llame al componente, sino no hago nada"
	aCanvas paragraph.
	self renderizarTopicos: aQuestion topicos conCanvas: aCanvas.
	self renderizarAutor: aCanvas.
	aCanvas space.
	aCanvas label: aQuestion respuestas size asString , ' respuestas'.
	aCanvas paragraph.
	aCanvas render: (LikesComponent of: aQuestion)
	"aCanvas label
		with:
			' ' , aQuestion likes asString , ' likes | '
				, aQuestion dislikes asString , ' dislikes'.
	aCanvas paragraph.
	self renderizarLikes: aCanvas"
]

{ #category : #rendering }
QuestionComponent >> renderizarAutor: aCanvas [
	aCanvas
		paragraph: [ aCanvas label: 'Realizada por: '.
			aCanvas anchor
				callback: [ self parent
						call:
							(PerfilUserComponent
								of: (self model obtenerAutorDePregunta: aQuestion)) ];
				with: (self model obtenerAutorDePregunta: aQuestion) nombre ]
]

{ #category : #rendering }
QuestionComponent >> renderizarTopicos: aTopics conCanvas: aCanvas [
  aCanvas label: 'Topicos: '.
	aTopics do: [ :topic | aCanvas label:topic nombre.
								  aCanvas space.]
]
