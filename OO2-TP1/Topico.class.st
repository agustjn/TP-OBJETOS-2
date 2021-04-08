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
Topico class >> newConNombre: aName yDesc: aDescription [
	| instance |
	instance := self new.
	instance initializeConNombre: aName  descripcion: aDescription .
	^ instance
]

{ #category : #initialization }
Topico >> initializeConNombre: aName descripcion: aDesc [
	nombre := aName .
	desc := aDesc .
]
