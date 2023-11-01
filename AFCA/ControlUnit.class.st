"
Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	alugui:		<Object>
	alutext:		<Object>
	aluvalue:		<Object>
	ax:		<Object>
	b1gui:		<Object>
	b1text:		<Object>
	b1value:		<Object>
	b2gui:		<Object>
	b2text:		<Object>
	b2value:		<Object>
	b3gui:		<Object>
	b3text:		<Object>
	b3value:		<Object>
	b4gui:		<Object>
	b4text:		<Object>
	b4value:		<Object>
	busDatos:		<Object>
	busgui:		<Object>
	bustext:		<Object>
	busvalue:		<Object>
	bx:		<Object>
	cugui:		<Object>
	cutext:		<Object>
	cuvalue:		<Object>
	cx:		<Object>
	dx:		<Object>
	flagsgui:		<Object>
	flagstext:		<Object>
	flagsvalue:		<Object>
	instructionRegister:		<Object>
	irgui:		<Object>
	irtext:		<Object>
	irvalue:		<Object>
	margui:		<Object>
	martext:		<Object>
	marvalue:		<Object>
	mbrgui:		<Object>
	mbrtext:		<Object>
	mbrvalue:		<Object>
	memorygui:		<Object>
	memorytext:		<Object>
	memoryvalue:		<Object>
	pcgui:		<Object>
	pctext:		<Object>
	pcvalue:		<Object>
	programCounter:		<Object>
	registrosgui:		<Object>
	registrostext:		<Object>
	registrosvalue:		<Object>


    Implementation Points
"
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
		'memoryvalue',
		'axgui',
		'bxgui',
		'cxgui',
		'dxgui',
		'axtext',
		'bxtext',
		'cxtext',
		'dxtext',
		'axvalue',
		'bxvalue',
		'cxvalue',
		'dxvalue',
		'carrygui',
		'signgui',
		'zerogui',
		'interruptgui',
		'carrytext',
		'signtext',
		'zerotext',
		'interrupttext',
		'carryvalue',
		'signvalue',
		'zerovalue',
		'interruptvalue'
	],
	#category : #AFCA
}

