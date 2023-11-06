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
	#classVars : [
		'CodificationInstructions',
		'CodificationOperands'
	],
	#category : #AFCA
}

{ #category : #'class initialization' }
Instruction class >> initialize [
	"Se inicializa el diccionario que va a codificar los operandos de acuerdo con su nombre"
	CodificationOperands := Dictionary new.
	CodificationOperands	at: 'ax'  put: 0;
		at: 'bx'  put: 1;
		at: 'cx'  put: 2;
		at: 'dx'  put: 3;
		at: 'al'  put: 4;
		at: 'ah'  put: 5;
		at: 'bl'  put: 6;
		at: 'bh'  put: 7;
		at: 'cl'  put: 8;
		at: 'ch'  put: 9;
		at: 'dl'  put: 10;
		at: 'dh'  put: 11;
		at: '[dir]'  put: 12;
		at: '[bx]'  put: 13;
		at: '[bl]'  put: 14;
		at: '[bh]'  put: 15;
		at: 'inm'  put: 16.
	
	"Se inicializa el diccionario que va a codificar los operandos y las instrucciones de acuerdo con su nombre"
	CodificationInstructions := Dictionary new.
	CodificationInstructions	at: 'mov'  put: 0;
		at: 'out'  put: 1;
		at: 'in'  put: 2;
		at: 'jmp'  put: 3;
		at: 'jz'  put: 4;
		at: 'cmp'  put: 5;
		at: 'cli' put: 6;
		at: 'sti'  put: 7;
		at: 'add' put: 8;
		at: 'sub' put: 9;
		at: 'mul' put: 10;
		at: 'div' put: 11;
		at: 'and' put: 12;
		at: 'or' put: 13;
		at: 'not' put: 14;
		at: 'shl' put: 15;
		at: 'shr' put: 16;
		at: 'stc' put: 17;
		at: 'stz' put: 18;
		at: 'sts' put: 19;
		at: 'clc' put: 20;
		at: 'clz' put: 21;
		at: 'cls' put: 22;
		at: 'xor' put: 23;
		at: 'stop' put: 255.

]

{ #category : #converting }
Instruction >> asString [
	| string |
	string := '' .
	instruccion ifNotNil: [ 
		string := string, (instruccion asString)
		 ] .
	destino ifNotNil: [ 
		string := string, (destino asString)
		 ] .
	fuente ifNotNil: [ 
		string := string, (fuente asString)
		 ] .
	cuartodato ifNotNil: [ 
		string := string, (cuartodato asString)
		 ] .
	^string.
]

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

{ #category : #accessing }
Instruction >> getImmediate: operand [
	| immediateString |
				immediateString := operand allButFirst allButLast.
				cuartodato := immediateString asNumber.

]

{ #category : #accessing }
Instruction >> initialize: pInstruccion [
instruccion := CodificationInstructions at: pInstruccion.

]

{ #category : #accessing }
Instruction >> initialize: pInstruccion destino: pDestino [
	instruccion := CodificationInstructions at: pInstruccion.
	destino := ((pDestino first) = $[)
		ifFalse: [
			((pDestino startsWithDigit) and: (pDestino endsWithDigit))
			ifTrue: [cuartodato := pDestino asNumber.
				CodificationOperands at: 'inm']
			ifFalse: [CodificationOperands at: pDestino].
			]
		ifTrue: [
				((pDestino second) = $b)
				ifFalse: [
					self getImmediate: pDestino.
					CodificationOperands at: '[dir]'.]
				ifTrue: [CodificationOperands at: pDestino].
			].

]

{ #category : #accessing }
Instruction >> initialize: pInstruccion destino: pDestino fuente: pFuente [
	instruccion := CodificationInstructions at: pInstruccion.
	destino := ((pDestino first) = $[)
		ifFalse: [
			((pDestino startsWithDigit) and: (pDestino endsWithDigit))
			ifTrue: [cuartodato := pDestino asNumber.
				CodificationOperands at: 'inm']
			ifFalse: [CodificationOperands at: pDestino].
			]
		ifTrue: [
				((pDestino second) = $b)
				ifFalse: [
					self getImmediate: pDestino.
					CodificationOperands at: '[dir]'.]
				ifTrue: [CodificationOperands at: pDestino].
			].
	fuente := ((pFuente first) = $[)
		ifFalse: [
			((pFuente startsWithDigit) and: (pFuente endsWithDigit))
			ifTrue: [cuartodato := pFuente asNumber.
				CodificationOperands at: 'inm']
			ifFalse: [CodificationOperands at: pFuente].
			]
		ifTrue: [
				((pFuente second) = $b)
				ifFalse: [
					self getImmediate: pFuente.
					CodificationOperands at: '[dir]'.]
				ifTrue: [CodificationOperands at: pFuente].
			].

]

{ #category : #accessing }
Instruction >> initialize: pInstruccion destino: pDestino fuente: pFuente dato: pDato [
	instruccion := pInstruccion .
destino := ((pDestino first) = $[)
		ifFalse: [
			((pDestino startsWithDigit) and: (pDestino endsWithDigit))
			ifTrue: [cuartodato := pDestino asNumber.
				CodificationOperands at: 'inm']
			ifFalse: [CodificationOperands at: pDestino].
			]
		ifTrue: [
				((pDestino second) = $b)
				ifFalse: [
					self getImmediate: pDestino.
					CodificationOperands at: '[dir]'.]
				ifTrue: [CodificationOperands at: pDestino].
			].
	fuente := ((pFuente first) = $[)
		ifFalse: [
			((pFuente startsWithDigit) and: (pFuente endsWithDigit))
			ifTrue: [cuartodato := pFuente asNumber.
				CodificationOperands at: 'inm']
			ifFalse: [CodificationOperands at: pFuente].
			]
		ifTrue: [
				((pFuente second) = $b)
				ifFalse: [
					self getImmediate: pFuente.
					CodificationOperands at: '[dir]'.]
				ifTrue: [CodificationOperands at: pFuente].
			].
	cuartodato := pDato.

]

{ #category : #initialization }
Instruction >> initializeNumber: pInstruccion [
	instruccion := pInstruccion.

]

{ #category : #initialization }
Instruction >> initializeNumber: pInstruccion destino: pDestino [
	instruccion := pInstruccion.
	destino := pDestino.

]

{ #category : #initialization }
Instruction >> initializeNumber: pInstruccion destino: pDestino fuente: pFuente [
	instruccion := pInstruccion.
	destino := pDestino.
	fuente := pFuente.

]

{ #category : #initialization }
Instruction >> initializeNumber: pInstruccion destino: pDestino fuente: pFuente dato: pDato [
	instruccion := (pInstruccion asNumber).
	(pDestino = 'nil') ifFalse: [destino := (pDestino asNumber).].
	(pFuente = 'nil') ifFalse: [fuente := (pFuente asNumber)].
	(pDato = 'nil') ifFalse: [cuartodato := (pDato asNumber)].

]

{ #category : #accessing }
Instruction >> instruccion [
^instruccion
]
