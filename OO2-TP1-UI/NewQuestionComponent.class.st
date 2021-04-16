Class {
	#name : #NewQuestionComponent,
	#superclass : #WebComponent,
	#instVars : [
		'tituloText',
		'descText',
		'topicoText'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #accessing }
NewQuestionComponent >> descText [
	^ descText
]

{ #category : #accessing }
NewQuestionComponent >> descText: anObject [
	descText := anObject
]

{ #category : #initialization }
NewQuestionComponent >> initialize [
	super initialize.
	tituloText := ''.
	descText:=''.
	topicoText:=''.
]

{ #category : #accessing }
NewQuestionComponent >> publicar [
	| tops |
	topicoText parseLiterals. 
	tops := topicoText splitOn: ','.
	self model
		agregarPreguntaConTitulo: tituloText
		descripcion: descText
		topicos: tops
		usuario: self session user.
	self answer
]

{ #category : #rendering }
NewQuestionComponent >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas form: [
		  aCanvas heading: 'Crear pregunta'.
        aCanvas label: 'Titulo: ' ; paragraph.
        aCanvas textInput on:#tituloText of:self.
        aCanvas break.
        aCanvas label: 'Descripcion: ' ; paragraph.
        aCanvas textArea on:#descText of:self.
        aCanvas break.
		  aCanvas label:'Topicos (separados por una ",")'; paragraph.
		  aCanvas textInput on:#topicoText of:self.
		  aCanvas break.
		  aCanvas paragraph.
        aCanvas submitButton
            callback: [ self publicar ];
            value: 'Publicar']
]

{ #category : #'accessing-styles' }
NewQuestionComponent >> style [
	^ self componentsStyles
]

{ #category : #accessing }
NewQuestionComponent >> tituloText [
	^ tituloText
]

{ #category : #accessing }
NewQuestionComponent >> tituloText: anObject [
	tituloText := anObject
]

{ #category : #rendering }
NewQuestionComponent >> topicoText [
	^topicoText 
]

{ #category : #rendering }
NewQuestionComponent >> topicoText: aTopicText [
	topicoText := aTopicText 
]
