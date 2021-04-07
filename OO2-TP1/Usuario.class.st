Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contraseña',
		'fechaYhora',
		'seguidos',
		'topicosDeInteres',
		'preguntas'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialization }
Usuario class >> conNombre: aName yContraseña: aPassword [
	| instance |
	instance := self new.
	instance nombre: aName.
	instance contraseña: aPassword.
	instance fechaYhora: DateAndTime today.
	^ instance
]

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
Usuario >> contraseña: anObject [
	contraseña := anObject
]

{ #category : #accessing }
Usuario >> fechaYhora [
	^ fechaYhora
]

{ #category : #accessing }
Usuario >> fechaYhora: anObject [
	fechaYhora := anObject
]

{ #category : #initialization }
Usuario >> initialize [
	seguidos:= OrderedCollection new.
	topicosDeInteres := OrderedCollection new.
	preguntas := OrderedCollection new.
]

{ #category : #initialization }
Usuario >> initializeConNombre: aName contraseña: aPass [ 
	nombre:= aName .
	contraseña := aPass.
	fechaYhora := DateAndTime today .
	seguidos := OrderedCollection new.
	topicosDeInteres := OrderedCollection new.
	preguntas := OrderedCollection new .
	
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #accessing }
Usuario >> nombre: anObject [
	nombre := anObject
]

{ #category : #queries }
Usuario >> obtenerPreguntasConTopicos: aTopics oHechaPor: aUsers [
]

{ #category : #queries }
Usuario >> obtenerPreguntasDelTopico: aTopic [
	^ preguntas select: [ :preg | preg topicos includes: aTopic ]
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
