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

{ #category : #queries }
Topografia >> calcularValor [
	^ 'El valor de la proporcion de agua es : ' , (self calcularValorDeAgua asFloat) asString , ' , y el de tierra es: ' , (1 - self calcularValorDeAgua asFloat) asString
	
	
]

{ #category : #event }
Topografia >> calcularValorDeAgua [
    self subclassResponsibility 
]

{ #category : #queries }
Topografia >> comparar: unaTopografia [
	self subclassResponsibility 
]

{ #category : #accessing }
Topografia >> components [
	^ components
]
