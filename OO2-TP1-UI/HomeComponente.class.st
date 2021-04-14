Class {
	#name : #HomeComponente,
	#superclass : #WAComponent,
	#category : #'OO2-TP1-UI'
}

{ #category : #accessing }
HomeComponente >> model [
	^ CuOOra soleInstance
]

{ #category : #rendering }
HomeComponente >> renderContentOn: aCanvas [
	aCanvas div with: [ self renderizarHeading: aCanvas ].
	aCanvas horizontalRule.
	aCanvas div with: [ self renderizarPreguntas: aCanvas ]
	
	
]

{ #category : #rendering }
HomeComponente >> renderizarHeading: aCanvas [
	aCanvas heading with:'CuOOra' ; level: 4.
							  aCanvas horizontalRule.
							  aCanvas label:'Bienvenido '  , self session user nombre. 
							  aCanvas horizontalRule.
							  aCanvas anchor
				   						callback: [ self session user: nil.
														self answer ] ; 
									   with:'Cerrar sesion' ;
									   class:'logout'.
]

{ #category : #rendering }
HomeComponente >> renderizarItem:aCanvas de:aQuestion [
	aCanvas anchor 
					callback: [  ] ;
					with: (aQuestion first) titulo.
	"aCanvas paragraph: [ aCanvas label:'Realizada por: ' , ( self model obtenerAutorDePregunta:aQuestion first) nombre  ] "
	
]

{ #category : #rendering }
HomeComponente >> renderizarPreguntas: aCanvas [
	| questions |
	questions := self model preguntasRelevantesParaUsuario:(self session user).
	aCanvas heading:'Ultimas preguntas'.
	aCanvas unorderedList:[ questions 
										do: [ :pregunta | aCanvas listItem:( self renderizarItem:aCanvas de:pregunta) ] 
		
								 ]
	
	
	
]

{ #category : #styles }
HomeComponente >> style [
	^ ' 
	    *  { background:lightgreen ;
	 			 }
		 div  { background: green }
	'
]
