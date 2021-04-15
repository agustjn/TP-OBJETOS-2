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
	aCanvas anchor
		callback: [ self call: HomeComponente new ];
		with: 'home'.
	aCanvas paragraph.
	 aCanvas anchor
		callback: [ self session user: nil.
			self answer ];
		with: 'Log out';
		class: 'logout'.
	aCanvas horizontalRule
]
