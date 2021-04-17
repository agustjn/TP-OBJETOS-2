Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'likes',
		'dislikes',
		'reacciones',
		'horaYfecha'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #protected }
Publicacion >> agregarDislike [
	dislikes := dislikes + 1
]

{ #category : #protected }
Publicacion >> agregarLike [
	likes := likes + 1
]

{ #category : #protected }
Publicacion >> agregarReaccion: aReaction [
	"Recibe una reaccion, la agrega, y si el usuario ya habia reaccionado antes, borra la anterior"

	| reaccion |
	reaccion := self buscarReaccion: aReaction.
	reaccion ifNotNil: [ self quitarReaccion: reaccion .
								self aplicarReaccion: aReaction  ]
	ifNil: [ self aplicarReaccion: aReaction  ]
]

{ #category : #protected }
Publicacion >> aplicarReaccion: aReaction [
	aReaction estado
		ifTrue: [ self agregarLike ]
		ifFalse: [ self agregarDislike ] .
		reacciones add: aReaction 
]

{ #category : #protected }
Publicacion >> buscarReaccion: aReaction [
"cambiar nombrea  reaccion de un mismo user"
	| r |
	r := reacciones
		detect: [ :reaction | reaction mismoUsuario: aReaction usuario ]
		ifNone: [ ^ nil ].
	^ r
]

{ #category : #accessing }
Publicacion >> calcularPuntaje [
	^ likes - dislikes
]

{ #category : #accessing }
Publicacion >> dislikes [
	^ dislikes
]

{ #category : #accessing }
Publicacion >> horaYFecha [
	^horaYfecha 
]

{ #category : #initialization }
Publicacion >> initialize [
	likes := 0.
	dislikes := 0.
	reacciones := OrderedCollection new.
	horaYfecha := DateAndTime now.
	
]

{ #category : #accessing }
Publicacion >> likes [
	^ likes 
]

{ #category : #protected }
Publicacion >> quitarDislike [
	dislikes := dislikes - 1
]

{ #category : #protected }
Publicacion >> quitarLike [
	likes := likes - 1
]

{ #category : #protected }
Publicacion >> quitarReaccion: aReaction [
	aReaction estado
		ifTrue: [ self quitarLike ]
		ifFalse: [ self quitarDislike ].
	reacciones remove: aReaction
]

{ #category : #accessing }
Publicacion >> reacciones [ 
	^reacciones 
]
