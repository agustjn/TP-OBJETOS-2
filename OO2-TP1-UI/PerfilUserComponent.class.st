Class {
	#name : #PerfilUserComponent,
	#superclass : #WebComponent,
	#instVars : [
		'user'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #'instance creation' }
PerfilUserComponent class >> of: aUser [
	| instance |
	instance := self new.
	instance user: aUser.
	^instance
]

{ #category : #rendering }
PerfilUserComponent >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas heading:'Preguntas de ' , user nombre , '  '.
	aCanvas anchor
					callback: [ self session user seguirUsuario: user ] ;
					with: 'Seguir'.
	aCanvas paragraph: [ self renderizarPreguntas: aCanvas. ]
	
]

{ #category : #private }
PerfilUserComponent >> renderizarPreguntas: aCanvas [
	| questions |
	questions := user preguntas.
	aCanvas
		unorderedList: [ questions
				do: [ :question | 
					aCanvas
						listItem: [ (QuestionComponent of: question andParent: self) renderContentOn: aCanvas ] ] ]
]

{ #category : #accesing }
PerfilUserComponent >> user [
	^ user
]

{ #category : #accesing }
PerfilUserComponent >> user: anObject [
	user := anObject
]
