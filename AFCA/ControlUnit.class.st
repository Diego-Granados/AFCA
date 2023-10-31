Class {
	#name : #ControlUnit,
	#superclass : #Object,
	#instVars : [
		'instructionRegister',
		'busDatos',
		'programCounter',
		'ax',
		'bx',
		'cx',
		'dx',
		'cugui',
		'irgui',
		'pcgui',
		'busgui',
		'registrosgui',
		'flagsgui',
		'alugui',
		'b1gui',
		'b2gui',
		'b3gui',
		'b4gui',
		'mbrgui',
		'margui',
		'memorygui',
		'cutext',
		'irtext',
		'pctext',
		'bustext',
		'registrostext',
		'flagstext',
		'alutext',
		'b1text',
		'b2text',
		'b3text',
		'b4text',
		'mbrtext',
		'martext',
		'memorytext',
		'cuvalue',
		'irvalue',
		'pcvalue',
		'busvalue',
		'registrosvalue',
		'flagsvalue',
		'aluvalue',
		'b1value',
		'b2value',
		'b3value',
		'b4value',
		'mbrvalue',
		'marvalue',
		'memoryvalue'
	],
	#category : #AFCA
}

{ #category : #operating }
ControlUnit >> addmemtoreg: direccion secondParameter: operando1 [
	self movmemtoreg: ((busDatos alu) b1) secondParameter: direccion .
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) add .
	self movregtomem: ((busDatos alu) b3) secondParameter: direccion .
]

{ #category : #operating }
ControlUnit >> addregtomem: operando1 secondParameter: direccion [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self movmemtoreg: ((busDatos alu) b2) secondParameter: direccion .
	(busDatos alu) add .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> addregtoreg: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) add .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> and: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) and .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]

