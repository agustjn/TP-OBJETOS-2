Class {
	#name : #NewQuestionComponent,
	#superclass : #WebComponent,
	#instVars : [
		'pregunta',
		'topico'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #rendering }
NewQuestionComponent >> pregunta [
	^ pregunta 
	
]

{ #category : #rendering }
NewQuestionComponent >> pregunta: aQuestion [ 
	pregunta:= aQuestion 
	
]

{ #category : #rendering }
NewQuestionComponent >> renderContentOn: aCanvas [
	
]

{ #category : #rendering }
NewQuestionComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Pregunta'.
	aCanvas paragraph: [ aCanvas textInput on: #Pregunta of: self ].
	aCanvas label: 'Topico'.
	aCanvas paragraph: [ aCanvas textInput on: #Topico of: self ].
	
	
]

{ #category : #rendering }
NewQuestionComponent >> topico: aTopic [
	topico := aTopic .
	
]
