"
Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	alu:		<Object>
	controlU:		<Object>
	flags:		<Object>
	mar:		<Object>
	mbr:		<Object>
	memory:		<Object>
	temporary:		<Object>


    Implementation Points
"
Class {
	#name : #DataBus,
	#superclass : #Object,
	#instVars : [
		'controlU',
		'mar',
		'mbr',
		'alu',
		'flags',
		'temporary',
		'memory'
	],
	#category : #AFCA
}

{ #category : #accessing }
DataBus >> alu [
	^alu
]

{ #category : #accessing }
DataBus >> flags [
	^flags
]

{ #category : #initialization }
DataBus >> initialize: cu [
	controlU := cu .
	mar := Register new.
	mbr := Register new.
	alu := ALUnit new initialize: self.
	flags := Flags new.
	temporary := Register new.
	memory := Memory new.
	
]

{ #category : #accessing }
DataBus >> temporary [
	^temporary .
]

{ #category : #accessing }
DataBus >> temporary: value [
	temporary complete: value . 
]
