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
