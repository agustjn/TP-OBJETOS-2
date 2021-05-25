Class {
	#name : #Topografia,
	#superclass : #Object,
	#instVars : [
		'components'
	],
	#category : #'OO2-TP3'
}

{ #category : #accessing }
Topografia >> agregarTerreno: unTerreno [
	components add: unTerreno
]

{ #category : #event }
Topografia >> calcularValorDeAgua [
    self subclassResponsibility 
]
