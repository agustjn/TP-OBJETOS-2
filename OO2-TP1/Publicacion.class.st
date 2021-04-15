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

{ #category : #private }
Publicacion >> agregarDislike [
	dislikes := dislikes + 1
]

{ #category : #private }
Publicacion >> agregarLike [
	likes := likes + 1
]

{ #category : #accessing }
Publicacion >> agregarReaccion: aReaction [
	"Recibe una reaccion, la agrega, y si el usuario ya habia reaccionado antes, borra la anterior"

	| reaccion |
	reaccion := self buscarReaccion: aReaction.
	reaccion ifNotNil: [ self quitarReaccion: reaccion .
								self aplicarReaccion: aReaction  ]
	ifNil: [ self aplicarReaccion: aReaction  ]
]

{ #category : #private }
Publicacion >> aplicarReaccion: aReaction [
	aReaction estado
		ifTrue: [ self agregarLike ]
		ifFalse: [ self agregarDislike ] .
		reacciones add: aReaction 
]

{ #category : #private }
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
	likes:=0.
	dislikes:=0.
	reacciones := OrderedCollection new .
	horaYfecha := DateAndTime today.
	
]

{ #category : #accessing }
Publicacion >> likes [
	^ likes 
]

{ #category : #private }
Publicacion >> quitarDislike [
	dislikes := dislikes - 1
]

{ #category : #private }
Publicacion >> quitarLike [
	likes := likes - 1
]

{ #category : #private }
Publicacion >> quitarReaccion: aReaction [
	aReaction estado
		ifTrue: [ self quitarLike ]
		ifFalse: [ self quitarDislike ].
	reacciones remove: aReaction
]