{ #category : #microinstructions }
ControlUnit >> arrow: destino secondParameter: fuente [
	destino complete: (fuente complete) . 
 
	
]

{ #category : #accessing }
ControlUnit >> ax [
^ax
]

{ #category : #accessing }
ControlUnit >> bx [
^bx
]

{ #category : #comparing }
ControlUnit >> cmpregtoreg: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) sub .
]

{ #category : #gui }
ControlUnit >> creategui [
	|lightblue|
	lightblue := Color r: 0 g: 0.5 b: 0.9.
	cugui := Morph new color: lightblue.
	irgui := Morph new color: lightblue.
	pcgui := Morph new color: lightblue.
	busgui := Morph new color: lightblue.
	registrosgui := Morph new color: lightblue.
	flagsgui := Morph new color: lightblue.
	alugui := Morph new color: lightblue.
	b1gui := Morph new color: lightblue.
	b2gui := Morph new color: lightblue.
	b3gui := Morph new color: lightblue.
	b4gui := Morph new color: lightblue.
	mbrgui := Morph new color: lightblue.
	margui := Morph new color: lightblue.
	memorygui:= Morph new color: lightblue.
	cutext := TextMorph new contents: 'Control Unit' .
	irtext := TextMorph new contents: 'Instruction Register' .
	pctext := TextMorph new contents: 'Program Counter' .
	bustext := TextMorph new contents: 'Data Bus' .
	registrostext := TextMorph new contents: 'Registers'.
	flagstext := TextMorph new contents: 'Flags'.
	alutext := TextMorph new contents: 'ALU'.
	b1text := TextMorph new contents: 'B1'.
	b2text := TextMorph new contents: 'B2'.
	b3text := TextMorph new contents: 'B3'.
	b4text := TextMorph new contents: 'B4'.
	mbrtext := TextMorph new contents: 'MBR'.
	martext := TextMorph new contents: 'MAR'.
	memorytext := TextMorph new contents: 'Memory'.
	cuvalue := TextMorph new contents: ''.
	irvalue := TextMorph new contents: '' .
	pcvalue := TextMorph new contents: '' .
	busvalue := TextMorph new contents: ''.
	registrosvalue := TextMorph new contents: ''.
	flagsvalue := TextMorph new contents: ''.
	aluvalue := TextMorph new contents: ''.
	b1value := TextMorph new contents: ''.
	b2value := TextMorph new contents: ''.
	b3value := TextMorph new contents: ''.
	b4value := TextMorph new contents: ''.
	mbrvalue := TextMorph new contents: ''.
	marvalue := TextMorph new contents: ''.
	memoryvalue:= TextMorph new contents: ''.
	
	cugui addMorph: cutext .
	irgui addMorph: irtext .
	pcgui addMorph: pctext .
	busgui addMorph: bustext .
	registrosgui addMorph: registrostext .
	flagsgui addMorph: flagstext .
	alugui addMorph: alutext .
	b1gui addMorph: b1text .
	b2gui addMorph: b2text .
	b3gui addMorph: b3text .
	b4gui addMorph: b4text .
	mbrgui addMorph: mbrtext .
	margui addMorph: martext .
	memorygui addMorph: memorytext .
	
	cugui addMorph: cuvalue .
	irgui addMorph: irvalue .
	pcgui addMorph: pcvalue .
	busgui addMorph: busvalue .
	registrosgui addMorph: registrosvalue .
	flagsgui addMorph: flagsvalue .
	alugui addMorph: aluvalue .
	b1gui addMorph: b1value .
	b2gui addMorph: b2value .
	b3gui addMorph: b3value .
	b4gui addMorph: b4value .
	mbrgui addMorph: mbrvalue .
	margui addMorph: marvalue .
	memorygui addMorph: memoryvalue .
	
	cugui openInWorld .
	irgui openInWorld .
	pcgui openInWorld .
	busgui openInWorld .
	registrosgui openInWorld .
	flagsgui openInWorld .
	alugui openInWorld .
	b1gui openInWorld .
	b2gui openInWorld .
	b3gui openInWorld .
	b4gui openInWorld .
	mbrgui openInWorld .
	margui openInWorld .
	memorygui openInWorld .
	cugui position: (cugui position + (40@40)).
	irgui position: (irgui position + (40@180)).
	pcgui position: (pcgui position + (40@260)).
	busgui position: (busgui position + (200@40)).
	registrosgui position: (registrosgui position + (400@40)).
	flagsgui position: (flagsgui position + (400@130)).
	alugui position: (alugui position + (400@230)).
	b1gui position: (b1gui position + (360@230)).
	b2gui position: (b2gui position + (360@270)).
	b3gui position: (b3gui position + (510@230)).
	b4gui position: (b4gui position + (510@270)).
	mbrgui position: (mbrgui position + (400@360)).
	margui position: (margui position + (460@360)).
	memorygui position: (memorygui position + (550@360)).
	
	cugui extent: 100@100.
	irgui extent:110@50.
	pcgui extent: 110@50.
	busgui extent: 70@300.
	registrosgui extent: 80@80. 
	flagsgui extent: 80@80.
	alugui extent: 100@100.
	b1gui extent: 30@30.
	b2gui extent: 30@30.
	b3gui extent: 30@30.
	b4gui extent: 30@30.
	mbrgui extent: 50@50.
	margui extent: 50@50.	
	memorygui extent: 200@200.
	
	
	
]

{ #category : #accessing }
ControlUnit >> cx [
^cx
]

{ #category : #operating }
ControlUnit >> div: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) div .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b4) . 
	self arrow: operando2 secondParameter: (busDatos temporary) . 
]

{ #category : #accessing }
ControlUnit >> dx [
^dx
]

{ #category : #initialization }
ControlUnit >> initialize [ 
	super initialize .
	instructionRegister := Register new.
	busDatos := DataBus new initialize: self.
	programCounter := Register new.
	ax := Register new.
	bx := Register new.
	cx := Register new.
	dx := Register new.
	self creategui .
	
]

{ #category : #accessing }
ControlUnit >> instructionRegister [ 
^instructionRegister
]

{ #category : #accessing }
ControlUnit >> instructionRegister: register [
instructionRegister := register
]

{ #category : #jumping }
ControlUnit >> jmpreg: register [
	self movregtoreg: register secondParameter: ((busDatos memory) mar) .
	
]

{ #category : #moving }
ControlUnit >> movimtomem: immediate secondParameter: direccion [
	self movimtoreg: ((busDatos memory) mbr) secondParameter: direccion . 
	self movimtoreg: ((busDatos memory) mar) secondParameter: direccion . 
	(busDatos memory) overwrite .
]

{ #category : #moving }
ControlUnit >> movimtoreg: immediate secondParameter: register [
	register complete: immediate .
]

{ #category : #operating }
ControlUnit >> movmemtoreg: direccion secondParameter: registro [
	self movimtoreg: ((busDatos memory) mar) secondParameter: direccion . 
	(busDatos memory) read .
	self arrow: (busDatos temporary) secondParameter: ((busDatos memory) mbr) . 
	self arrow: registro secondParameter: (busDatos temporary) . 
]

{ #category : #moving }
ControlUnit >> movregtomem: register1 secondParameter: direccion [
	self arrow: (busDatos temporary) secondParameter: register1 . 
	self arrow: ((busDatos memory) mbr) secondParameter: (busDatos temporary) . 
	self movimtoreg: ((busDatos memory) mar) secondParameter: direccion . 
	(busDatos memory) overwrite .
]

{ #category : #moving }
ControlUnit >> movregtoreg: register1 secondParameter: register2 [
	self arrow: (busDatos temporary) secondParameter: register1 . 
	self arrow: register2 secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> mulregtoreg: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) mul .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: ax secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> not: operando1 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	(busDatos alu) not .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> or: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) or .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> shl: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) shl .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> shr: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) shr .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> sub: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) sub .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: ax secondParameter: (busDatos temporary) . 
]

{ #category : #microinstructions }
ControlUnit >> test: flag secondParameter: n [
	(flag = 'carry') ifTrue:[
			((busDatos flags) carry) ifTrue: [ 
					^true
				 ]
	]. 
	(flag = 'sign') ifTrue:[
			((busDatos flags) sign) ifTrue: [ 
					^true
				 ]
	]. 
	(flag = 'zero') ifTrue:[
			((busDatos flags) zero) ifTrue: [ 
					^true
				 ]
	]. 
	(flag = 'interrupt') ifTrue:[
			((busDatos flags) interrupt) ifTrue: [ 
					^true
				 ]
	]. 
	^false
	
]

{ #category : #operating }
ControlUnit >> writeNew: registroDir secondParameter: registroSource [
	self arrow: (busDatos temporary) secondParameter: registroSource . 
	self arrow: ((busDatos memory) mbr) secondParameter: (busDatos temporary) . 
	(busDatos memory) writeNew .
	self arrow: (busDatos temporary) secondParameter: ((busDatos memory) mar) . 
	self arrow: registroDir secondParameter: (busDatos temporary) . 
]

{ #category : #operating }
ControlUnit >> xor: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	(busDatos alu) xor .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self arrow: operando1 secondParameter: (busDatos temporary) . 
]
