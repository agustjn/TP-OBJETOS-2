Class {
	#name : #BibliotecaTest,
	#superclass : #TestCase,
	#instVars : [
		'biblio',
		'arya',
		'tyron'
	],
	#category : #BibliotecaTest
}

{ #category : #running }
BibliotecaTest >> setUp [
	biblio := Biblioteca new.
	arya := Socio nombre: 'Arya Stark' email: 'needle@stark.com' legajo: '5234/5'.
	tyron := Socio
		nombre: 'Tyron Lannister'
		email: 'tyron@thelannisters.com'
		legajo: '2345/2'.
	biblio agregarSocio: arya.
	biblio agregarSocio: tyron.

]

{ #category : #testing }
BibliotecaTest >> testExportarSocios [
	| result |
	result := '[
	{
		"nombre" : "Arya Stark",
		"email" : "needle@stark.com",
		"legajo" : "5234/5"
	},
	{
		"nombre" : "Tyron Lannister",
		"email" : "tyron@thelannisters.com",
		"legajo" : "2345/2"
	}
]	
'.
	biblio exporter: VoorheesExporter new.
	self assert: (biblio exportarSocios hasEqualElements: result)
]

{ #category : #testing }
BibliotecaTest >> testExportarSociosComb [
	biblio exporter: VoorheesExporter new.
	self
		assert: (biblio exportarSocios
		hasEqualElements: (NeoJSONAdapter new export: biblio socios))
		
]

{ #category : #testing }
BibliotecaTest >> testExportarSociosSTON [
	biblio exporter: STONAdapter new.
	self
		assert:
			(biblio exportarSocios
				hasEqualElements: (NeoJSONAdapter new export: biblio socios))
]
