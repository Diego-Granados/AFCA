"
Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	cells:		<Object>
	mar:		<Object>
	mbr:		<Object>


    Implementation Points
"
Class {
	#name : #Memory,
	#superclass : #Object,
	#instVars : [
		'cells',
		'mar',
		'mbr',
		'code'
	],
	#category : #AFCA
}

{ #category : #accessing }
Memory >> code [
^code
]

{ #category : #accessing }
Memory >> data [
^cells.
]

{ #category : #initialization }
Memory >> initialize [  
	cells := Array new:128.
	cells withIndexDo: [:each :index |
    cells at: index put: 0.
	].

	code := Array new: 128.
	mar := Subregister new.
	mbr := Subregister new.

]

{ #category : #accessing }
Memory >> mar [
^mar
]

{ #category : #accessing }
Memory >> mbr [
^mbr
]

{ #category : #writing }
Memory >> overwrite [
	| index value |
	value := mbr complete.
	index := mar complete .
	cells at: index put: value .
]

{ #category : #reading }
Memory >> read [
	|index|
	index := mar complete .
	mbr complete: (cells at: index) .
]

{ #category : #reading }
Memory >> readCode [
	|index|
	index := mar complete .
	mbr instruction: (code at: index) 

]

{ #category : #writing }
Memory >> writeCode [
	| index value |
	value := mbr instruction.
	index := mar complete .
	code at: index put: value .

]

{ #category : #writing }
Memory >> writeNew [
	| i value |
	value := mbr complete.
	i := 1.
	i <= cells size whileTrue: [
		(cells at: i) ifNil: 
		[ 	cells at: i put: value . 
			mar complete: i .
			^i .
		].
		i := i + 1.
	].
]
