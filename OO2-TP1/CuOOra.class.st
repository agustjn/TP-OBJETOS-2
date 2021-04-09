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
CuOOra >> agregarPregunta: aQuestion deTopicos: aTopics delUsuario: aUser [
	"Inicialmente se agregan los topicos nuevos a la coleccion de CuOOra,
	 luego se envia al usuario correspondientepara que agregue la pregunta
	 a su respectiva coleccion"
	aTopics isCollection
		ifTrue: [ aTopics do:[ :topic | topic ifNotNil:[ self agregarTopico: topic] ] ]
		ifFalse: [ self agregarTopico: aTopics ].
	(usuarios detect:[ :user | user == aUser ]) agregarPregunta: aQuestion.
		
	
	
]

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
CuOOra >> obtenerPreguntas [
	
	usuarios do: [ :user | ^(user preguntas collect: [:preg| preg] )] .

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
CuOOra >> obtenerPreguntasDelUsuario: aUser [
 	 usuarios do: [ :user | user == aUser ifTrue: [ ^ aUser preguntas]  ]
]

{ #category : #queries }
CuOOra >> obtenerRespuestas: aQuestion [ 
"esta mal, falta calcular puntaje"
	^ aQuestion respuestas 

]

{ #category : #queries }
CuOOra >> preguntasRelevantesParaUsuario: aUser [
	"Se considera relevante una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o bien cuando fue realizada por alguno de los usuarios que sigue en la red social."
	| preguntasR preguntasRs|
	preguntasR := (aUser topicosDeInteres select: [ :topic | self obtenerPreguntasDeTopico: topic ]) asSet .
	preguntasRs := (aUser seguidos do: [ :user | user preguntas ] ) asSet .
	preguntasR addAll: preguntasRs .
	^preguntasR 
	
	
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
