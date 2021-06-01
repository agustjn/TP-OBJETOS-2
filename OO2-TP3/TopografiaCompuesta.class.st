Class {
	#name : #TopografiaCompuesta,
	#superclass : #Topografia,
	#instVars : [
		'components'
	],
	#category : #'OO2-TP3'
}

{ #category : #queries }
TopografiaCompuesta >> = unaTopografia [
	"Esto solo anda para el ejemplo, si se compara una topografia simpe con una mixta da error"

	^ self components = unaTopografia components
]

{ #category : #accessing }
TopografiaCompuesta >> agregarTopografia: unTerreno [
	components add: unTerreno
]

{ #category : #queries }
TopografiaCompuesta >> calcularDesperdicio [
	"El promedio de desperdicio es el 15% del total del agua de la topografia + el 5% del total de tierra. Ademas si el promedio de desperdicio es menor al al 50%, se le suma un 3%"

	| promDesperdicio |
	promDesperdicio := self sumarDesperdicios.
	promDesperdicio < 0.5
		ifTrue: [ promDesperdicio := promDesperdicio * 1.03 ].
	^ promDesperdicio asFloat
]

{ #category : #queries }
TopografiaCompuesta >> calcularValorDeAgua [
	| cantAgua suma |
	suma := components
		sum: [ :component | component calcularValorDeAgua ].
	cantAgua := suma / components size.
	^ cantAgua asFloat
]

{ #category : #event }
TopografiaCompuesta >> calcularValorDeTierra [
	| cantTierra suma |
	suma := components
		sum: [ :component | component calcularValorDeTierra ].
	cantTierra := suma / components size.
	^ cantTierra asFloat
]

{ #category : #accessing }
TopografiaCompuesta >> components [
	^ components
]

{ #category : #initialize }
TopografiaCompuesta >> initialize [ 
	components := OrderedCollection new.
]

{ #category : #private }
TopografiaCompuesta >> sumarDesperdicios [
	^ components sum: [ :t | t calcularDesperdicio ]
]
