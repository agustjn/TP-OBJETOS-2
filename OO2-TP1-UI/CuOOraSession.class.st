Class {
	#name : #CuOOraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #accessing }
CuOOraSession >> user [
	^ user
]

{ #category : #accessing }
CuOOraSession >> user: anObject [
	user := anObject
]
