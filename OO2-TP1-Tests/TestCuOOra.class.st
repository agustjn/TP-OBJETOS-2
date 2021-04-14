Class {
	#name : #TestCuOOra,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestCuOOra >> setUp [
   cuOOra := CuOOra new.
]

{ #category : #testing }
TestCuOOra >> testAgregarPreguntaDeTopicosDelUsuario [
	| anUser aQuestion topic |
	anUser := Usuario nuevoConNombre: 'Agustin' yContraseña: '123'.
	topic := Topico
		newConNombre: 'Futbol'
		yDesc: 'Se habla de partidos de champions'.
	aQuestion := Pregunta
		newConTitulo: 'Autos'
		yTexto: 'Habia unos autos'
		relacionadoA: topic.
	cuOOra agregarUsuario: anUser.
	cuOOra agregarTopico: topic.
	cuOOra agregarPregunta: aQuestion deTopicos: topic delUsuario: anUser.
	self
		assert: (cuOOra obtenerPreguntasDeTopico: topic) first
		equals: aQuestion.
	self
		assert: ((cuOOra obtenerPreguntasDelUsuario: anUser) includes: aQuestion )
		
]

{ #category : #testing }
TestCuOOra >> testAgregarRespuesta [
	| respuesta pregunta topico user |
	user := Usuario nuevoConNombre: 'pepe' yContraseña: '123'.
	respuesta := Respuesta newCon: 'Tenes razon' Usuario: user .
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	pregunta := Pregunta
		newConTitulo: 'Messi'
		yTexto: 'Messi es el mejor'
		relacionadoA: topico.
	pregunta agregarRespuesta: respuesta.
	self assert: (pregunta respuestas includes: respuesta)
]

{ #category : #testing }
TestCuOOra >> testAgregarTopico [
	| topic |
	topic := Topico newConNombre: 'Futbol' yDesc: 'Se habla de partidos de champions' . 
	cuOOra agregarTopico: topic.
	self assert: (cuOOra topicos includes: topic).
]

{ #category : #testing }
TestCuOOra >> testAgregarUsuario [
	|user1 user2|
	
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: 'pass1' .
	user2 := Usuario nuevoConNombre: 'Juan' yContraseña: 'pass2' .
	cuOOra agregarUsuario: user1 ; agregarUsuario: user2.
	self assert: (cuOOra usuarios includes:user1 ; includes:user2).
	

	
]

{ #category : #testing }
TestCuOOra >> testBorrarPregunta [
	| preg topic user |
	topic := Topico newConNombre: '' yDesc: ''.
	preg := Pregunta newConTitulo: 'hola' yTexto: '' relacionadoA: topic.
	user := Usuario nuevoConNombre: 'Pablo' yContraseña: '123'.
	cuOOra agregarUsuario: user .
	cuOOra agregarPregunta: preg deTopicos: topic delUsuario: user.
	self assert: (cuOOra obtenerPreguntas includes: preg).
	self assert: (user preguntas includes: preg).
	user borrarPregunta: preg.
	self assert: user preguntas size identicalTo: 0.
	self assert: cuOOra obtenerPreguntas size identicalTo: 0
]

{ #category : #testing }
TestCuOOra >> testCalcularPuntajeDeUsuario [
	| respuesta pregunta topico user user2 reaccion1 reaccion2 |
	user := Usuario nuevoConNombre: 'Pepe' yContraseña: '123'.
	user2 := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	reaccion1 := Reaccion newConEstado: true Usuario: user2.
	reaccion2 := Reaccion newConEstado: true Usuario: user2.
	respuesta := Respuesta newCon: 'Tenes razon' Usuario: user.
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	pregunta := Pregunta
		newConTitulo: 'Messi'
		yTexto: 'Messi es el mejor'
		relacionadoA: topico.
	pregunta agregarRespuesta: respuesta.
	cuOOra agregarUsuario: user.
	cuOOra agregarPregunta: pregunta deTopicos: topico delUsuario: user.
	pregunta agregarReaccion: reaccion1.
	respuesta agregarReaccion: reaccion2.
	self assert: (cuOOra obtenerPuntajeDelUsuario: user) identicalTo: 72
]

{ #category : #testing }
TestCuOOra >> testConocerDeUnUserSusRespuestas [
	| respuesta pregunta topico user |
	user := Usuario nuevoConNombre: 'Pepe' yContraseña: '123'.
	respuesta := Respuesta newCon: 'Tenes razon' Usuario: user.
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	pregunta := Pregunta
		newConTitulo: 'Messi'
		yTexto: 'Messi es el mejor'
		relacionadoA: topico.
	pregunta agregarRespuesta: respuesta.
	cuOOra agregarUsuario: user.
	cuOOra agregarPregunta: pregunta deTopicos: topico delUsuario: user.
	self
		assert: ((cuOOra obtenerRespuestasDelUsuario: user) includes: respuesta)
]

{ #category : #testing }
TestCuOOra >> testLikesAndDislikes [
	| pregunta topico reaccion1 reaccion2 user |
	user := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	pregunta := Pregunta
		newConTitulo: 'Messi'
		yTexto: 'Messi es el mejor actual'
		relacionadoA: topico.
	reaccion1 := Reaccion newConEstado: true Usuario: user.
	pregunta agregarReaccion: reaccion1.
	reaccion2 := Reaccion newConEstado: false Usuario: user.
	self assert: pregunta likes identicalTo: 1.
	self assert: pregunta dislikes identicalTo: 0.
	pregunta agregarReaccion: reaccion2.
	self assert: pregunta likes identicalTo: 0.
	self assert: pregunta dislikes identicalTo: 1
]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasDeTopico [
	
	|topic topic2 user1 preg1 preg2 auxCollection auxCollection2|
	"auxCollection va a contener los topicos creados, para despues comprobar si la pregunta1
	esta relacionada a los topicos creados (topic y topic2)
	auxCollection 2 va a contener las preguntas 1 y 2 (preg1 y preg2) para despues comprobar
	si el mensaje '#obtenerPreguntasDeTopico' devuelve la coleccion deseada (auxCollection2)"

	topic := Topico newConNombre: 'Futbol' yDesc: 'Se habla de partidos de champions' .
	topic2 := Topico newConNombre: 'Deporte' yDesc: 'Se habla de deportes' .
	cuOOra agregarTopico: topic ; agregarTopico: topic2.
	auxCollection := OrderedCollection new.
	auxCollection add:topic ; add:topic2.
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: 'pass1'.
	cuOOra agregarUsuario: user1.
	preg1 := Pregunta newConTitulo: 'Messi salva la seleccion' yTexto: 'El jugador del barcelona
	Liones Messi le metio 5 goles a brasiluski' relacionadoA: auxCollection.
	preg2:= Pregunta newConTitulo: 'Messi salva al barcelona'  yTexto: 'El jugador del barcelona
	Liones Messi le metio 5 goles a madrid' relacionadoA: auxCollection.
	user1 agregarPregunta: preg1.
	user1 agregarPregunta: preg2.
	auxCollection2 := OrderedCollection new.
	auxCollection2 add: preg1 ; add: preg2.
	self assert: (cuOOra obtenerPreguntasDeTopico: topic ) equals: auxCollection2.

	

]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasRelevantesParaUsuario [
	| user user2 user3 topic1 topic2 topic3 preg1 preg2 preg3 |
	user := Usuario nuevoConNombre: 'Juan' yContraseña: '123'.
	user2 := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	user3 := Usuario nuevoConNombre: 'Messi' yContraseña: '123'.
	topic1 := Topico newConNombre: 'Futbol' yDesc: ''.
	topic2 := Topico newConNombre: 'Basquet' yDesc: ''.
	topic3 := Topico newConNombre: 'Informatica' yDesc: ''.
	preg1 := Pregunta
		newConTitulo: 'Juega Argentina?'
		yTexto: ''
		relacionadoA: topic1.
	preg2 := Pregunta
		newConTitulo: 'Campazzo a la NBA?'
		yTexto: ''
		relacionadoA: topic2.
	preg3 := Pregunta
		newConTitulo: 'Algun desarollador?'
		yTexto: ''
		relacionadoA: topic3.
	cuOOra agregarUsuario: user.
	cuOOra agregarUsuario: user2.
	cuOOra agregarUsuario: user3.
	cuOOra agregarTopico: topic1.
	cuOOra agregarTopico: topic2.
	cuOOra agregarTopico: topic3.
	cuOOra agregarPregunta: preg1 deTopicos: topic1 delUsuario: user2.
	cuOOra agregarPregunta: preg3 deTopicos: topic3 delUsuario: user2.
	cuOOra agregarPregunta: preg2 deTopicos: topic2 delUsuario: user3.
	user agregarTopicoDeInteres: topic1.
	user seguirUsuario: user2.
	self
		assert: ((cuOOra preguntasRelevantesParaUsuario: user) includes: preg1).
	self
		assert: ((cuOOra preguntasRelevantesParaUsuario: user) includes: preg3).
	self
		assert: (cuOOra preguntasRelevantesParaUsuario: user) size
		identicalTo: 2
]

{ #category : #testing }
TestCuOOra >> testRespuestasAPregunta [
	| preg res1 res2 topic user|
	user:= Usuario nuevoConNombre: 'Agus' yContraseña: '123'.
	topic := Topico newConNombre: '' yDesc: ''.
	preg := Pregunta newConTitulo: 'Hola?' yTexto: '' relacionadoA: topic.
	res1 := Respuesta newCon: 'buenas' Usuario: user.
	res2 := Respuesta newCon: 'buen dia' Usuario: user.
	preg agregarRespuesta: res1.
	preg agregarRespuesta: res2.
	self assert: (preg respuestas includes: res1).
	self assert: (preg respuestas includes: res2).
	self assert: preg respuestas size identicalTo: 2
]

{ #category : #testing }
TestCuOOra >> testUsuarioAgregarTopicoDeInt [
	|user topic|
	user := Usuario nuevoConNombre: 'Pedro' yContraseña: '123' .
	topic := Topico newConNombre: 'Futbol' yDesc: '' .
	user agregarTopicoDeInteres: topic .
	self assert: (user topicosDeInteres includes: topic).
]

{ #category : #testing }
TestCuOOra >> testUsuarioNombreConPassword [
	| anUser anUser2 |
	anUser := Usuario nuevoConNombre: 'juan' yContraseña: '123'.
	anUser2 := Usuario nuevoConNombre: 'pedro' yContraseña: '456'.
	cuOOra agregarUsuario: anUser.
	cuOOra agregarUsuario: anUser2.
	self assert:(cuOOra usuarioNombre: 'juan' conPassword: '123') == anUser.
	self assert:(cuOOra usuarioNombre: 'pedro' conPassword: '456') == anUser2.
	self assert:(cuOOra usuarioNombre: 'asd' conPassword: '5565') == nil.
]

{ #category : #testing }
TestCuOOra >> testUsuarioNombrePassword [
]

{ #category : #testing }
TestCuOOra >> testUsuarioSigueAOtro [
	| user1 user2 |
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	user2 := Usuario nuevoConNombre: 'Juan' yContraseña: '123'.
	user1 seguirUsuario:  user2.
	self assert: (user1 seguidos includes: user2)
]
