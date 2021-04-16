Class {
	#name : #WebComponent,
	#superclass : #WAComponent,
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
WebComponent >> componentsStyles [
	^ ' 
	form { text-align:center;
			 background:lightgreen }
	h1 { text-align:center;
			font-family:fantasy;
						  } 
	h2 { text-align:center;
			font-family:Sans-serif;
						  } 
	h3 { text-align:center }
	strong { text-align: center;
				font-family: monospace;
				background:red }
	
	.logout { text-align: right }
	 
					
	  li { list-style:none;
		background : #f8f32b }
		
		.div-questions { background : lightgreen }
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

.new-question { text-align:center;
				    background:black } 
.question-detail { background: lightgreen }


	
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
			aCanvas heading 
			   level:3;
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
				class: 'logout'. ]
			
			 
]

{ #category : #rendering }
WebComponent >> style [
	^ self componentsStyles
]
