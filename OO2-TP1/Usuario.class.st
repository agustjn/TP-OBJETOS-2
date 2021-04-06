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
	instance name: aName.
	instance password: aPassword.
	instance fechaYhora: DateAndTime today.
	^ instance
]

{ #category : #accessing }
Usuario >> contraseña: anObject [
	contraseña := anObject
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

{ #category : #accessing }
Usuario >> nombre: anObject [
	nombre := anObject
]

{ #category : #queries }
Usuario >> obtenerPreguntasDeTopico: aTopic [
	^ preguntas select: [ :preg | preg topicos includes: aTopic ]
]
