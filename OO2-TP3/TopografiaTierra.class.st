Class {
	#name : #TopografiaTierra,
	#superclass : #Topografia,
	#category : #'OO2-TP3'
}

{ #category : #queries }
TopografiaTierra >> = unaTopografia [
	^ unaTopografia compararConTierra
]

{ #category : #event }
TopografiaTierra >> calcularDesperdicio [
	^ 0.05
]

{ #category : #event }
TopografiaTierra >> calcularValorDeAgua [ 
	^ 0 
]

{ #category : #queries }
TopografiaTierra >> compararConTierra [ 
	^ true
]