{ #category : #operating }
ControlUnit >> addmemtoreg: direccion secondParameter: operando1 [
	self movmemtoreg: direccion secondParameter: ((busDatos alu) b1) .
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: (operando1 complete) .
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b2' secondParameter: (((busDatos alu) b2) complete) .
	(busDatos alu) add .
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self movregtomem: ((busDatos alu) b3) secondParameter: direccion .
]

{ #category : #operating }
ControlUnit >> addregtomem: operando1 secondParameter: direccion [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b1' secondParameter: (((busDatos alu) b1) complete) .
	self movmemtoreg: direccion secondParameter: ((busDatos alu) b2) .
	(busDatos alu) add .
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) .
	self updateRegister: (operando1 name) secondParameter: (operando1 complete) . 
]

{ #category : #operating }
ControlUnit >> addregtoreg: operando1 secondParameter: operando2 [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: (operando1 complete) .
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b1' secondParameter: (((busDatos alu) b1) complete) .
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self updateRegister: 'bus' secondParameter: (operando2 complete) .
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b2' secondParameter: (((busDatos alu) b2) complete) .
	(busDatos alu) add .
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self updateRegister: (operando1 name) secondParameter: (operando1 complete) .
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
	axgui := Morph new color: lightblue.
	bxgui := Morph new color: lightblue.
	cxgui := Morph new color: lightblue.
	dxgui := Morph new color: lightblue.
	carrygui := Morph new color: lightblue.
	signgui := Morph new color: lightblue.
	zerogui := Morph new color: lightblue.
	interruptgui := Morph new color: lightblue.
	carrytext := TextMorph new contents: 'Carry' .
	signtext := TextMorph new contents: 'Sign' .
	zerotext := TextMorph new contents: 'Zero' .
	interrupttext := TextMorph new contents: 'Interrupt' .
	carryvalue := TextMorph new contents: ''.
	signvalue := TextMorph new contents: ''.
	zerovalue := TextMorph new contents: ''.
	interruptvalue := TextMorph new contents: ''.
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
	axtext := TextMorph new contents: 'Ax'.
	bxtext := TextMorph new contents: 'Bx'.
	cxtext := TextMorph new contents: 'Cx'.
	dxtext := TextMorph new contents: 'Dx'.
	
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
	
	axvalue := TextMorph new contents: ''.
	bxvalue := TextMorph new contents: ''.
	cxvalue := TextMorph new contents: ''.
	dxvalue := TextMorph new contents: ''.
	
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
	axgui addMorph: axtext .	
	bxgui addMorph: bxtext .
	cxgui addMorph: cxtext .	
	dxgui addMorph: dxtext .	
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
	axgui addMorph: axvalue .	
	bxgui addMorph: bxvalue .
	cxgui addMorph: cxvalue .	
	dxgui addMorph: dxvalue .	
	carrygui addMorph: carrytext.
	carrygui addMorph: carryvalue.
	signgui addMorph: signtext.
	signgui addMorph: signvalue.
	zerogui addMorph: zerotext.
	zerogui addMorph: zerovalue.
	interruptgui addMorph: interrupttext.
	interruptgui addMorph: interruptvalue.

	cugui openInWorld .
	irgui openInWorld .
	pcgui openInWorld .
	busgui openInWorld .
	registrosgui openInWorld .
	axgui openInWorld .
	bxgui openInWorld .
	cxgui openInWorld .
	dxgui openInWorld .
	flagsgui openInWorld .
	carrygui openInWorld .
	signgui openInWorld .
	zerogui openInWorld .
	interruptgui openInWorld .
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
	axgui position: (axgui position + (400@60)).
	bxgui position: (bxgui position + (450@60)).
	cxgui position: (cxgui position + (400@110)).
	dxgui position: (dxgui position + (450@110)).
	flagsgui position: (flagsgui position + (400@180)).
	carrygui position: (carrygui position + (400@200)).
	signgui position: (signgui position + (450@200)).
	zerogui position: (zerogui position + (400@240)).
	interruptgui position: (interruptgui position + (450@240)).
	alugui position: (alugui position + (400@300)).
	b1gui position: (b1gui position + (340@300)).
	b2gui position: (b2gui position + (340@360)).
	b3gui position: (b3gui position + (510@300)).
	b4gui position: (b4gui position + (510@360)).
	mbrgui position: (mbrgui position + (400@430)).
	margui position: (margui position + (460@430)).
	memorygui position: (memorygui position + (550@430)).
	cuvalue position: (cutext position + (0@12)).
	irvalue position: (irtext position + (0@12)).
	pcvalue position: (pctext position + (0@12)).
	busvalue position: (bustext position + (0@12)).
	registrosvalue position: (registrostext position + (0@12)).
	axvalue position: (axtext position + (0@12)).
	bxvalue position: (bxtext position + (0@12)).
	cxvalue position: (cxtext position + (0@12)).
	dxvalue position: (dxtext position + (0@12)).
	flagsvalue position: (flagstext position + (0@12)).
	carryvalue position: (carrytext position + (0@12)).
	signvalue position: (signtext position + (0@12)).
	zerovalue position: (zerotext position + (0@12)).
	interruptvalue position: (interrupttext position + (0@12)).
	aluvalue position: (alutext position + (0@12)).
	b1value position: (b1text position + (0@12)).
	b2value position: (b2text position + (0@12)).
	b3value position: (b3text position + (0@12)).
	b4value position: (b4text position + (0@12)).
	mbrvalue position: (mbrtext position + (0@12)).
	marvalue position: (martext position + (0@12)).
	memoryvalue position: (memorytext position + (0@12)).
	
	cugui extent: 100@100.
	irgui extent:110@50.
	pcgui extent: 110@50.
	busgui extent: 70@300.
	registrosgui extent:100@20.
	axgui extent: 50@50.
	bxgui extent: 50@50.
	cxgui extent: 50@50.
	dxgui extent: 50@50.
	flagsgui extent: 100@20.
	carrygui extent: 50@40.
	signgui extent: 50@40.
	zerogui extent: 50@40.
	interruptgui extent: 50@40.
	alugui extent: 100@100.
	b1gui extent: 50@50.
	b2gui extent: 50@50.
	b3gui extent: 50@50.
	b4gui extent: 50@50.
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
	instructionRegister := Register new initialize: 'ir'.
	busDatos := DataBus new initialize: self.
	programCounter := Register new initialize: 'pc'.
	ax := Register new initialize: 'ax'.
	bx := Register new initialize: 'bx'.
	cx := Register new initialize: 'cx'.
	dx := Register new initialize: 'dx'.
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
	self movimtoreg: direccion secondParameter:((busDatos memory) mbr)  . 
	self movimtoreg: direccion secondParameter: ((busDatos memory) mar) . 
	(busDatos memory) overwrite .
]

{ #category : #moving }
ControlUnit >> movimtoreg: immediate secondParameter: register [
	register complete: immediate .
	self updateRegister: (register name) secondParameter: immediate .
]

{ #category : #operating }
ControlUnit >> movmemtoreg: direccion secondParameter: registro [
	self movimtoreg: direccion secondParameter: ((busDatos memory) mar) . 
	(busDatos memory) read .
	self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete) .
	self arrow: (busDatos temporary) secondParameter: ((busDatos memory) mbr) . 
	self updateRegister: 'bus' secondParameter: (((busDatos memory) mbr) complete).
	self arrow: registro secondParameter: (busDatos temporary) . 
	self updateRegister: (registro name) secondParameter: (registro complete) .
]

{ #category : #moving }
ControlUnit >> movregtomem: register1 secondParameter: direccion [
	self arrow: (busDatos temporary) secondParameter: register1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos memory) mbr) secondParameter: (busDatos temporary) . 
	self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete) .
	self movimtoreg: direccion secondParameter: ((busDatos memory) mar) . 
	(busDatos memory) overwrite .
]

{ #category : #moving }
ControlUnit >> movregtoreg: register1 secondParameter: register2 [
	self arrow: (busDatos temporary) secondParameter: register1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: register2 secondParameter: (busDatos temporary) . 
	self updateRegister: (register2 name) secondParameter: (register2 complete) .
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
ControlUnit >> opmemtoreg: direccion secondParameter: operando1 operation: op [
	self movmemtoreg: direccion secondParameter: ((busDatos alu) b1) .
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: (operando1 complete) .
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b2' secondParameter: (((busDatos alu) b2) complete) .
	(op = 'add') ifTrue: [ 
	(busDatos alu) add . ].
	((op = 'sub') or: (op = 'cmp')) ifTrue: [ 
	(busDatos alu) sub . ].
	(op = 'mul') ifTrue: [ 
	(busDatos alu) mul . ].
	(op = 'div') ifTrue: [ 
	(busDatos alu) div . 
	self updateRegister: 'b4' secondParameter: (((busDatos alu) b4) complete) .
	].
	(op = 'and') ifTrue: [ 
	(busDatos alu) and . ].
	(op = 'or') ifTrue: [ 
	(busDatos alu) or . ].
	(op = 'xor') ifTrue: [ 
	(busDatos alu) xor . ].
	(op = 'shl') ifTrue: [ 
	(busDatos alu) shl . ].
	(op = 'shr') ifTrue: [ 
	(busDatos alu) shl . ].
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self updateRegister: 'carry' secondParameter: ((busDatos flags) carry) .
	self updateRegister: 'sign' secondParameter: ((busDatos flags) sign) .
	self updateRegister: 'zero' secondParameter: ((busDatos flags) zero) .
	(op = 'cmp') ifFalse: [ 
	self movregtomem: ((busDatos alu) b3) secondParameter: direccion . ].
]

{ #category : #operating }
ControlUnit >> opregtomem: operando1 secondParameter: direccion operation: op [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b1' secondParameter: (((busDatos alu) b1) complete) .
	self movmemtoreg: direccion secondParameter: ((busDatos alu) b2) .
	(op = 'add') ifTrue: [ 
	(busDatos alu) add . ].
	((op = 'sub') or: (op = 'cmp')) ifTrue: [ 
	(busDatos alu) sub . ].
	(op = 'mul') ifTrue: [ 
	(busDatos alu) mul . ].
	(op = 'div') ifTrue: [ 
	(busDatos alu) div . 
	self updateRegister: 'b4' secondParameter: (((busDatos alu) b4) complete) .
	].
	(op = 'and') ifTrue: [ 
	(busDatos alu) and . ].
	(op = 'or') ifTrue: [ 
	(busDatos alu) or . ].
	(op = 'xor') ifTrue: [ 
	(busDatos alu) xor . ].
	(op = 'shl') ifTrue: [ 
	(busDatos alu) shl . ].
	(op = 'shr') ifTrue: [ 
	(busDatos alu) shl . ].
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self updateRegister: 'carry' secondParameter: ((busDatos flags) carry) .
	self updateRegister: 'sign' secondParameter: ((busDatos flags) sign) .
	self updateRegister: 'zero' secondParameter: ((busDatos flags) zero) .
	(op = 'cmp') ifFalse: [
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) .
	self updateRegister: (operando1 name) secondParameter: (operando1 complete) . ].
]

{ #category : #operating }
ControlUnit >> opregtoreg: operando1 secondParameter: operando2 operation: op [
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: (operando1 complete) .
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b1' secondParameter: (((busDatos alu) b1) complete) .
	self arrow: (busDatos temporary) secondParameter: operando2 . 
	self updateRegister: 'bus' secondParameter: (operando2 complete) .
	self arrow: ((busDatos alu) b2) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b2' secondParameter: (((busDatos alu) b2) complete) .
	(op = 'add') ifTrue: [ 
	(busDatos alu) add . ].
	((op = 'sub') or: (op = 'cmp')) ifTrue: [ 
	(busDatos alu) sub . ].
	(op = 'mul') ifTrue: [ 
	(busDatos alu) mul . ].
	(op = 'div') ifTrue: [ 
	(busDatos alu) div . 
	self updateRegister: 'b4' secondParameter: (((busDatos alu) b4) complete) .
	].
	(op = 'and') ifTrue: [ 
	(busDatos alu) and . ].
	(op = 'or') ifTrue: [ 
	(busDatos alu) or . ].
	(op = 'xor') ifTrue: [ 
	(busDatos alu) xor . ].
	(op = 'shl') ifTrue: [ 
	(busDatos alu) shl . ].
	(op = 'shr') ifTrue: [ 
	(busDatos alu) shl . ].
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self updateRegister: 'carry' secondParameter: ((busDatos flags) carry) .
	self updateRegister: 'sign' secondParameter: ((busDatos flags) sign) .
	self updateRegister: 'zero' secondParameter: ((busDatos flags) zero) .
	(op = 'cmp') ifFalse: [
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self updateRegister: (operando1 name) secondParameter: (operando1 complete) . ].
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

{ #category : #gui }
ControlUnit >> updateRegister: register secondParameter: value [

	register = 'ax' ifTrue: [
		axvalue contents: value asString.
		^ value ].
	register = 'bx' ifTrue: [
		bxvalue contents: value asString.
		^ value ].
	register = 'cx' ifTrue: [
		cxvalue contents: value asString.
		^ value ].
	register = 'dx' ifTrue: [
		dxvalue contents: value asString.
		^ value ].
	register = 'b1' ifTrue: [
		b1value contents: value asString.
		^ value ].
	register = 'b2' ifTrue: [
		b2value contents: value asString.
		^ value ].
	register = 'b3' ifTrue: [
		b3value contents: value asString.
		^ value ].
	register = 'b4' ifTrue: [
		b4value contents: value asString.
		^ value ].
	register = 'ir' ifTrue: [
		irvalue contents: value asString.
		^ value ].
	register = 'pc' ifTrue: [
		pcvalue contents: value asString.
		^ value ].
	register = 'mar' ifTrue: [
		marvalue contents: value asString.
		^ value ].
	register = 'mbr' ifTrue: [
		mbrvalue contents: value asString.
		^ value ].
	register = 'carry' ifTrue: [
		carryvalue contents: value asString.
		^ value ].
	register = 'sign' ifTrue: [
		signvalue contents: value asString.
		^ value ].
	register = 'zero' ifTrue: [
		zerovalue contents: value asString.
		^ value ].
	register = 'interrupt' ifTrue: [
		interruptvalue contents: value asString.
		^ value ].
	register = 'bus' ifFalse: [ ^ self ].
	busvalue contents: value asString.
	^ value
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
