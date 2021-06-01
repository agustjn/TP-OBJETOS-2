Class {
	#name : #Topografia,
	#superclass : #Object,
	#category : #'OO2-TP3'
}

{ #category : #comparing }
Topografia >> = unaTopografia [ 
	self subclassResponsibility 
]

{ #category : #event }
Topografia >> calcularDesperdicio [
	self subclassResponsibility
]

{ #category : #queries }
Topografia >> calcularValor [
	^ 'El valor de la proporcion de agua es : '
		, self calcularValorDeAgua asFloat asString
		, ' , y el de tierra es: '
		, (self calcularValorDeTierra asFloat) asString
]

{ #category : #event }
Topografia >> calcularValorDeAgua [
    self subclassResponsibility 
]

{ #category : #event }
Topografia >> calcularValorDeTierra [
	self subclassResponsibility 
]
