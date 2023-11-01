"
Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	b1:		<Object>
	b2:		<Object>
	b3:		<Object>
	b4:		<Object>
	busdatos:		<Object>


    Implementation Points
"
Class {
	#name : #ALUnit,
	#superclass : #Object,
	#instVars : [
		'b1',
		'b2',
		'b3',
		'b4',
		'busdatos'
	],
	#category : #AFCA
}

{ #category : #operating }
ALUnit >> add [
	|value number1 number2 digit1 digit2|
	(busdatos flags) clc .
	(busdatos flags) cls .
	(busdatos flags) clz .
	number1 := b1 complete .
	number2 := b2 complete .
	[(number1 > 0) and: (number2 > 0)] whileTrue: [
    digit1 := number1 \\ 10.
    digit2 := number2 \\ 10.
    ((digit1 + digit2) > 9) ifTrue: [
        (busdatos flags) stc .
			number1 := 0.
        number2 := 0.
    ] ifFalse: [
        number1 := number1 // 10.
        number2 := number2 // 10.
    ].
	].

	value := ((b1 complete) + (b2 complete)) .
	(value < 0) ifTrue: [ (busdatos flags) sts ] .
	(value = 0) ifTrue: [ (busdatos flags) stz ] .
	b3 complete: value .
]

{ #category : #operating }
ALUnit >> and [
	b3 complete: ((b1 complete) bitAnd: (b2 complete))
]

{ #category : #accessing }
ALUnit >> b1 [ 
^b1 
]

{ #category : #accessing }
ALUnit >> b2 [ 
^b2
]

{ #category : #accessing }
ALUnit >> b3 [
^b3
]

{ #category : #accessing }
ALUnit >> b4 [
^b4 
]

{ #category : #operating }
ALUnit >> div [
	| value |
	value := ((b1 complete) // (b2 complete)) .
	(value < 0) ifTrue: [ (busdatos flags) sts ] .
	(value = 0) ifTrue: [ (busdatos flags) stz ] .
	b3 complete: value .
	b4 complete: ((b1 complete) \\ (b2 complete)) .
]

{ #category : #initialization }
ALUnit >> initialize [ 
	b1 := Register new initialize: 'b1'.
	b2 := Register new initialize: 'b2'.
	b3 := Register new initialize: 'b3'.
	b4 := Register new initialize: 'b4'.
	
]

{ #category : #initialization }
ALUnit >> initialize: busdedatos [
	b1 := Register new.
	b2 := Register new.
	b3 := Register new.
	b4 := Register new.
	busdatos := busdedatos .
	
]

{ #category : #operating }
ALUnit >> mul [
	| value |
	value := ((b1 complete) * (b2 complete)) .
	(value < 0) ifTrue: [ (busdatos flags) sts ] .
	(value = 0) ifTrue: [ (busdatos flags) stz ] .
	b3 complete: value
]

{ #category : #operating }
ALUnit >> not [
	b3 complete: ((b1 complete) bitInvert)
]

{ #category : #operating }
ALUnit >> or [
	b3 complete: ((b1 complete) bitOr: (b2 complete))
]

{ #category : #operating }
ALUnit >> shl [
	|value|
	(busdatos flags) clc .
	(busdatos flags) clz .
	value := 	((b1 complete) bitShift: (-1 * (b2 complete))).
	(value > 65535) ifTrue: [ (busdatos flags) stc .] .
	(value = 0) ifTrue: [ (busdatos flags) stz . ] .
	b3 complete: value
]

{ #category : #operating }
ALUnit >> shr [
	|value digit|
	(busdatos flags) clc .
	(busdatos flags) clz .
	value := 	((b1 complete) bitShift: ((b2 complete) - 1)).
	digit := value \\ 2 . 
	(digit = 1) ifTrue: [ (busdatos flags) stc .] .
	value := value bitShift: 1 .
	(value = 0) ifTrue: [ (busdatos flags) stz . ] .
	b3 complete: value
]

{ #category : #operating }
ALUnit >> sub [
	|value number1 number2 digit1 digit2|
	(busdatos flags) clc .
	(busdatos flags) cls .
	(busdatos flags) clz .
	number1 := b1 complete .
	number2 := b2 complete .
	[(number1 > 0) and: (number2 > 0)] whileTrue: [
    digit1 := number1 \\ 10.
    digit2 := number2 \\ 10.
    (digit1 < digit2) ifTrue: [
        (busdatos flags) stc .
			number1 := 0.
        number2 := 0.
    ] ifFalse: [
        number1 := number1 // 10.
        number2 := number2 // 10.
    ].
	].

	value := ((b1 complete) - (b2 complete)) .
	(value < 0) ifTrue: [ (busdatos flags) sts ] .
	(value = 0) ifTrue: [ (busdatos flags) stz ] .
	b3 complete: value
]

{ #category : #operating }
ALUnit >> xor [
	b3 complete: ((b1 complete) bitXor: (b2 complete))
]
