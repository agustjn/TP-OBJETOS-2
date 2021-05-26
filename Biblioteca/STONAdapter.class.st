Class {
	#name : #STONAdapter,
	#superclass : #Object,
	#category : #Biblioteca
}

{ #category : #exporting }
STONAdapter >> export: socios [
	| col ston |
	col := socios
		collect: [ :socio | 
			OrderedDictionary new
				at: #nombre put: socio nombre;
				at: #email put: socio email;
				at: #legajo put: socio legajo;
				yourself ].
	ston := STONWriter .
	^ ston prettyPrint: col
]
