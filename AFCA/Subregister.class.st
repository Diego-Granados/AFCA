Class {
	#name : #Subregister,
	#superclass : #Register,
	#instVars : [
		'instruction'
	],
	#category : #AFCA
}

{ #category : #accessing }
Subregister >> complete [
	^ complete

]

{ #category : #accessing }
Subregister >> complete: value [
	complete := value

]

{ #category : #initialization }
Subregister >> initialize: pName [
	complete := 0.
	bit16 := false.
	name := pName .

]

{ #category : #accessing }
Subregister >> instruction [
	^ instruction

]

{ #category : #accessing }
Subregister >> instruction: pInstruction [
	instruction := pInstruction

]
