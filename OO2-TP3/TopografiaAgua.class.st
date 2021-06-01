Class {
	#name : #TopografiaAgua,
	#superclass : #Topografia,
	#category : #'OO2-TP3'
}

{ #category : #queries }
TopografiaAgua >> = unaTopografia [
	^ unaTopografia compararConAgua
		
]

{ #category : #event }
TopografiaAgua >> calcularDesperdicio [
	^ 0.15
]

{ #category : #event }
TopografiaAgua >> calcularValorDeAgua [
	^ 1
]

{ #category : #queries }
TopografiaAgua >> compararConAgua [ 
	^ true 
]
