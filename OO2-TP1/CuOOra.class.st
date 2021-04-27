Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'topicos',
		'usuarios'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #accessing }
CuOOra class >> clearSoleInstance [ 
	soleInstance := nil.
]

{ #category : #'instance creation' }
CuOOra class >> instanciaDePrueba [
	| user1 user2 user3 topic1 topic2 topic3 preg1 preg2 resp1 respt2 topicos1 topicos2 |
	user1 := Usuario
		nuevoConNombre: 'pedro@cuoora.com'
		yContraseña: 'pedro@cuoora.com'.
	user2 := Usuario
		nuevoConNombre: 'diego@cuoora.com'
		yContraseña: 'diego@cuoora.com'.
	user3 := Usuario
		nuevoConNombre: 'juan@cuoora.com'
		yContraseña: 'juan@cuoora.com'.
	CuOOra soleInstance agregarUsuario: user1.
	CuOOra soleInstance agregarUsuario: user2.
	CuOOra soleInstance agregarUsuario: user3.
	topic1 := Topico newConNombre: 'OO1' yDesc: ''.
	topic2 := Topico newConNombre: 'Test de unidad' yDesc: ''.
	topic3 := Topico newConNombre: 'Smalltalk' yDesc: ''.
	topicos1 := OrderedCollection new.
	topicos2 := OrderedCollection new.
	topicos1 add: topic1.
	topicos1 add: topic2.
	topicos2 add: topic1.
	topicos2 add: topic3.
	CuOOra soleInstance agregarTopico: topic1.
	CuOOra soleInstance agregarTopico: topic2.
	CuOOra soleInstance agregarTopico: topic3.
	user2 agregarTopicoDeInteres: topic1.
	user1 agregarTopicoDeInteres: topic1.
	user3 seguirUsuario: user2.
	user1 seguirUsuario: user3 .
	
	preg1:= Pregunta newConTitulo: '¿Para qué sirve el método SetUp?' yTexto:''  relacionadoA: topicos1.
	preg2 := Pregunta newConTitulo: '¿Qué significa #messageNotUnderstood?' yTexto:''  relacionadoA:topicos2.
	
	resp1 := Respuesta newCon: 'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.' Usuario: user2.
	respt2 := Respuesta newCon: ': Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta.' Usuario: user1.

	preg1 agregarRespuesta: resp1.
	preg2 agregarRespuesta: respt2.
	
	user1 agregarPregunta: preg1.
	user2 agregarPregunta: preg2 .
	
]

{ #category : #accessing }
CuOOra class >> soleInstance [ 
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #accessing }
CuOOra >> agregarPregunta: aQuestion deTopicos: aTopics delUsuario: aUser [
	"Inicialmente se agregan los topicos nuevos a la coleccion de CuOOra,
	 luego se envia al usuario correspondientepara que agregue la pregunta
	 a su respectiva coleccion"

	aTopics isCollection
		ifTrue: [ aTopics
				do: [ :topic | topic ifNotNil: [ self agregarTopico: topic ] ] ]
		ifFalse: [ self agregarTopico: aTopics ].
	aUser agregarPregunta: aQuestion
]

{ #category : #accessing }
CuOOra >> agregarPreguntaConTitulo: aTitle descripcion: aDesc topicos: someTopicsString usuario: anUser [
	| topicosAgregados t |
	topicosAgregados := OrderedCollection new.
	someTopicsString
		do: [ :topicS | 
			(t := (self existe: topicS))
				ifNotNil: [ topicosAgregados add: t ]
				ifNil: [ topicosAgregados add: (Topico newConNombre: topicS yDesc: 'vacia').
					self agregarTopico: topicosAgregados last ] ].
	anUser
		agregarPregunta:
			(Pregunta
				newConTitulo: aTitle
				yTexto: aDesc
				relacionadoA: topicosAgregados)
]

{ #category : #accessing }
CuOOra >> agregarTopico: aTopic [
	(topicos anySatisfy: [ :t | t nombre = aTopic nombre ])
		ifFalse: [ topicos add: aTopic ]
]

{ #category : #accessing }
CuOOra >> agregarUsuario: aUser [
	usuarios add: aUser.
]

{ #category : #queries }
CuOOra >> calcularPuntajeDeRespuestas: someAnswers [
	^ (someAnswers
		sum: [ :a | a calcularPuntaje ]) + (someAnswers size * 50)
]

{ #category : #queries }
CuOOra >> cincoPreguntasRelevantesPara: anUser [
	| preguntas cincoPregutas |
	cincoPregutas := OrderedCollection new.
	preguntas := self preguntasRelevantesParaUsuario: anUser.
	1 to: 5 do: [ :i |  (i <= preguntas size) ifTrue: [ cincoPregutas add: (preguntas at: i)] ].
	^ cincoPregutas
]

{ #category : #accessing }
CuOOra >> existe: aString [

	^ topicos
		detect: [ :t | t mismoNombre: aString ]
		ifNone: [ nil ].
	
]

{ #category : #initialization }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #queries }
CuOOra >> obtenerAutorDePregunta: aQuestion [
	^ usuarios detect: [ :user | user existePregunta: aQuestion ]
]

{ #category : #queries }
CuOOra >> obtenerPreguntas [
	^ usuarios flatCollect: [ :user | user preguntas ]
]

{ #category : #queries }
CuOOra >> obtenerPreguntasDeTopico: aTopic [

	^ usuarios flatCollect: [ :u | u obtenerPreguntasDelTopico: aTopic ]
]

{ #category : #queries }
CuOOra >> obtenerPreguntasSinUsuario: anUser [
	| users |
	users := OrderedCollection new.
	users addAll: usuarios.
	users remove: anUser.
	^ users flatCollect: [ :user | user preguntas ]
]

{ #category : #queries }
CuOOra >> obtenerPuntajeDelUsuario: anUser [
	^ anUser calcularPuntajeDePreguntas
		+
			(self
				calcularPuntajeDeRespuestas: (self obtenerRespuestasDelUsuarioAOtrasPreg: anUser))
]

{ #category : #queries }
CuOOra >> obtenerRespuestas: aQuestion [
	^ aQuestion respuestasOrdenadas 
]

{ #category : #queries }
CuOOra >> obtenerRespuestasDelUsuario: anUser [
	| res |
	res := self obtenerPreguntas flatCollect: [ :p | p respuestas ] .
	^ (res select: [ :r | r perteneceA: anUser ])
	
]

{ #category : #queries }
CuOOra >> obtenerRespuestasDelUsuarioAOtrasPreg: anUser [
	| res |
	res := (self obtenerPreguntasSinUsuario: anUser)
		flatCollect: [ :p | p respuestas ].
	^ res select: [ :r | r perteneceA: anUser ]
]

{ #category : #queries }
CuOOra >> preguntasRelevantesParaUsuario: anUser [
	"Se considera relevante una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o bien cuando fue realizada por alguno de los usuarios que sigue en la red social."

	| preguntasR |
	preguntasR := (anUser topicosDeInteres
		flatCollect: [ :topic | self obtenerPreguntasDeTopico: topic ]) asSet.
	preguntasR
		addAll: (anUser seguidos flatCollect: [ :user | user preguntas ]).
	^ preguntasR
		asSortedCollection: [ :preg1 :preg2 | preg1 horaYFecha > preg2 horaYFecha ]
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOra >> usuarioNombre: aUsername conPassword: aPassword [
	^ usuarios
		detect: [ :user | user nombre = aUsername & (user password = aPassword) ]
		ifNone:[nil]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
