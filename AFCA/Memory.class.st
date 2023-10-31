Class {
	#name : #Memory,
	#superclass : #Object,
	#instVars : [
		'cells',
		'mar',
		'mbr'
	],
	#category : #AFCA
}

{ #category : #initialization }
Memory >> initialize [  
	cells := Array new:256 .
	mar := Register new.
	mbr := Register new.
	 
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
