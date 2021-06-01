Class {
	#name : #TestTopografiaCompuesta,
	#superclass : #TestCase,
	#instVars : [
		'topografiaCompuesta'
	],
	#category : #'OO2-TP3-Tests'
}

{ #category : #running }
TestTopografiaCompuesta >> setUp [
	topografiaCompuesta := TopografiaCompuesta new .

	
]

{ #category : #testing }
TestTopografiaCompuesta >> testAgregarTopografia [
	| tt ta |
	ta := TopografiaAgua new.
	tt := TopografiaTierra new.
	topografiaCompuesta
		agregarTopografia: tt;
		agregarTopografia: ta.
	self assert: (topografiaCompuesta components includes: tt) .
	self assert: (topografiaCompuesta components includes: ta)
]
