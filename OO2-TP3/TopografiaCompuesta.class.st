Class {
	#name : #TopografiaCompuesta,
	#superclass : #Topografia,
	#category : #'OO2-TP3'
}

{ #category : #queries }
TopografiaCompuesta >> calcularDesperdicio [
	| cantAgua promDesperdicio suma |
	cantAgua := 0.
	suma := components
		sum: [ :component | component calcularValorDeAgua ].
	cantAgua := suma / components size.
	"El promedio de desperdicio es el 15% del total del agua de la topografia + el 5% del total de tierra"
	promDesperdicio := cantAgua * 0.15 + ((1 - cantAgua) * 0.05).
	promDesperdicio < 0.5
		ifTrue: [ promDesperdicio := promDesperdicio * 1.03 ].	"Si el promedio de desperdicio es menor al al 50%, se le suma un 3%"
	^ promDesperdicio
]

{ #category : #queries }
TopografiaCompuesta >> calcularValor [
	^ 'El valor de la proporcion de agua es : ' , (self calcularValorDeAgua asFloat) asString , ' , y el de tierra es: ' , (1 - self calcularValorDeAgua asFloat) asString
	
	
]

{ #category : #queries }
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
