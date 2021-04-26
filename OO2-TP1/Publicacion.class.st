Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'reacciones',
		'horaYfecha'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #accessing }
Publicacion >> agregarReaccion: aReaction [
	"Recibe una reaccion, la agrega, y si el usuario ya habia reaccionado antes, borra la anterior"
	| reaccion |
	reaccion := self buscarReaccion: aReaction.
	reaccion
		ifNotNil: [ self quitarReaccion: reaccion.
			self aplicarReaccion: aReaction ]
		ifNil: [ self aplicarReaccion: aReaction ]
]

{ #category : #protected }
Publicacion >> aplicarReaccion: aReaction [
	reacciones add: aReaction
]

{ #category : #accessing }
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
	^ (self likes) - (self dislikes)
]

{ #category : #accessing }
Publicacion >> dislikes [
	^ (reacciones reject: [ :r | r estado ]) size
]

{ #category : #accessing }
Publicacion >> horaYFecha [
	^horaYfecha 
]

{ #category : #initialization }
Publicacion >> initialize [
	reacciones := OrderedCollection new.
	horaYfecha := DateAndTime now
]

{ #category : #accessing }
Publicacion >> likes [
	 ^ ((reacciones select: [ :r | r estado ]) size)
]

{ #category : #protected }
Publicacion >> quitarReaccion: aReaction [
	reacciones remove: aReaction
]

{ #category : #accessing }
Publicacion >> reacciones [ 
	^reacciones 
]
