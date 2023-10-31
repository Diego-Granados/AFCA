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
		'complete'
	],
	#category : #AFCA
}

{ #category : #accessing }
Register >> complete [
^ (low + (high * 256))
]

{ #category : #accessing }
Register >> complete: value [
	(value < 65356) ifTrue: [ complete := value ] .
	low := (value \\ 65356) .
	high := (value // 65356) .
]

{ #category : #accessing }
Register >> high [
^high
]

{ #category : #accessing }
Register >> high: value [
	(value < 256) ifTrue: [ high := value ] .
]

{ #category : #initialization }
Register >> initialize [ 
	super initialize .
	high := 0.
	low := 0.
	complete := 0.
	
]

{ #category : #accessing }
Register >> low [
^low
]

{ #category : #accessing }
Register >> low: value [
	(value < 256) ifTrue: [ low := value ] .
]
