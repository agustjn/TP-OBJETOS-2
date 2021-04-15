Class {
	#name : #WebComponent,
	#superclass : #WAComponent,
	#category : #'OO2-TP1-UI'
}

{ #category : #accessing }
WebComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #rendering }
WebComponent >> renderNavOn: aCanvas [
	aCanvas heading
		with: 'CuOOra';
		level: 4.
	aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self session user: nil.
			self answer ];
		with: 'Cerrar sesion';
		class: 'logout'
]
