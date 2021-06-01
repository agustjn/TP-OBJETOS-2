Class {
	#name : #TestTopografia,
	#superclass : #TestCase,
	#instVars : [
		'topografiaCompuesta',
		'topografiaCompuestaDos',
		'topografiaCompuestaTres',
		't1',
		't2',
		't3',
		't4'
	],
	#category : #'OO2-TP3-Tests'
}

{ #category : #running }
TestTopografia >> setUp [
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
	self assert: topografiaCompuesta calcularValorDeAgua identicalTo: 0.5. "Es una topografia compuesta"
	self assert: t1 calcularValorDeAgua identicalTo: 1.	"Es una topografia de agua"
	self assert: t2 calcularValorDeAgua identicalTo: 0	"Es una topografia de tierra"
]

{ #category : #testing }
TestTopografia >> testCalcularValorDeTierra [
	self
		assert: topografiaCompuesta calcularValorDeTierra
		identicalTo: 0.5. "Es una topografia compuesta"
	self assert: t1 calcularValorDeTierra identicalTo: 0.	"Es una topografia de agua"
	self assert: t2 calcularValorDeTierra identicalTo: 1	"Es una topografia de tierra"
]

{ #category : #testing }
TestTopografia >> testIgual [
	self assert: topografiaCompuesta = topografiaCompuestaDos. "Compara dos compuestas iguales"
	self assert: topografiaCompuestaDos = topografiaCompuesta.
	""
	self deny: topografiaCompuesta = topografiaCompuestaTres. "Compara dos compuestas distintas"
	self deny: topografiaCompuestaTres = topografiaCompuesta.
	""
	self deny: topografiaCompuesta = t1. "Comparar una compuesta con una simple"
	self deny: t1 = topografiaCompuesta.
	""
	self assert: t1 = t4.	"Se compara agua con agua"
	self assert: t4 = t1.
	""
	self deny: t1 = t2.	"Se compara agua con tierra"
	self deny: t2 = t1
]
