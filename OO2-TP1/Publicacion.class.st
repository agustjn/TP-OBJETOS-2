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

{ #category : #accessing }
Publicacion >> agregarDislike [
	dislikes := dislikes + 1
]

{ #category : #accessing }
Publicacion >> agregarLike [
	likes := likes + 1
]

{ #category : #accessing }
Publicacion >> agregarReaccion: aReaction [
	"Recibe una reaccion, la agrega, y si el usuario ya habia reaccionado antes, borra la anterior"

	| reaccion |
	self aplicarReaccion: aReaction.
	reaccion := self buscarReaccion: aReaction.
	reaccion ifNotNil: [ self quitarReaccion: reaccion ]
]

{ #category : #accessing }
Publicacion >> aplicarReaccion: aReaction [
	aReaction estado
		ifTrue: [ self agregarLike ]
		ifFalse: [ self agregarDislike ] .
		reacciones add: aReaction 
]

{ #category : #accessing }
Publicacion >> buscarReaccion: aReaction [
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

{ #category : #initialization }
Publicacion >> initialize [
	likes:=0.
	dislikes:=0.
	reacciones := OrderedCollection new .
	horaYfecha := DateAndTime today.
	
]

{ #category : #accessing }
Publicacion >> quitarDislike [
	dislikes := dislikes - 1
]

{ #category : #accessing }
Publicacion >> quitarLike [
	likes := likes - 1
]

{ #category : #accessing }
Publicacion >> quitarReaccion: aReaction [
	aReaction estado
		ifTrue: [ self quitarLike ]
		ifFalse: [ self quitarDislike ].
	reacciones remove: aReaction
]
