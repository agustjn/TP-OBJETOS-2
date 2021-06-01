Class {
	#name : #TestTopografia,
	#superclass : #TestCase,
	#instVars : [
		'topografiaCompuesta',
		'topografiaCompuestaDos',
		'topografiaCompuestaTres'
	],
	#category : #'OO2-TP3-Tests'
}

{ #category : #running }
TestTopografia >> setUp [
	| t1 t2 t3 t4 |
	t1 := TopografiaAgua new.
	t2 := TopografiaTierra new.
	t3 := TopografiaTierra new.
	t4 := TopografiaAgua new.
	topografiaCompuesta := TopografiaCompuesta new.
	topografiaCompuesta
		agregarTopografia: t1;
		agregarTopografia: t2;
		agregarTopografia: t3;
		agregarTopografia: t4.
	topografiaCompuestaDos := TopografiaCompuesta new.
	topografiaCompuestaDos
		agregarTopografia: t1;
		agregarTopografia: t2;
		agregarTopografia: t3;
		agregarTopografia: t4.
	topografiaCompuestaTres := TopografiaCompuesta new.
	topografiaCompuestaTres
		agregarTopografia: t4;
		agregarTopografia: t1;
		agregarTopografia: t3;
		agregarTopografia: t2
]

{ #category : #testing }
TestTopografia >> testCalcularValorDeAgua [
	self 
		assert: topografiaCompuesta calcularValorDeAgua 
		identicalTo: 0.5
]

{ #category : #testing }
TestTopografia >> testCalcularValorDeTierra [
	self
		assert: topografiaCompuesta calcularValorDeTierra
		identicalTo: 0.5
]

{ #category : #testing }
TestTopografia >> testIgual [
	self
		assert: topografiaCompuesta = topografiaCompuestaDos
		equals: true .
	self
		assert: topografiaCompuesta = topografiaCompuestaTres 
		equals: false .
]
