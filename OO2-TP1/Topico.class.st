Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'desc'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialization }
Topico class >> conNombre: aName yDesc: aDescription [
	| instance |
	instance := self new.
	instance name: aName.
	instance desc: aDescription.
	^ instance
]

{ #category : #accessing }
Topico >> desc: anObject [
	desc := anObject
]

{ #category : #accessing }
Topico >> nombre: anObject [
	nombre := anObject
]
