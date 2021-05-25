Class {
	#name : #TopografiaCompuesta,
	#superclass : #Topografia,
	#category : #'OO2-TP3'
}

{ #category : #initialize }
TopografiaCompuesta >> calcularValor [
	^ 'El valor de la proporcion de agua es : ' , (self calcularValorDeAgua asFloat) asString , ' , y el de tierra es: ' , (1 - self calcularValorDeAgua asFloat) asString
	
	
]

{ #category : #initialize }
TopografiaCompuesta >> calcularValorDeAgua [

	| cantAgua suma |
	cantAgua := 0.
	suma := components sum: [ :component | component calcularValorDeAgua ].
	cantAgua := suma / components size.
	^cantAgua
	
	
]

{ #category : #initialize }
TopografiaCompuesta >> initialize [ 
	components := OrderedCollection new.
]
