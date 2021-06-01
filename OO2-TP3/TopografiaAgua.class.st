Class {
	#name : #TopografiaAgua,
	#superclass : #Topografia,
	#category : #'OO2-TP3'
}

{ #category : #queries }
TopografiaAgua >> = unaTopografia [ 
	^ self calcularValorDeAgua = unaTopografia calcularValorDeAgua 
]

{ #category : #event }
TopografiaAgua >> calcularDesperdicio [
	^ 0.15
]

{ #category : #event }
TopografiaAgua >> calcularValorDeAgua [
	^ 1
]

{ #category : #event }
TopografiaAgua >> calcularValorDeTierra [
	^ 0 
]
