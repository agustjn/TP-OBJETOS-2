Class {
	#name : #NeoJSONAdapter,
	#superclass : #Object,
	#category : #Biblioteca
}

{ #category : #exporting }
NeoJSONAdapter >> export: socios [ 
	
	| col |
	col := socios collect:[ :socio | OrderedDictionary new at:#nombre put:socio nombre;   at:#email put:socio email ; at:#legajo put:socio legajo ;yourself ].
	^ NeoJSONWriter toStringPretty: col.
	
]
