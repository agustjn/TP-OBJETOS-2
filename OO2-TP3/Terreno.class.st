Class {
	#name : #Terreno,
	#superclass : #Topografia,
	#instVars : [
		'tipo'
	],
	#category : #'OO2-TP3'
}

{ #category : #'instance creation' }
Terreno class >> newOfAgua [
^ self new tipo: 'Agua'
]

{ #category : #'instance creation' }
Terreno class >> newOfTierra [
^ self new tipo: 'Tierra'
]

{ #category : #event }
Terreno >> calcularValorDeAgua [
	tipo = 'Agua'
		ifTrue:[ ^ 1].
	^ 0
		
]

{ #category : #accessing }
Terreno >> tipo [
	^ tipo
]

{ #category : #accessing }
Terreno >> tipo: anObject [
	tipo := anObject
]
