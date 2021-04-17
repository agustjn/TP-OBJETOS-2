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
		assert: ((anUser preguntas) includes: aQuestion)
]

{ #category : #testing }
TestCuOOra >> testAgregarTopico [
	"En este test prueba el funcionamiento de del metodo agregar topico de la clase cuOOra. Se crea un topico, se agrega a la instacia cuOOra, luego se verifica que esta este incluida en los topicos de cuOOra"

	| topic |
	topic := Topico
		newConNombre: 'Futbol'
		yDesc: 'Se habla de partidos de champions'.
	cuOOra agregarTopico: topic.
	self assert: (cuOOra topicos includes: topic)
]

{ #category : #testing }
TestCuOOra >> testAgregarUsuario [
"En este test se prueba el metodo agregar usuario de la clase cuOOra. Se crean dos usuarios, luego se agregan a la instacia de cuOOra y finalmete se verifica si estos estan incluidos en los usuarios de cuOOra"
	| user1 user2 |
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: 'pass1'.
	user2 := Usuario nuevoConNombre: 'Juan' yContraseña: 'pass2'.
	cuOOra
		agregarUsuario: user1;
		agregarUsuario: user2.
	self
		assert:
			(cuOOra usuarios
				includes: user1;
				includes: user2)
]

{ #category : #testing }
TestCuOOra >> testLikesAndDislikes [
	"En este test se prueba el funcionamiento del metodo de la clase reaccion y la cuenta de likes y dilikes. Se crean instancias de usuario, topico, pregunta y reaccion"
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
	"una vez agregado las reacciones a las publicaciones se verifica que los likes y dislikes sean correctos"
	self assert: pregunta likes identicalTo: 1.
	self assert: pregunta dislikes identicalTo: 0.
	"Se agrega otra reaccion para verificar el correcto funcionamiento"
	pregunta agregarReaccion: reaccion2.
	self assert: pregunta likes identicalTo: 0.
	self assert: pregunta dislikes identicalTo: 1
]

{ #category : #testing }
TestCuOOra >> testObtenerDeUnUserSusRespuestas [
	"En este test se prueba el funcionamiento del metodo obtener las respuestas de un usuario, se crea una instacia de usuario, respuesta, topico y pregunta. Se agregan a cuOOra"

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
	"Se verifica si la respuesta esta incluida en la busqueda para comprobar si es correcto el metodo"
	self
		assert: ((cuOOra obtenerRespuestasDelUsuario: user) includes: respuesta)
]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasDeTopico [
	| topic topic2 user1 preg1 preg2 auxCollection auxCollection2 |
	"En este test se prueba el funcionamiento del metodo obtener preguntas de topico de la clase cuOOra.
	auxCollection va a contener los topicos creados, para despues comprobar si la pregunta1
	esta relacionada a los topicos creados (topic y topic2)
	auxCollection 2 va a contener las preguntas 1 y 2 (preg1 y preg2) para despues comprobar
	si el mensaje '#obtenerPreguntasDeTopico' devuelve la coleccion deseada (auxCollection2)"
	topic := Topico
		newConNombre: 'Futbol'
		yDesc: 'Se habla de partidos de champions'.
	topic2 := Topico
		newConNombre: 'Deporte'
		yDesc: 'Se habla de deportes'.
	cuOOra
		agregarTopico: topic;
		agregarTopico: topic2.
	auxCollection := OrderedCollection new.
	auxCollection
		add: topic;
		add: topic2.
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: 'pass1'.
	cuOOra agregarUsuario: user1.
	preg1 := Pregunta
		newConTitulo: 'Messi salva la seleccion'
		yTexto:
			'El jugador del barcelona
	Liones Messi le metio 5 goles a brasiluski'
		relacionadoA: auxCollection.
	preg2 := Pregunta
		newConTitulo: 'Messi salva al barcelona'
		yTexto:
			'El jugador del barcelona
	Liones Messi le metio 5 goles a madrid'
		relacionadoA: auxCollection.
	user1 agregarPregunta: preg1.
	user1 agregarPregunta: preg2.
	auxCollection2 := OrderedCollection new.
	auxCollection2
		add: preg1;
		add: preg2.
	self
		assert: (cuOOra obtenerPreguntasDeTopico: topic)
		equals: auxCollection2
]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasRelevantesParaUsuario [
	"En este test se prueba el funcionamiento del metodo obtener preguntas relevantes para un usuario, se crean instancias de usuario, topico y pregunta"
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
	"Una vez creado todo y agregdo correctamente, se agrega al usuer un topico de interes(topic1) y sigue a otro usuario(user2)"
	user agregarTopicoDeInteres: topic1.
	user seguirUsuario: user2.
	"Se verifica que las preguntas obtenidas por el metedo sean correctas y solo sean esas"
	self
		assert: ((cuOOra preguntasRelevantesParaUsuario: user) includes: preg1).
	self
		assert: ((cuOOra preguntasRelevantesParaUsuario: user) includes: preg3).
	self
		assert: (cuOOra preguntasRelevantesParaUsuario: user) size
		identicalTo: 2
]

{ #category : #testing }
TestCuOOra >> testObtenerPuntajeDeUsuario [
	"En este test se prueba el funcionamiento del metodo calcularPuntajeDelUsuario, se crean instancias de las clases usuario, reaccion, respuesta, topico y pregunta"

	| respuesta pregunta topico user user2 reaccion1 reaccion2 |
	user := Usuario nuevoConNombre: 'Pepe' yContraseña: '123'.
	user2 := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	reaccion1 := Reaccion newConEstado: true Usuario: user2.
	reaccion2 := Reaccion newConEstado: false Usuario: user2.
	respuesta := Respuesta newCon: 'Tenes razon' Usuario: user.
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	pregunta := Pregunta
		newConTitulo: 'Messi'
		yTexto: 'Messi es el mejor'
		relacionadoA: topico.
	"Una vez creado todo, se agrega a la pregunta la respuesta, y a cuOOra el usuario y la pregunta"
	pregunta agregarRespuesta: respuesta.
	cuOOra agregarUsuario: user.
	cuOOra agregarPregunta: pregunta deTopicos: topico delUsuario: user.
	"Se agregan una reaccion para modificar el puntaje, el usuario agrego una pregunta(20) y una respuesta(50), la pregunta tiene una like(1) da un total de 71"
	pregunta agregarReaccion: reaccion1.
	self assert: (cuOOra obtenerPuntajeDelUsuario: user) identicalTo: 71.
	"Se agrega otra reaccion para modifical el puntaje a 70, un dislike a la respuesta"
	respuesta agregarReaccion: reaccion2.
	self assert: (cuOOra obtenerPuntajeDelUsuario: user) identicalTo: 70
]

{ #category : #testing }
TestCuOOra >> testUsuarioNombreConPassword [
	"En este test se prueba el funcionamiento del metodo usuarioNombreConPassword que verifica si el usuario existe en el sistema, se crean instancias de usuario"
	| anUser anUser2 |
	anUser := Usuario nuevoConNombre: 'juan' yContraseña: '123'.
	anUser2 := Usuario nuevoConNombre: 'pedro' yContraseña: '456'.
	"Se agregan al sistema"
	cuOOra agregarUsuario: anUser.
	cuOOra agregarUsuario: anUser2.
	"Se verifican que fueron agregados"
	self
		assert: (cuOOra usuarioNombre: 'juan' conPassword: '123')
		identicalTo: anUser.
	self
		assert: (cuOOra usuarioNombre: 'pedro' conPassword: '456')
		identicalTo: anUser2.
	self
		assert: (cuOOra usuarioNombre: 'asd' conPassword: '5565')
		identicalTo: nil
]
