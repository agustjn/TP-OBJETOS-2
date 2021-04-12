Class {
	#name : #Reaccion,
	#superclass : #Object,
	#instVars : [
		'estado',
		'usuario',
		'fechaYHora'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialization }
Reaccion class >> newConEstado: aCondition Usuario: aUser [
	|instance|
	instance := self new .
	instance initializeConEstado: aCondition Usuario: aUser .
	^instance 
]

{ #category : #accessing }
Reaccion >> cambiarEstado: aCondition [
	estado := aCondition 
]

{ #category : #accessing }
Reaccion >> estado [ 
	^estado
]

{ #category : #initialization }
Reaccion >> initializeConEstado: aCondition Usuario: aUser [
	estado := aCondition .
	usuario := aUser .
	fechaYHora := DateAndTime today 
	
	 
]

{ #category : #queries }
Reaccion >> mismoUsuario: aUser [
	^ aUser == usuario 
]

{ #category : #accessing }
Reaccion >> usuario [ 
	^ usuario 
]
