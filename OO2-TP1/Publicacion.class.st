Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'likes',
		'dislikes',
		'horaYfecha'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #accessing }
Publicacion >> agregarDislike [
	dislikes := dislikes + 1
]

{ #category : #accessing }
Publicacion >> agregarLike [
	likes := likes + 1
]

{ #category : #initialization }
Publicacion >> initialize [
	likes:=0.
	dislikes:=0.
	horaYfecha := DateAndTime today.
	
]
