"
Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	carry:		<Object>
	interrupt:		<Object>
	sign:		<Object>
	zero:		<Object>


    Implementation Points
"
Class {
	#name : #Flags,
	#superclass : #Object,
	#instVars : [
		'carry',
		'sign',
		'zero',
		'interrupt'
	],
	#category : #AFCA
}

{ #category : #accessing }
Flags >> carry [
	^carry
]

{ #category : #accessing }
Flags >> carry: value [
	carry := value.

]

{ #category : #flags }
Flags >> clc [
	carry := 0 .
]

{ #category : #flags }
Flags >> cli [
	interrupt := 0 .
]

{ #category : #flags }
Flags >> cls [
	sign := 0 .
]

{ #category : #flags }
Flags >> clz [
	zero := 0 .
]

{ #category : #initialization }
Flags >> initialize [ 
	super initialize .
	carry := 0 .
	sign := 0 .
	zero := 0 .
	interrupt := 0.
]

{ #category : #accessing }
Flags >> interrupt [
	^interrupt
]

{ #category : #accessing }
Flags >> interrupt: value [
	interrupt := value.

]

{ #category : #accessing }
Flags >> sign [
	^sign
]

{ #category : #accessing }
Flags >> sign: value [
	sign := value.

]

{ #category : #flags }
Flags >> stc [
	carry := 1 .
]

{ #category : #flags }
Flags >> sti [
	interrupt := 1 .
]

{ #category : #flags }
Flags >> sts [
	sign := 1 .
]

{ #category : #flags }
Flags >> stz [
	zero := 1 .
]

{ #category : #accessing }
Flags >> zero [
	^zero
]

{ #category : #accessing }
Flags >> zero: value [
	zero := value.

]
