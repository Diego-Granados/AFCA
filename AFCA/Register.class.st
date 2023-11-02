"
Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	complete:		<Object>
	high:		<Object>
	low:		<Object>


    Implementation Points
"
Class {
	#name : #Register,
	#superclass : #Object,
	#instVars : [
		'high',
		'low',
		'complete',
		'name',
		'bit16'
	],
	#category : #AFCA
}

{ #category : #accessing }
Register >> bit16 [
	^ bit16 .

]

{ #category : #accessing }
Register >> bit16: value [
	bit16 := value

]

{ #category : #accessing }
Register >> complete [
	complete := (low complete)+ ((high complete) * 256) .
	^ complete .

]

{ #category : #accessing }
Register >> complete: value [
	(value < 65535) ifTrue: [ complete := value ] .
	low complete: (value bitAnd: 255) .
	high complete: (value bitShift: -8) .

]

{ #category : #accessing }
Register >> high [
^high
]

{ #category : #accessing }
Register >> high: value [
	high := value.

]

{ #category : #initialization }
Register >> initialize [ 
	super initialize .
	high := 0.
	low := 0.
	complete := 0.
	
]

{ #category : #initialization }
Register >> initialize: pName [
	high := 0.
	low := 0.
	complete := 0.
	bit16 := true.
	name := pName .

]

{ #category : #initialization }
Register >> initialize: pName high: highReg low: lowReg [
	high := highReg.
	low := lowReg.
	complete := 0.
	bit16 := true.
	name := pName .

]

{ #category : #accessing }
Register >> low [
^low
]

{ #category : #accessing }
Register >> low: value [
	(value < 256) ifTrue: [ low := value ] .

]

{ #category : #accessing }
Register >> name [
 ^name
]
