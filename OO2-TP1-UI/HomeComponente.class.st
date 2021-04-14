Class {
	#name : #HomeComponente,
	#superclass : #WAComponent,
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
HomeComponente >> renderContentOn: aCanvas [
	aCanvas heading with:'CuOOra' ; level: 4.
	
	aCanvas anchor
				   callback: [ self session user: nil.
									self answer ] ; 
								with:'Cerrar sesion'.
	
]
