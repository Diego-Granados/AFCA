"
Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	cuartodato:		<Object>
	destino:		<Object>
	fuente:		<Object>
	instruccion:		<Object>


    Implementation Points
"
Class {
	#name : #Instruction,
	#superclass : #Object,
	#instVars : [
		'instruccion',
		'destino',
		'fuente',
		'cuartodato'
	],
	#category : #AFCA
}

{ #category : #accessing }
Instruction >> cuartodato [
^cuartodato
]

{ #category : #accessing }
Instruction >> destino [
^destino
]

{ #category : #accessing }
Instruction >> fuente [
^fuente
]

{ #category : #initialization }
Instruction >> initialize: pInstruccion [
	instruccion := pInstruccion .
]

{ #category : #initialization }
Instruction >> initialize: pInstruccion destino: pDestino [
	instruccion := pInstruccion .
	destino := pDestino .
]

{ #category : #initialization }
Instruction >> initialize: pInstruccion destino: pDestino fuente: pFuente [
	instruccion := pInstruccion .
	destino := pDestino .
	fuente := pFuente .
]

{ #category : #initialization }
Instruction >> initialize: pInstruccion destino: pDestino fuente: pFuente dato: pDato [
	instruccion := pInstruccion .
	destino := pDestino .
	fuente := pFuente .
	cuartodato := pDato.
]

{ #category : #accessing }
Instruction >> instruccion [
^instruccion
]
