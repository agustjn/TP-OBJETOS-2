Class {
	#name : #WebComponent,
	#superclass : #WAComponent,
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
WebComponent >> componentsStyles [
	^ ' 
	.cuoora-title { text-align:center;
						 font-family:Arial,Helvetica, sans-serif;
						  } 
	 .welcome { text-align:right;
					background:blue }
	 label { 
  font-size: 1.2rem;
  font-family: sans-serif;
  line-height: 1.4;
 }
	 .home-title { 
  font-size: 1.2rem;
  font-family: sans-serif;
  line-height: 1.4;

	 }
	.nav-bar { 
							background:lightgreen
						}
		 a {
  font-size: 1.2rem;
  font-family: sans-serif;
  line-height: 1.4;
}
		#home {
  outline: none;
  text-decoration: none;
  padding: 2px 1px 0;
		  }



	   a:visited {
  color: #437A16;
}

		a:focus {
  border-bottom: 1px solid;
  background: #black;
				}

			a:hover {
  border-bottom: 1px solid;
  background: #black;
}

			a:active {
  background: #265301;
  color: #CDFEAA;
}



	
		 '
]

{ #category : #accessing }
WebComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #rendering }
WebComponent >> renderNavOn: aCanvas [
	aCanvas div
		class: 'nav-bar';
		with: [ aCanvas heading
				class: 'cuoora-title';
				with: 'CuOOra';
				level: 4.
			aCanvas label
				class: 'welcome';
				with: 'Bienvenido : ' , self session user nombre.
			aCanvas
				paragraph: [ aCanvas label
						with: ' Volver a ';
						class: 'home-title'.
					aCanvas anchor
						id: 'home';
						callback: [ self call: HomeComponente new ];
						with: 'Inicio' ].
			aCanvas paragraph.
			aCanvas anchor
				callback: [ self session user: nil.
					self answer ];
				with: ' Cerrar sesion';
				class: 'logout'.
			aCanvas horizontalRule ]
]

{ #category : #rendering }
WebComponent >> style [
	^ self componentsStyles
]
