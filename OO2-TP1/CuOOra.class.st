Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'topicos',
		'usuarios'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #accessing }
CuOOra >> agregarTopico: aTopic [
	topicos add: aTopic.
]

{ #category : #accessing }
CuOOra >> agregarUsuario: aUser [
	usuarios add: aUser.
]

{ #category : #initialization }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #queries }
CuOOra >> obtenerPreguntasDeTopico: aTopic [
"Se retorna la coleccion de preguntas segun el topico recibido como parametro.
 Por cada usuario se retorna una coleccion de preguntas (si es que son relacionadas al topico)
 y por cada coleccion de los usuarios recibida (#obtenerPreguntasDelTopico) 
 se itera a la coleccion agregando las preguntas validas."
	| coleccionPreguntas |
	coleccionPreguntas := OrderedCollection new.
	usuarios
		do: [ :user | 
			(user obtenerPreguntasDelTopico: aTopic)
				do: [ :preg | preg ifNotNil: [ coleccionPreguntas add: preg ] ] ].
	^ coleccionPreguntas
	

]

{ #category : #queries }
CuOOra >> preguntasRelevantesParaUsuario: aUser [
	"Se considera relevante una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o bien cuando fue realizada por alguno de los usuarios que sigue en la red social."
	usuarios do: [ :user | user obtenerRelevantesDe: aUser ]
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
