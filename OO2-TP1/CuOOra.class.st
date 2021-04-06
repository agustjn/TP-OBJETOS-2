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
CuOOra >> obtenerPreguntaDeTopico: aTopic [
	^ usuarios collect: [ :user | user obtenerPreguntaDelTopico: aTopic]
	
]
