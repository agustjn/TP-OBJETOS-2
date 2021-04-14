Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'password',
		'fechaYhora',
		'seguidos',
		'topicosDeInteres',
		'preguntas'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialization }
Usuario class >> nuevoConNombre: aName yContraseña: aPassword [
	| instance |
	instance := self new.
	instance initializeConNombre: aName contraseña: aPassword .
	^instance 
	
]

{ #category : #accessing }
Usuario >> agregarPregunta: aQuestion [
	preguntas add: aQuestion.
]

{ #category : #accessing }
Usuario >> agregarTopicoDeInteres: aTopic [
	topicosDeInteres add: aTopic .
]

{ #category : #accessing }
Usuario >> borrarPregunta: aQuestion [
	(preguntas anySatisfy: [ :p | p == aQuestion  ]) ifTrue: [preguntas remove: aQuestion]

	
]

{ #category : #accessing }
Usuario >> calcularPuntajeDePreguntas [
	^ preguntas sum: [ :p | p calcularPuntaje ] + (preguntas size * 20)
]

{ #category : #accessing }
Usuario >> fechaYhora [
	^ fechaYhora
]

{ #category : #initialization }
Usuario >> initializeConNombre: aName contraseña: aPass [ 
	nombre:= aName .
	password := aPass.
	fechaYhora := DateAndTime today .
	seguidos := OrderedCollection new.
	topicosDeInteres := OrderedCollection new.
	preguntas := OrderedCollection new .
	
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #queries }
Usuario >> obtenerPreguntasDelTopico: aTopic [
	^ preguntas select: [ :preg | preg topicos includes: aTopic ]
]

{ #category : #accessing }
Usuario >> password [
	^ password
]

{ #category : #accessing }
Usuario >> preguntas [
	^ preguntas 
]

{ #category : #accessing }
Usuario >> seguidos [
	^ seguidos
]

{ #category : #accessing }
Usuario >> seguirUsuario: aUser [
	seguidos add: aUser .
]

{ #category : #accessing }
Usuario >> topicosDeInteres [
	^ topicosDeInteres
]
