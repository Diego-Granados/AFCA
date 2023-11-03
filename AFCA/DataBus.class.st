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
DataBus >> cu [
	^controlU.
]

{ #category : #accessing }
DataBus >> flags [
	^flags
]

{ #category : #initialization }
DataBus >> initialize: cu [
	controlU := cu .
	alu := ALUnit new initialize: self.
	flags := Flags new.
	temporary := Subregister new initialize: 'bus'.
	memory := Memory new.

	
]

{ #category : #accessing }
DataBus >> memory [
	^ memory

]

{ #category : #accessing }
DataBus >> temporary [
	^temporary .
]

{ #category : #accessing }
DataBus >> temporary: value [
	temporary complete: value . 
]

{ #category : #accessing }
DataBus >> temporaryInstruction: value [
	temporary instruction: value . 

]
