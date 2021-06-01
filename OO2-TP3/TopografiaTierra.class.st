Class {
	#name : #TopografiaTierra,
	#superclass : #Topografia,
	#category : #'OO2-TP3'
}

{ #category : #queries }
TopografiaTierra >> = unaTopografia [
	^ self calcularValorDeTierra = unaTopografia calcularValorDeTierra
]

{ #category : #event }
TopografiaTierra >> calcularDesperdicio [
	^ 0.05
]

{ #category : #event }
TopografiaTierra >> calcularValorDeAgua [ 
	^ 0 
]

{ #category : #event }
TopografiaTierra >> calcularValorDeTierra [
	^ 1
]
