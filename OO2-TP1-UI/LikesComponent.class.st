Class {
	#name : #LikesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'publication'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #initialization }
LikesComponent class >> of: aPublication [
	| instance | 
	instance := self new.
	instance publication: aPublication.
	^instance
]

{ #category : #accessing }
LikesComponent >> publication [
	^ publication
]

{ #category : #accessing }
LikesComponent >> publication: anObject [
	publication := anObject
]

{ #category : #rendering }
LikesComponent >> renderContentOn: aCanvas [
	aCanvas label
		with:
			' ' , publication likes asString , ' likes | '
				, publication dislikes asString , ' dislikes'.
	aCanvas paragraph.
	aCanvas anchor 	
			callback: [ publication 
							agregarReaccion: (Reaccion newConEstado:true Usuario:self session user).
							 ] ;
					with: 'Me gusta'.
	aCanvas space.
	aCanvas space.
	aCanvas anchor 		
					callback: [ publication 
							agregarReaccion: (Reaccion newConEstado:false Usuario:self session user). ] ;
					with: 'No me gusta'.
	
]
