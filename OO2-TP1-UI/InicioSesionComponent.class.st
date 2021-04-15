Class {
	#name : #InicioSesionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'password'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #'event handler' }
InicioSesionComponent >> manejarLogin [
	(self model usuarioNombre:nombre conPassword:password)
	
		ifNotNil:[ :it | self procederCon: it ]. 
	nombre := nil. 
	password := nil
	 
		
		
	
]

{ #category : #accessing }
InicioSesionComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #accessing }
InicioSesionComponent >> nombre [
	^ nombre
]

{ #category : #accessing }
InicioSesionComponent >> nombre: anObject [
	nombre := anObject
]

{ #category : #accessing }
InicioSesionComponent >> password [
	^ password
]

{ #category : #accessing }
InicioSesionComponent >> password: anObject [
	password := anObject
]

{ #category : #'event handler' }
InicioSesionComponent >> procederCon: anUser [
	| q |
	"Si el usuario existe en el sistema, se llama a este metodo para que se 
	recuerde la sesion del usuario y se renderize el componente Home"
	self session user: anUser.
	q := self session user.
	self halt.
	self call: HomeComponente new.
]

{ #category : #rendering }
InicioSesionComponent >> renderContentOn: aCanvas [
	aCanvas form: [  self renderizarItems: aCanvas .
						  aCanvas submitButton callback: [ self manejarLogin ] ;
										with:'Iniciar Sesion'.
					  ]
]

{ #category : #rendering }
InicioSesionComponent >> renderizarItems: aCanvas [
	aCanvas heading:'CUOORA' .
	aCanvas horizontalRule.
	aCanvas label:'Nombre de usuario'.
	aCanvas paragraph: [ aCanvas textInput on:#nombre of:self ].
	
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas textInput on:#password of:self ].
]
