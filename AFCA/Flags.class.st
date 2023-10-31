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

{ #category : #flags }
Flags >> clc [
	carry := false .
]

{ #category : #flags }
Flags >> cli [
	interrupt := false .
]

{ #category : #flags }
Flags >> cls [
	sign := false .
]

{ #category : #flags }
Flags >> clz [
	zero := false .
]

{ #category : #initialization }
Flags >> initialize [ 
	super initialize .
	carry := false .
	sign := false .
	zero := false .
	interrupt := false.
]

{ #category : #accessing }
Flags >> interrupt [
	^interrupt
]

{ #category : #accessing }
Flags >> sign [
	^sign
]

{ #category : #flags }
Flags >> stc [
	carry := true .
]

{ #category : #flags }
Flags >> sti [
	interrupt := true .
]

{ #category : #flags }
Flags >> sts [
	sign := true .
]

{ #category : #flags }
Flags >> stz [
	zero := true .
]

{ #category : #accessing }
Flags >> zero [
	^zero
]
