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
		'ah',
		'al',
		'bx',
		'bh',
		'bl',
		'cx',
		'ch',
		'cl',
		'dx',
		'dh',
		'dl',
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
		'interruptvalue',
		'openFileButton',
		'codeSegButton',
		'dataSegButton',
		'registerDictionary',
		'mbrinstruction',
		'businstruction',
		'runProgramButton',
		'closeButton',
		'ayudaButton',
		'acercaButton',
		'stepProgramButton',
		'step',
		'dataWindow',
		'runInstructionButton',
		'stepInstructionButton',
		'resetButton',
		'inregButton',
		'stiButton',
		'restoreButton',
		'saveButton',
		'outregButton'
	],
	#classVars : [
		'ArithmeticStrings',
		'InstructionMethods',
		'OperandDecodes',
		'OperandStrings'
	],
	#category : #AFCA
}

{ #category : #'class initialization' }
ControlUnit class >> initialize [

	"Se crea el diccionario que relaciona los códigos con las variables internas del CU"
	OperandDecodes := Dictionary new.
	OperandDecodes at: 0 put: 'ax';
		at: 1 put: 'bx';
		at: 2 put: 'cx';
		at: 3 put: 'dx';
		at: 4 put: 'al';
		at: 5 put: 'ah';
		at: 6 put: 'bl';
		at: 7 put: 'bh';
		at: 8 put: 'cl';
		at: 9 put: 'ch';
		at: 10 put: 'dl';
		at: 11 put: 'dh';
		at: 12 put: '[dir]';
		at: 13 put: '[bx]';
		at: 14 put: '[bl]';
		at: 15 put: '[bh]';
		at: 16 put: 'inm'.
	
	OperandStrings := Dictionary new.
	OperandStrings at: 0 put: 'reg';
		at: 1 put: 'reg';
		at: 2 put: 'reg';
		at: 3 put: 'reg';
		at: 4 put: 'reg';
		at: 5 put: 'reg';
		at: 6 put: 'reg';
		at: 7 put: 'reg';
		at: 8 put: 'reg';
		at: 9 put: 'reg';
		at: 10 put: 'reg';
		at: 11 put: 'reg';
		at: 12 put: 'mem';
		at: 13 put: 'bx';
		at: 14 put: 'bx';
		at: 15 put: 'bx';
		at: 16 put: 'im'.


	"Se inicializa el diccionario que va a contener el mappeo de los métodos a ejecutar de acuerdo con los operandos"
	InstructionMethods :=	Dictionary new.
	"Mov"
	InstructionMethods at: 0 put: 'mov';
		at: 1 put: 'out';
		at: 2 put: 'in';
		at: 3 put: 'jmp';
		at: 4 put: 'jz';
		at: 5 put: 'op'; "cmp"
		at: 6 put: 'cli';
		at: 7 put: 'sti';
		at: 8 put: 'op'; "add"
		at: 9 put: 'op'; "sub"
		at: 10 put: 'op'; "mul"
		at: 11 put: 'op'; "div"
		at: 12 put: 'op'; "and"
		at: 13 put: 'op'; "or"
		at: 14 put: 'not'; "xor"
		at: 15 put: 'op'; "shl"
		at: 16 put: 'op'; "shr"
		at: 17 put: 'stc';
		at: 18 put: 'stz';
		at: 19 put: 'sts';
		at: 20 put: 'clc';
		at: 21 put: 'clz';
		at: 22 put: 'cls';
		at: 23 put: 'op';
		at: 255 put: 'stop'.

		
	"Se inicializa el diccionario que va a contener el mappeo de la operación a ejecutar en los métodos aritméticos"
	ArithmeticStrings := Dictionary new.
	ArithmeticStrings
		at: 8 put: 'add';
		at: 9 put: 'sub';
		at: 10 put: 'mul';
		at: 11 put: 'div';
		at: 12 put: 'and';
		at: 13 put: 'or';
		at: 15 put: 'shl';
		at: 16 put: 'shr';
		at: 23 put: 'xor'.
]

{ #category : #microinstructions }
ControlUnit >> TEST: flag [
	"Microinstrucción que retorna true o false dependiendo de si una bandera está prendida"
	"Codificación de flags:
	carry = 0
	sign = 1
	zero = 2
	interrupt = 3" 
	(flag = 0) ifTrue:[
			((busDatos flags) carry isZero) ifFalse: [ 
					^true
				 ]
	]. 
	(flag = 1) ifTrue:[
			((busDatos flags) sign isZero) ifFalse: [ 
					^true
				 ]
	]. 
	(flag = 2) ifTrue:[
			((busDatos flags) zero isZero) ifFalse: [ 
					^true
				 ]
	]. 
	(flag = 3) ifTrue:[
			((busDatos flags) interrupt isZero) ifFalse: [ 
					^true
				 ]
	]. 
	^false

]

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

{ #category : #accessing }
ControlUnit >> ah [
	^ah

]

{ #category : #accessing }
ControlUnit >> al [
	^al

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

{ #category : #accessing }
ControlUnit >> arrow: destino secondParameter: fuente [
	"Microinstrucción de <- para mover datos de registro X a registro Y."
	(fuente isKindOf: Register)
	ifTrue: [destino complete: (fuente complete)]
	ifFalse: [destino complete: fuente].

]

{ #category : #microinstructions }
ControlUnit >> arrowInstruction: destino secondParameter: fuente [
	"Microinstrucción de <- para mover datos de registro X a registro Y."
	(fuente isMemberOf: Instruction)
	ifTrue: [destino instruction: fuente]
	ifFalse: [destino instruction: (fuente instruction)].

]

{ #category : #accessing }
ControlUnit >> ax [
^ax
]

{ #category : #accessing }
ControlUnit >> bh [
	^bh

]

{ #category : #accessing }
ControlUnit >> bl [
	^bl

]

{ #category : #accessing }
ControlUnit >> busDatos [
	^busDatos

]

{ #category : #accessing }
ControlUnit >> bx [
^bx
]

{ #category : #accessing }
ControlUnit >> ch [
	^ch

]

{ #category : #accessing }
ControlUnit >> cl [
	^cl

]

{ #category : #flags }
ControlUnit >> clc [
	(busDatos flags) clc.
	self updateRegister: 'carry' secondParameter: (busDatos flags carry). 

]

{ #category : #flags }
ControlUnit >> cli [
	(busDatos flags) cli.
	self updateRegister: 'interrupt' secondParameter: (busDatos flags interrupt). 

]

{ #category : #'initialize-release' }
ControlUnit >> close [
World submorphs select: [ :m | 
    m class = Morph and: [ 
    m isLocked not ] ] 
thenDo: [ :m | m delete ].
World submorphs select: [ :m | 
    m class = SimpleButtonMorph and: [ 
    m isLocked not ] ] 
thenDo: [ :m | m delete ].
World submorphs select: [ :m | 
    m class = TextMorph and: [ 
    m isLocked not ] ] 
thenDo: [ :m | m delete ].

]

{ #category : #gui }
ControlUnit >> closedisplaycode [
	dataWindow delete.

]

{ #category : #flags }
ControlUnit >> cls [
	(busDatos flags) cls.
	self updateRegister: 'sign' secondParameter: (busDatos flags sign). 

]

{ #category : #flags }
ControlUnit >> clz [
	(busDatos flags) clz.
	self updateRegister: 'zero' secondParameter: (busDatos flags zero). 

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
	
	mbrinstruction := TextMorph new contents: ''.
	businstruction := TextMorph new contents: ''.
	
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
	mbrgui addMorph: mbrinstruction.
	busgui addMorph: businstruction.

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
	mbrinstruction openInWorld.
	businstruction openInWorld.
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
	memoryvalue position: (memorytext position + (0@12)).
	memoryvalue position: (memorytext position + (0@12)).
	mbrinstruction position: (mbrvalue position + (0@12)).
	businstruction position: (busvalue position + (0@12)).
	
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
	
	
	openFileButton := SimpleButtonMorph new.
	openFileButton label: 'Cargar programa' .
	openFileButton on: #click send: #infile to: self.
	openFileButton openInWorld.
	openFileButton position: (openFileButton position + (40@400)).
	
	codeSegButton := SimpleButtonMorph new.
	codeSegButton label: 'Ver código' .
	codeSegButton on: #click send: #displaycode to: self.
	codeSegButton openInWorld.
	codeSegButton position: (codeSegButton position + (570@460)).
	
	dataSegButton := SimpleButtonMorph new.
	dataSegButton label: 'Ver datos' .
	dataSegButton on: #click send: #displaydata to: self.
	dataSegButton openInWorld.
	dataSegButton position: (dataSegButton position + (570@490)).
	memorygui addMorph: codeSegButton .
	memorygui addMorph: dataSegButton  .
	
	runProgramButton := SimpleButtonMorph new.
	runProgramButton label: 'Ejecutar programa' .
	runProgramButton on: #click send: #executeProgram to: self.
	runProgramButton openInWorld.
	runProgramButton position: (openFileButton position + (150@0)).
	
	closeButton := SimpleButtonMorph new.
	closeButton label: 'Cerrar AFCA' .
	closeButton on: #click send: #close to: self.
	closeButton color: (Color r: 0.8 g: 0 b: 0).
	closeButton openInWorld.
	closeButton position: (openFileButton position + (0@100)).

	resetButton := SimpleButtonMorph new.
	resetButton label: 'Restablecer AFCA' .
	resetButton color: (Color r: 0.8 g: 0 b: 0).
	resetButton on: #click send: #resetAFCA to: self.
	resetButton openInWorld.
	resetButton position: (resetButton position + (40@450)).

	stepProgramButton := SimpleButtonMorph new.
	stepProgramButton label: 'Programa paso a paso' .
	stepProgramButton on: #click send: #stepProgram to: self.
	stepProgramButton openInWorld.
	stepProgramButton position: (stepProgramButton position + (190@430)).

	runInstructionButton := SimpleButtonMorph new.
	runInstructionButton label: 'Ejecutar instrucción'.
	runInstructionButton on: #click send: #executeInstruction to: self.
	runInstructionButton color: (Color r: 0 g: 0.9 b: 0.9).
	runInstructionButton openInWorld.
	runInstructionButton position: (runInstructionButton position + (190@460)).
	
	stepInstructionButton := SimpleButtonMorph new.
	stepInstructionButton label: 'Instrucción paso a paso'.
	stepInstructionButton on: #click send: #stepInstruction to: self.
	stepInstructionButton color: (Color r: 0 g: 0.9 b: 0.9).
	stepInstructionButton openInWorld.
	stepInstructionButton position: (stepInstructionButton position + (190@490)).
	
	acercaButton := SimpleButtonMorph new.
	acercaButton label: 'Acerca de' .
	acercaButton on: #click send: #outacerca to: self.
	acercaButton openInWorld.
	acercaButton position: (closeButton position + (0@50)).
	
	ayudaButton := SimpleButtonMorph new.
	ayudaButton label: 'Ayuda' .
	ayudaButton on: #click send: #outayuda to: self.
	ayudaButton openInWorld.
	ayudaButton position: (acercaButton position + (0@50)).

	saveButton := SimpleButtonMorph new.
	saveButton label: 'Guardar AFCA'.
	saveButton on: #click send: #saveAFCA to: self.
	saveButton color: (Color r: 1.0 g: 0.5 b: 0).
	saveButton openInWorld.
	saveButton position: (saveButton position + (700@100)).
	
	restoreButton := SimpleButtonMorph new.
	restoreButton label: 'Cargar AFCA'.
	restoreButton on: #click send: #restoreAFCA to: self.
	restoreButton color: (Color r: 1.0 g: 0.5 b: 0).
	restoreButton openInWorld.
	restoreButton position: (restoreButton position + (700@150)).
	
	inregButton := SimpleButtonMorph new.
	inregButton label: 'Modificar registro'.
	inregButton on: #click send: #inreg to: self.
	inregButton color: (Color r: 0 g: 0.9 b: 0.9).
	inregButton openInWorld.
	inregButton position: (stepInstructionButton position + (0@30)).
	
	stiButton := SimpleButtonMorph new.
	stiButton label: 'Activar interrupción'.
	stiButton on: #click send: #sti to: self.
	stiButton color: (Color r: 1.0 g: 0.5 b: 0).
	stiButton openInWorld.
	stiButton position: (restoreButton position + (0@50)).
	
	outregButton := SimpleButtonMorph new.
	outregButton label: 'Desplegar contenido de un registro'.
	outregButton on: #click send: #outreg to: self.
	outregButton color: (Color r: 0 g: 0.9 b: 0.9).
	outregButton openInWorld.
	outregButton position: (inregButton position + (0@30)).

]

{ #category : #accessing }
ControlUnit >> cx [
^cx
]

{ #category : #accessing }
ControlUnit >> dh [
	^dh

]

{ #category : #gui }
ControlUnit >> displayStepWindow [
	| myWindow windowColor stepButton viewCodeButton viewDataButton|
	windowColor := Color r: 0 g: 0.9 b: 0.2.
	
	myWindow := Morph new color: windowColor.
	myWindow openInWorld.
	myWindow position: (myWindow position + (600@200)).
	myWindow extent: 300@150.
	
	stepButton := SimpleButtonMorph new.
	stepButton label: 'Siguiente microinstrucción' .
	stepButton on: #click send: #stepInstruction to: self.
	stepButton openInWorld.
	stepButton position: (stepButton position + (620@220)).
	
	viewCodeButton := SimpleButtonMorph new.
	viewCodeButton label: 'Ver código' .
	viewCodeButton on: #click send: #displaycode to: self.
	viewCodeButton openInWorld.
	viewCodeButton position: (viewCodeButton position + (620@260)).

	
	viewDataButton := SimpleButtonMorph new.
	viewDataButton label: 'Ver datos' .
	viewDataButton on: #click send: #displaydata to: self.
	viewDataButton openInWorld.
	viewDataButton position: (viewDataButton position + (620@300)).
	myWindow addMorph: stepButton.
	myWindow addMorph: viewCodeButton .
	myWindow addMorph: viewDataButton  .
	myWindow position: 800@200.

]

{ #category : #gui }
ControlUnit >> displaycode [
	| memory code message window textMorph scrollbar pasteup|
	memory := (busDatos memory) .
	code := memory code.
	message := ''.
	1 to: code size do: [:index |
		| instruction |
		instruction := (code at: index).
		message := message, '        ',(index asString), ': ', (instruction asString),  ',' , (Character cr asString), (Character lf asString).
		].
	window := SystemWindow new.
	window setLabel: 'Código en la memoria'.
	textMorph := TextMorph new.
	textMorph contents: message.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	window addMorph: scrollbar.
	window addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 1000@3500.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	window addMorph: scrollbar frame: (0@0 corner: 1@1).
	window openInWorld.
	window position: 800@200.

]

{ #category : #gui }
ControlUnit >> displaydata [
	| memory data message window textMorph scrollbar pasteup|
	memory := (busDatos memory) .
	data := memory data.
	message := ''.
	1 to: data size do: [:index |
		message := message, '        ',(index asString), ': ', ((data at: index) asString),  ',' , (Character cr asString), (Character lf asString).
		].
	window := SystemWindow new.
	window setLabel: 'Datos en la memoria'.
	textMorph := TextMorph new.
	textMorph contents: message.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	window addMorph: scrollbar.
	window addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 1000@3500.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	window addMorph: scrollbar frame: (0@0 corner: 1@1).
window openInWorld.
window position: 800@200.

]

{ #category : #gui }
ControlUnit >> displaydatapart: position [
	| memory data message textMorph scrollbar pasteup start end |
	memory := (busDatos memory) .
	data := memory data.
	message := ''.
	start := position  - 12.
	start < 1 ifTrue: [start := 1].
	end := start + 24.
	end > (data size) ifTrue: [end := (data size)].
	start to: end do: [:index |
		message := message, '        ',(index asString), ': ', ((data at: index) asString),  ',' , (Character cr asString), (Character lf asString).
		].
	dataWindow := SystemWindow new.
	dataWindow setLabel: 'Datos en la memoria'.
	textMorph := TextMorph new.
	textMorph contents: message.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	dataWindow addMorph: scrollbar.
	dataWindow addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 300@3500.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	dataWindow addMorph: scrollbar frame: (0@0 corner: 1@1).
	dataWindow openInWorld.
	dataWindow position: 800@200.


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
ControlUnit >> dl [
	^dl

]

{ #category : #accessing }
ControlUnit >> dx [
^dx
]

{ #category : #initialization }
ControlUnit >> executeInstruction [
	| memory instruction instructionStr operand1 operand2 operand1Var operand2Var operand1Str operand2Str operand3Str methodStr|
	memory := busDatos memory.
	"Si el program counter está vacío, lo ponemos a apuntar a la primera posición en memoria.
	Si no está vacío, continúa ejecutándose desde donde apunta"
	(programCounter complete isZero) ifTrue: [programCounter complete: 1.].
	
	self updateRegister: 'pc' secondParameter: (programCounter complete).

	
	"Ciclo de fetch"
		self arrow: (busDatos temporary) secondParameter: (programCounter complete).
		self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
		self arrow: (memory mar) secondParameter: (busDatos temporary) . 
		self updateRegister: 'mar' secondParameter: ((memory mar) complete) .
		memory readCode.
		(((memory mbr instruction) isNil) or: [(memory mbr instruction instruccion) = 255]) ifTrue: [UIManager default inform: 'Fin de ejecución.'.]
		ifFalse: [
		self updateRegister: 'mbr' secondParameter: ((memory mbr) instruction) .
		self arrowInstruction: (busDatos temporary) secondParameter: (memory mbr).
		self updateRegister: 'bus' secondParameter: ((busDatos temporary) instruction) .
		self arrowInstruction: instructionRegister secondParameter: (busDatos temporary).
		self updateRegister: 'ir' secondParameter: (instructionRegister instruction).
		instruction := instructionRegister instruction.
		instructionStr := InstructionMethods at: (instruction instruccion).
		(instruction fuente) ifNotNil: [ 
		operand1Var := OperandDecodes at: (instruction fuente).
		operand1Var := self transformOperand: operand1Var data: (instruction cuartodato).
		(operand1Var isKindOf: Integer) ifFalse: [operand1 := (registerDictionary at: operand1Var)] ifTrue: [operand1 := operand1Var].
		operand1Str := OperandStrings at: (instruction fuente).].
		(instruction destino) ifNotNil: [ 
		operand2Var := OperandDecodes at: (instruction destino).
		operand2Var := self transformOperand: operand2Var data: (instruction cuartodato).
		(operand2Var isKindOf: Integer) ifFalse: [operand2 := (registerDictionary at: operand2Var)] ifTrue: [operand2 := operand2Var].
		operand2Str := OperandStrings at: (instruction destino).].
	
		(instruction destino)
			"No tiene operandos"
			ifNil: [methodStr := instructionStr.
					self perform: methodStr asSymbol .]
			ifNotNil: [
				(instruction fuente)
					"Tiene 1 solo operando"
					ifNil: [methodStr := instructionStr,operand2Str,':'.
							self perform: methodStr asSymbol with: operand2
							]
					ifNotNil:[
						"Tiene 2 operandos"
						methodStr := instructionStr,operand1Str,'to',operand2Str,':secondParameter:'.
						"Si es una operación aritmética, hay que ver cuál es"
						(instructionStr = 'op')
							ifTrue: [ operand3Str := ArithmeticStrings at: (instruction instruccion).
								methodStr := methodStr,'operation:'.
								self perform: methodStr asSymbol with: operand1 with: operand2 with: operand3Str.
							]
							ifFalse: [self perform: methodStr asSymbol with: operand1 with: operand2.].
						].
			].
			"Ejecuta la instruccion decodificada"
			"compiler evaluate: methodStr for: self."
			
			"Subciclo de interrupcion"
			(self TEST: 3) ifTrue: [
				UIManager default inform: 'Se está atendiendo una interrupción'.
				self cli.
				]. 
			"Incrementa el PC"
			self opimtoreg: 1 secondParameter: programCounter operation: 'add'.
		].

]

{ #category : #initialization }
ControlUnit >> executeProgram [
	| memory finish |
	memory := busDatos memory.
	"Si el program counter está vacío, lo ponemos a apuntar a la primera posición en memoria.
	Si no está vacío, continúa ejecutándose desde donde apunta"
	(programCounter complete isZero) ifTrue: [programCounter complete: 1.].

	self updateRegister: 'pc' secondParameter: (programCounter complete).
	
	finish := false.
	
	"Ciclo de fetch"
	[finish] whileFalse: [
		| instruction instructionStr operand1 operand2 operand1Var operand2Var operand1Str operand2Str operand3Str methodStr |
		self arrow: (busDatos temporary) secondParameter: (programCounter complete).
		self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
		self arrow: (memory mar) secondParameter: (busDatos temporary) . 
		self updateRegister: 'mar' secondParameter: ((memory mar) complete) .
		memory readCode.
		(((memory mbr instruction) isNil) or: [(memory mbr instruction instruccion) = 255]) ifTrue: [finish  := true.
			UIManager default inform: 'Fin de ejecución.'.]
		ifFalse: [
		self updateRegister: 'mbr' secondParameter: ((memory mbr) instruction) .
		self arrowInstruction: (busDatos temporary) secondParameter: (memory mbr).
		self updateRegister: 'bus' secondParameter: ((busDatos temporary) instruction) .
		self arrowInstruction: instructionRegister secondParameter: (busDatos temporary).
		self updateRegister: 'ir' secondParameter: (instructionRegister instruction).
		instruction := instructionRegister instruction.
		instructionStr := InstructionMethods at: (instruction instruccion).
		(instruction fuente) ifNotNil: [ 
		operand1Var := OperandDecodes at: (instruction fuente).
		operand1Var := self transformOperand: operand1Var data: (instruction cuartodato).
		(operand1Var isKindOf: Integer) ifFalse: [operand1 := (registerDictionary at: operand1Var)] ifTrue: [operand1 := operand1Var].
		operand1Str := OperandStrings at: (instruction fuente).].
		(instruction destino) ifNotNil: [ 
		operand2Var := OperandDecodes at: (instruction destino).
		operand2Var := self transformOperand: operand2Var data: (instruction cuartodato).
		(operand2Var isKindOf: Integer) ifFalse: [operand2 := (registerDictionary at: operand2Var)] ifTrue: [operand2 := operand2Var].
		operand2Str := OperandStrings at: (instruction destino).].
	
		(instruction destino)
			"No tiene operandos"
			ifNil: [methodStr := instructionStr.
					self perform: methodStr asSymbol .]
			ifNotNil: [
				(instruction fuente)
					"Tiene 1 solo operando"
					ifNil: [methodStr := instructionStr,operand2Str,':'.
							self perform: methodStr asSymbol with: operand2
							]
					ifNotNil:[
						"Tiene 2 operandos"
						methodStr := instructionStr,operand1Str,'to',operand2Str,':secondParameter:'.
						"Si es una operación aritmética, hay que ver cuál es"
						(instructionStr = 'op')
							ifTrue: [ operand3Str := ArithmeticStrings at: (instruction instruccion).
								methodStr := methodStr,'operation:'.
								self perform: methodStr asSymbol with: operand1 with: operand2 with: operand3Str.
							]
							ifFalse: [self perform: methodStr asSymbol with: operand1 with: operand2.].
						].
			].
			"Ejecuta la instruccion decodificada"
			"compiler evaluate: methodStr for: self."
			
			"Subciclo de interrupcion"
			(self TEST: 3) ifTrue: [
				UIManager default inform: 'Se está atendiendo una interrupción'.
				self cli.
				]. 
			"Incrementa el PC"
			self opimtoreg: 1 secondParameter: programCounter operation: 'add'.
		].
	].

]

{ #category : #microinstructions }
ControlUnit >> in [
|value gui|
	gui := UIManager default.
	value := gui request: '¿Cuál es el nuevo valor?' initialAnswer: '0' .
	(value = '' or: value isNil) ifFalse: [ 
	(value allSatisfy: #isDigit) ifTrue: [value := value asNumber.
	self movimtoreg: value secondParameter: (busDatos memory) mbr . 
	self updateRegister: 'mbr' secondParameter: value .
	^ true.
	] ifFalse: [ UIManager default inform: 'Ese valor no es válido.'.
	^ false . ]. ] ifTrue: [ UIManager default inform: 'El valor no puede estar vacío.'.
	^ false . ].
]

{ #category : #'file support' }
ControlUnit >> infile [
	|gui answer instructions|
	gui := UIManager default.
	answer := gui request: '¿Cuál es el nombre del archivo?' initialAnswer: 'program.asm' .
	( answer = '' or: answer isNil ) ifFalse: [ 
		self resetAFCA.
		instructions := self openFile: answer.
		"Procesa las instrucciones y las guarda en memoria"
		instructions ifNotNil: [ "|lastInstruction|"
			1 to: instructions size do: [ :index | 
				| instruction | 
				instruction := instructions at: index.
				self movinstructiontomem: instruction to: index.
			].
		"lastInstruction := Instruction new initialize: 'stop' .
		self movinstructiontomem: lastInstruction to: ((instructions size) + 1)."
		UIManager default inform: 'Archivo escrito en memoria.'.
		]					
	] ifTrue: [UIManager default inform: 'El nombre no puede estar vacío.'.].

]

{ #category : #initialization }
ControlUnit >> initialize [
	super initialize .
	instructionRegister := Subregister new initialize: 'ir'.
	busDatos := DataBus new initialize: self.
	programCounter := Subregister new initialize: 'pc'.
	ah := Subregister new initialize: 'ah'.
	al := Subregister new initialize: 'al'.
	ax := Register new initialize: 'ax' high: ah low: al.
	bh := Subregister new initialize: 'bh'.
	bl := Subregister new initialize: 'bl'.
	bx := Register new initialize: 'bx' high: bh low: bl.
	ch := Subregister new initialize: 'ch'.
	cl := Subregister new initialize: 'cl'.
	cx := Register new initialize: 'cx' high: ch low: cl.
	dh := Subregister new initialize: 'dh'.
	dl := Subregister new initialize: 'dl'.
	dx := Register new initialize: 'dx' high: dh low: dl.
	
	step := false.
	registerDictionary := Dictionary new.
	registerDictionary
    at: 'ax' put: ax;
    at: 'al' put: al;
    at: 'ah' put: ah;
    at: 'bx' put: bx;
    at: 'bh' put: bh;
    at: 'bl' put: bl;
    at: 'cx' put: cx;
    at: 'ch' put: ch;
    at: 'cl' put: cl;
    at: 'dx' put: dx;
    at: 'dh' put: dh;
    at: 'dl' put: dl;
	 at: 'ir' put: instructionRegister;
	 at: 'pc' put: programCounter;
	 at: 'mar' put: (busDatos memory mar);
	 at: 'mbr' put: (busDatos memory mbr);
	 at: 'b1' put: (busDatos alu b1);
	at: 'b2' put: (busDatos alu b2);
	at: 'b3' put: (busDatos alu b3);
	at: 'b4' put: (busDatos alu b4);
	at: 'bus' put: (busDatos temporary).
	self creategui .

]

{ #category : #modes }
ControlUnit >> inreg [
	|gui register valid options|
	gui := UIManager default.
	options := #('ax' 'ah' 'al' 'bx' 'bh' 'bl' 'cx' 'ch' 'cl' 'dx' 'dh' 'dl' 'bus' 'b1' 'b2' 'b3' 'b4' 'pc' 'mar' 'mbr' ).
	register := gui chooseFrom: options.
	( register = 0 or: register isNil ) ifFalse: [ 
		valid := self in.
		valid ifTrue: [ 
		self arrow: (busDatos temporary) secondParameter: ((busDatos memory) mbr) . 
		self updateRegister: 'bus' secondParameter: (((busDatos memory) mbr) complete).
		self arrow: (registerDictionary at: (options at: register)) secondParameter: (busDatos temporary) . 
		self updateRegister: (registerDictionary at: (options at: register)) .
 		UIManager default inform: 'Registro modificado.'.
		]
		ifFalse: [ UIManager default inform: 'No se pudo modificar el registro'. ] .
		]. 

]

{ #category : #gui }
ControlUnit >> inreg: register [
	|gui valid|
	gui := UIManager default.
	
		valid := self in.
		valid ifTrue: [ 
		self arrow: (busDatos temporary) secondParameter: ((busDatos memory) mbr) . 
		self updateRegister: 'bus' secondParameter: (((busDatos memory) mbr) complete).
		self arrow: register secondParameter: (busDatos temporary) . 
		self updateRegister: register .
 		UIManager default inform: 'Registro modificado.'.
		]
		ifFalse: [ UIManager default inform: 'No se pudo modificar el registro'. ] .

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
ControlUnit >> jmpim: direccion [
	"Instrucción para el jmp a dirección de código"
	"Movemos dirección al b1 porque hay que restarle 1 para que el program counter quede apuntando a la dirección correcta después del incremento en el ciclo de fetch."
	self arrow: (busDatos temporary) secondParameter: direccion.
	self updateRegister: 'bus' secondParameter: direccion.
	self arrow: (busDatos alu b1) secondParameter: (busDatos temporary).
	self updateRegister: 'b1' secondParameter: direccion.
	self arrow:  (busDatos temporary) secondParameter: 1.
	self updateRegister: 'bus' secondParameter: 1.
	self arrow: (busDatos alu b2) secondParameter: (busDatos temporary).
	self updateRegister: 'b2' secondParameter: (busDatos temporary complete).
	(busDatos alu) ALU: 9. "Realiza la resta"
	"Movemos el resultado de la resta al PC."
	self arrow: (busDatos temporary) secondParameter: (busDatos alu b3).
	self updateRegister: 'bus' secondParameter: (busDatos temporary complete).
	self arrow: programCounter secondParameter: (busDatos temporary) .
	self updateRegister: programCounter .

]

{ #category : #jumping }
ControlUnit >> jmpreg: register [
	self movregtoreg: register secondParameter: ((busDatos memory) mar) .
	
]

{ #category : #jumping }
ControlUnit >> jzim: direccion [
	"Instrucción para el jump si el zero flag está encendido"
	"TEST: 2 corresponde al Zero flag"
	(self TEST: 2) ifTrue: [
		"Movemos dirección al b1 porque hay que restarle 1 para que el program counter quede apuntando a la dirección correcta después del incremento en el ciclo de fetch."
		self arrow: (busDatos temporary) secondParameter: direccion.
		self updateRegister: 'bus' secondParameter: direccion.
		self arrow: (busDatos alu b1) secondParameter: (busDatos temporary).
		self updateRegister: 'b1' secondParameter: direccion.
		self arrow:  (busDatos temporary) secondParameter: 1.
		self updateRegister: 'bus' secondParameter: 1.
		self arrow: (busDatos alu b2) secondParameter: (busDatos temporary).
		self updateRegister: 'b2' secondParameter: (busDatos temporary complete).
		(busDatos alu) ALU: 9. "Realiza la resta"
		"Movemos el resultado de la resta al PC."
		self arrow: (busDatos temporary) secondParameter: (busDatos alu b3).
		self updateRegister: 'bus' secondParameter: (busDatos temporary complete).
		self arrow: programCounter secondParameter: (busDatos temporary) .
		self updateRegister: programCounter .
	].

]

{ #category : #moving }
ControlUnit >> movbxtoreg: register1 secondParameter: register2 [
	"En register1 viene bx, bh o bl"
	"Simula la instruccion de mov de un registro a un registro"
	self movregtoreg: register1 secondParameter: (busDatos memory mar).
	self updateRegister: 'mar' secondParameter: (((busDatos memory) mar) complete) .
	"Read a la memoria"
	(busDatos memory) read .
	step ifTrue: [self displaydatapart: (register1 complete)].
	self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete) .
	self arrow: (busDatos temporary) secondParameter: ((busDatos memory) mbr) . 
	self updateRegister: 'bus' secondParameter: (((busDatos memory) mbr) complete).
	self arrow: register2 secondParameter: (busDatos temporary) . 
	self updateRegister: register2 .

]

{ #category : #moving }
ControlUnit >> movimtobx: immediate secondParameter: register [
	"En register1 viene bx, bh o bl"
	"Simula la instruccion de mov de un registro a una posición en memoria marcada por el bx"
	self movimtoreg: immediate secondParameter: ((busDatos memory) mbr) . 
	self movregtoreg: register secondParameter: ((busDatos memory) mar) . 
	(busDatos memory) overwrite .
	step ifTrue: [self displaydatapart: (register complete)].

	

]

{ #category : #moving }
ControlUnit >> movimtoreg: immediate secondParameter: register [
	"Simula la instruccion de mov de un inmediato a un registro"
	register complete: immediate .
	self updateRegister: register .

]

{ #category : #moving }
ControlUnit >> movinstructiontomem: instruction to: direccion [
	"Simula mueve una instrucción a una posición en memoria"
	self arrowInstruction: (busDatos temporary) secondParameter: instruction . 
	self arrowInstruction: ((busDatos memory) mbr) secondParameter: (busDatos temporary) . "se mueve la direccion al mbr"
	self movimtoreg: direccion secondParameter: ((busDatos memory) mar) . "se mueve la direccion al mar" 
	(busDatos memory) writeCode .

]

{ #category : #moving }
ControlUnit >> movmemtoreg: direccion secondParameter: registro [
	"Simula la instruccion de mov del contenido de una posición en memoria a un registro"
	self movimtoreg: direccion secondParameter: ((busDatos memory) mar) . 
	(busDatos memory) read .
	step ifTrue: [self displaydatapart: direccion].
	self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete) .
	self arrow: (busDatos temporary) secondParameter: ((busDatos memory) mbr) . 
	self updateRegister: 'bus' secondParameter: (((busDatos memory) mbr) complete).
	self arrow: registro secondParameter: (busDatos temporary) . 
	self updateRegister: registro .

]

{ #category : #moving }
ControlUnit >> movregtobx: register1 secondParameter: register2 [
	"Simula la instruccion de mov de un registro a una posición en memoria"
	self arrow: (busDatos temporary) secondParameter:register1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos memory) mbr) secondParameter: (busDatos temporary) . 
	self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete) .
	self arrow: (busDatos temporary) secondParameter:register2 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos memory) mar) secondParameter: (busDatos temporary) . 
	self updateRegister: 'mar' secondParameter: (((busDatos memory) mar) complete) .
	(busDatos memory) overwrite .
	step ifTrue: [self displaydatapart: (register2 complete)].

]

{ #category : #moving }
ControlUnit >> movregtomem: register1 secondParameter: direccion [
	"Simula la instruccion de mov de un registro a una posición en memoria"
	self arrow: (busDatos temporary) secondParameter:register1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos memory) mbr) secondParameter: (busDatos temporary) . 
	self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete) .
	self movimtoreg: direccion secondParameter: ((busDatos memory) mar) . 
	(busDatos memory) overwrite .
	step ifTrue: [self displaydatapart: direccion].

]

{ #category : #moving }
ControlUnit >> movregtoreg: register1 secondParameter: register2 [
	"Simula la instruccion de mov de un registro a un registro"
	self arrow: (busDatos temporary) secondParameter: register1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: register2 secondParameter: (busDatos temporary) . 
	self updateRegister: register2 .

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
ControlUnit >> notreg: operando1 [
	"Instruccion de ensamblador que hace el not"
	self arrow: (busDatos temporary) secondParameter: operando1 .
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b1' secondParameter: (((busDatos alu) b1) complete) .
	(busDatos alu) not .
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self updateRegister: operando1 .

]

{ #category : #operating }
ControlUnit >> opbxtoreg: operando2 secondParameter: operando1 operation: op [
	"Este método realiza operaciones de la unidad de ALU y actualiza registros según la operación especificada."
	"Lo hace con un el valor en un registro a otro en memoria"
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b1' secondParameter: (((busDatos alu) b1) complete) .
	self movbxtoreg: operando2 secondParameter: ((busDatos alu) b2) .
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
	(busDatos alu) shr . ].
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self updateRegister: 'carry' secondParameter: ((busDatos flags) carry) .
	self updateRegister: 'sign' secondParameter: ((busDatos flags) sign) .
	self updateRegister: 'zero' secondParameter: ((busDatos flags) zero) .
	(op = 'cmp') ifFalse: [
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self updateRegister: operando1 . ].

]

{ #category : #'file support' }
ControlUnit >> openFile: fileName [
	|fileRef instructionText parts stream filecontent instructionArray| 
	"Es importante cambiar la ubicación del archivo para poder leerlo."
	fileRef := ('datos\',fileName) asFileReference .
	instructionText := '' .
	instructionArray := OrderedCollection new. "Arreglo donde se guardan las instrucciones"
	(fileRef exists) ifTrue: [
		stream := fileRef readStream . 
		filecontent := stream contents .
		1 to: filecontent size do: [:index |
   		| character |
    	character := filecontent at: index.
			(character = Character cr) ifTrue: [ 
				parts := instructionText substrings: ' '.
				(parts size > 2) ifTrue: [  
					parts at: 2 put:(((parts at: 2) substrings: ',') at:1).
				].
				(parts size = 1) ifTrue: [  
					instructionArray add: (Instruction new initialize: (parts at:1)) .
				].
				(parts size = 2) ifTrue: [  
					instructionArray add: (Instruction new initialize: (parts at:1) destino: (parts at:2)) .
				].
				(parts size = 3) ifTrue: [  
					instructionArray add: (Instruction new initialize: (parts at:1) destino: (parts at:2) fuente: (parts at:3)) .
				].
				instructionText := '' .
			] ifFalse: [ 
				(character = Character lf) ifFalse: [ 
					instructionText := instructionText, (character asString) . 
				]. 
			].
		].
		parts := instructionText substrings: ' '.
		(parts size > 1) ifTrue: [  
			parts at: 2 put:(((parts at: 2) substrings: ',') at:1).
		].
		(parts size = 1) ifTrue: [  
			instructionArray add: (Instruction new initialize: (parts at:1)) .
		].
		(parts size = 2) ifTrue: [  
			instructionArray add: (Instruction new initialize: (parts at:1) destino: (parts at:2)) .
		].
		(parts size = 3) ifTrue: [  
			instructionArray add: (Instruction new initialize: (parts at:1) destino: (parts at:2) fuente: (parts at:3)) .
		].
		^ instructionArray .
	] ifFalse: [UIManager default inform: 'Ese archivo no existe'.].

]

{ #category : #operating }
ControlUnit >> opimtoreg: immediate secondParameter: operando1 operation: op [
	"Este método realiza operaciones de la unidad de ALU y actualiza registros según la operación especificada."
	"Lo hace con un el valor en un inmediato a un registro"
	self arrow: (busDatos temporary) secondParameter: operando1 . 
	self updateRegister: 'bus' secondParameter: (operando1 complete) .
	self arrow: ((busDatos alu) b1) secondParameter: (busDatos temporary) . 
	self updateRegister: 'b1' secondParameter: (((busDatos alu) b1) complete) .
	self arrow: (busDatos temporary) secondParameter: immediate . 
	self updateRegister: 'bus' secondParameter: immediate .
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
	(busDatos alu) shr . ].
	(op = 'incPC') ifTrue: [
	(busDatos alu) incPC].

	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self updateRegister: 'carry' secondParameter: ((busDatos flags) carry) .
	self updateRegister: 'sign' secondParameter: ((busDatos flags) sign) .
	self updateRegister: 'zero' secondParameter: ((busDatos flags) zero) .
	(op = 'cmp') ifFalse: [
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self updateRegister: operando1 . ].

]

{ #category : #operating }
ControlUnit >> opmemtoreg: direccion secondParameter: operando1 operation: op [
	"Este método realiza operaciones de la unidad de ALU y actualiza registros según la operación especificada."
	"Lo hace con un el valor en un registro a otro en memoria"
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
	(busDatos alu) shr . ].
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self updateRegister: 'carry' secondParameter: ((busDatos flags) carry) .
	self updateRegister: 'sign' secondParameter: ((busDatos flags) sign) .
	self updateRegister: 'zero' secondParameter: ((busDatos flags) zero) .
	(op = 'cmp') ifFalse: [
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self updateRegister: operando1 . ].

]

{ #category : #operating }
ControlUnit >> opregtoreg: operando2 secondParameter: operando1 operation: op [
	"Este método realiza operaciones de la unidad de ALU y actualiza registros según la operación especificada."
	"Lo hace con un el valor en un registro a un registro"
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
	(busDatos alu) shr . ].
	self updateRegister: 'b3' secondParameter: (((busDatos alu) b3) complete) .
	self updateRegister: 'carry' secondParameter: ((busDatos flags) carry) .
	self updateRegister: 'sign' secondParameter: ((busDatos flags) sign) .
	self updateRegister: 'zero' secondParameter: ((busDatos flags) zero) .
	(op = 'cmp') ifFalse: [
	self arrow: (busDatos temporary) secondParameter: ((busDatos alu) b3) . 
	self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
	self arrow: operando1 secondParameter: (busDatos temporary) . 
	self updateRegister: operando1 . ].

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

{ #category : #gui }
ControlUnit >> out [
	| message window textMorph scrollbar pasteup|
	message := '         Valor: ', (busDatos memory mbr complete asString), '
	Instrucción: ',(busDatos memory mbr instruction asString).
	
	window := SystemWindow new.
	window setLabel: 'Contenido en el MBR'.
	textMorph := TextMorph new.
	textMorph contents: message.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	window addMorph: scrollbar.
	window addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 1000@2500.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	window addMorph: scrollbar frame: (0@0 corner: 1@1).
	window openInWorld.
	window position: 800@200.
]

{ #category : #gui }
ControlUnit >> outacerca [
	| window textMorph scrollbar pasteup|
	
	window := SystemWindow new.
	window setLabel: 'Acerca de'.
	textMorph := TextMorph new.
	textMorph contents: '
	Este programa es un simulador de la arquitectura de 
	cajitas azules vista en el curso de Fundamentos de 
	Organización de Computadores. Esta es la versión 1 
	del programa, creado el 5 de noviembre del 2023. Los
	autores son Daniel Granados Retana, carné 2022104692
	y Diego Granados Retana, carné 2022158363. Es para el
	curso Lenguajes de Programación.'.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	window addMorph: scrollbar.
	window addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 500@500.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	window addMorph: scrollbar frame: (0@0 corner: 1@1).
window openInWorld.
window position: 800@200.

	
]

{ #category : #gui }
ControlUnit >> outayuda [
	| window textMorph scrollbar pasteup|
	
	window := SystemWindow new.
	window setLabel: 'Ayuda'.
	textMorph := TextMorph new.
	textMorph contents: '
Instalación
Pharo
Para instalar Pharo, hay que entrar a la página https://pharo.org/download y 
descargar la versión para el sistema operativo de la computadora. Luego de abrir 
el Pharo Launcher, hay que crear una nueva imagen o importarla. Para este proyecto,
 se utilizó la versión estable Pharo 11.0 64 bit.

Para instalar la imagen, es necesario descargar los archivos de la imagen. 
Luego, en el Pharo Launcher, hay que presionar el botón de “Import”:

Se muestran dos opciones:

En este caso hay que escoger la de Import the image directory (and all files it contains) 
into the Pharo Launcher images. Luego, hay que buscar el directorio donde está la imagen y seleccionarla.

Se escoge un nombre para la imagen si es necesario y con eso aparece en el Launcher y podemos seleccionarla para abrirla.


Squeak
Para instalar Squeak, hay que entrar a la página https://squeak.org/downloads/ y descargar la versión correspondiente 
para el sistema operativo de la computadora. Esto descarga un empacado con los archivos de Squeak. 
Adentro está el Squeak.exe, que es el programa.

Para instalar el proyecto, hay dos opciones. Primero, es necesario definir dónde se quiere almacenar la imagen. 
Esto puede ser dentro del proyecto de la instalación de Squeak o se puede crear un nuevo folder y guardarlo ahí. 
La imagen está compuesta por dos archivos, un archivo .image y otro .changes, ambos son necesarios y deben ubicarse 
en el mismo folder. La primera opción de instalación es abriendo Squeak.exe y seleccionando la imagen del proyecto 
de Squeak. Luego ya se puede seguir con la ejecución.

La otra opción es con el archivo terminado .st. Este es el empaquetado del proyecto, lo más similar a un ejecutable
que hay. Squeak no está diseñado en su naturaleza de poder generar ejecutables (Fuente: https://wiki.squeak.org/squeak/780). 
Ahora se puede abrir otra imagen de Squeak, limpia o nueva y arrastrar el archivo a la pestaña de Squeak y 
luego seleccionar “file in entire file”.
Ejecución
Cuando ya se tiene la imagen de la AFCA, si no está creada, hay que abrir el Playground en Pharo o 
el Workspace en Squeak. Para abrir el Playground en Pharo, se presiona en cualquier parte de la pantalla 
y se entra a la sección de Browse y luego al Playground. Para abrir el Workspace en Squeak, hacemos click 
izquierdo con el mouse en cualquier lugar de la pantalla y se selecciona Workspace.

Ahí, simplemente podemos copiar y pegar el siguiente código:
| cu |
Instruction initialize.
ControlUnit initialize.
cu := ControlUnit new.
Si se desea crear una AFCA completamente nueva, hay que hacer:
| cu |
Instruction initialize.
ControlUnit initialize.
World submorphs select: [ :m | 
    m class = Morph and: [ 
    m isLocked not ] ] 
thenDo: [ :m | m delete ].
World submorphs select: [ :m | 
    m class = SimpleButtonMorph and: [ 
    m isLocked not ] ] 
thenDo: [ :m | m delete ].
World submorphs select: [ :m | 
    m class = TextMorph and: [ 
    m isLocked not ] ] 
thenDo: [ :m | m delete ].
cu := ControlUnit new.
Luego, lo seleccionamos todo y presionamos click derecho → “Do it”, o Ctrl + d en Squeak.

Esto nos lleva a tener lo siguiente:
En Pharo:

En Squeak:

Primero, antes de empezar, hay que ir al directorio donde está almacenada el AFCA y crear el fólder 
de datos. En este se van a almacenar los programas y los respaldos de las imágenes.
  


Los archivos donde se almacena el código pueden tener cualquier nombre, nada más es recomendado
 que sigan el formato que se usa para almacenar los programas en ensamblador.
Un ejemplo puede ser el siguiente:

Para este simulador, es importante escribir las instrucciones con los espacios y comas adecuadas. 
Por ejemplo, hay que separar la instrucción del primer operando con un solo espacio, poner una coma 
inmediatamente después del primer operando, y poner otro espacio para separar el segundo operando. 
Además, todo debe ir en minúscula. De esta forma, uno se asegura que las instrucciones deberían funcionar.

Luego de tener el programa almacenado correctamente, se puede presionar el botón para agregar el programa. 
Se abre una pantalla donde uno puede ingresar el nombre del archivo. Es importante incluir la extensión.

Si el archivo se cargó correctamente, aparece un mensaje en la pantalla.

Luego, si se presiona el botón de “Ver código” en la memoria, se despliega el contenido del segmento de código 
con el programa codificado:

Para ejecutar el programa, existen varias opciones: 

El botón de “Ejecutar Programa” lo corre completo, sin parar.

El botón de “Programa paso a paso” ejecuta el programa microinstrucción por microinstrucción hasta el puro final, 
no se puede parar hasta terminar y no se pueden modificar los valores entre microinstrucciones, solo verlos en 
el GUI. Cuando se hace un acceso a memoria, aparece una ventana con el pedazo de memoria modificado. En cada 
microinstrucción aparece un mensaje para pedir que se continúe con el programa. Uno ejemplo de estos mensajes 
es el siguiente:


El botón de “Ejecutar instrucción” ejecuta una sola instrucción de ensamblador. Corre el microprograma completo.

El botón de “Instrucción paso a paso” ejecuta una sola instrucción, pero microinstrucción por microinstrucción, 
al igual que “Programa paso a paso”. Se muestran mensajes con los cambios realizados por las microinstrucciones.

Existen otros botones que permiten modificar y mostrar información:
 
El botón de “Modificar registro” cambia el valor almacenado en un registro. Se muestra un menú con los 
registros disponibles y luego se pide el valor nuevo.


El botón de “Desplegar contenido de un registro” pide el mismo menú y luego muestra el contenido de ese 
registro. Utiliza el MBR para desplegar el valor.

El botón de “Ver datos” en la memoria despliega todo lo que está en el segmento de datos de la memoria.

El de “Ver código” en la memoria despliega el código almacenado. 

El botón de “Activar interrupción” enciende la bandera de interrupción. Luego en el ciclo de fetch se manejará la interrupción y se mostrará un mensaje.


Hay botones que son más de aspectos administrativos de la AFCA:

El botón de “Restablecer AFCA” reinicia los valores de todos los registros.

El botón de “Cerrar AFCA” cierra la AFCA y si se quiere volver a correrla, hay que correr las 
instrucciones en el Playground o Workspace que se explicaron al inicio de esta sección.

El botón de “Acerca de” despliega una ventana con la información del programa.


El botón de “Ayuda” muestra una ventaja con el presente manual.

El botón de “Guardar AFCA” es que se utiliza para respaldar la AFCA y la salva a disco. Muestra una 
ventana que pide el nombre del archivo.

Un archivo queda de la siguiente manera:

En primera fila vienen los contenidos de registros y banderas en el siguiente orden:
ax bx cx dx programCounter b1 b2 b3 b4 busDatos carry sign zero interrupt mar mbr
En la segunda fila viene el contenido del instruction register.
Luego, en las siguientes 128 líneas vienen los datos y en las 128 líneas restantes está el código. 
Las instrucciones tienen el formato de instruccionCode destinoCode fuenteCode cuartoDato.

El botón de “Cargar AFCA” establece los valores de la AFCA con base en la información en el archivo 
que se le envía. Luego, se muestra un mensaje de éxito:

Si el archivo de restauración no existe, el programa muestra el siguiente mensaje de error:

No obstante, esto no afecta en el funcionamiento de la AFCA.

Estas son todas las funcionalidades implementadas en la AFCA. Con este manual de usuario ya se puede 
usar en su máximo esplendor.'.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	window addMorph: scrollbar.
	window addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 8000@3000.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	window addMorph: scrollbar frame: (0@0 corner: 1@1).
window openInWorld.
window position: 800@200.


]

{ #category : #gui }
ControlUnit >> outcode [
	| message window textMorph scrollbar pasteup|
	message := ''.
	1 to: 128 do: [:index |
		| instruction |
		self arrow: (busDatos temporary) secondParameter: index.
      self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete) .
      self arrow: ((busDatos memory) mar) secondParameter: (busDatos temporary) . 
      self updateRegister: 'mar' secondParameter: (((busDatos memory) mar) complete) .
      (busDatos memory) readCode.
		
		self arrowInstruction: (busDatos temporary)  secondParameter: ((busDatos memory) mbr).
		mbrinstruction contents: ((((busDatos memory) mbr) instruction) asString ) .
		businstruction contents: (((busDatos temporary) instruction) asString ) .
    	instruction := (busDatos temporary) instruction.
		message := message, '        ',(index asString), ': ', (instruction asString),  ',' , (Character cr asString), (Character lf asString).
		].
	window := SystemWindow new.
	window setLabel: 'Código en la memoria'.
	textMorph := TextMorph new.
	textMorph contents: message.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	window addMorph: scrollbar.
	window addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 1000@2500.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	window addMorph: scrollbar frame: (0@0 corner: 1@1).
	window openInWorld.
	window position: 800@200.
]

{ #category : #gui }
ControlUnit >> outdata [
	| message window textMorph scrollbar pasteup|
	message := ''.
	1 to: 128 do: [:index |
    	self movmemtoreg: index secondParameter: (self dx) .
		message := message, '        ',(index asString), ': ', (dx complete asString),  ',' , (Character cr asString), (Character lf asString).
		].
	window := SystemWindow new.
	window setLabel: 'Datos en la memoria'.
	textMorph := TextMorph new.
	textMorph contents: message.
	textMorph setProperty: #wrap toValue: true.
	
	scrollbar := ScrollPane new.
	window addMorph: scrollbar.
	window addMorph: textMorph frame: (0 @ 0 extent: 1 @ 1).
	pasteup := PasteUpMorph new.
	pasteup := PasteUpMorph new.
	pasteup extent: 1000@2500.
	pasteup addMorph: textMorph .
	scrollbar scroller addMorph: pasteup.
	window addMorph: scrollbar frame: (0@0 corner: 1@1).
window openInWorld.
window position: 800@200.


]

{ #category : #gui }
ControlUnit >> outreg [
	|gui register options|
	gui := UIManager default.
	options := #('ax' 'ah' 'al' 'bx' 'bh' 'bl' 'cx' 'ch' 'cl' 'dx' 'dh' 'dl' 'bus' 'b1' 'b2' 'b3' 'b4' 'pc' 'mar' 'mbr' ).
	register := gui chooseFrom: options.
	( register = 0 or: register isNil ) ifFalse: [ 
		self arrow: (busDatos temporary) secondParameter: (registerDictionary at: (options at: register)) . 
		self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete).
		self arrow: ((busDatos memory) mbr) secondParameter: (busDatos temporary) .
		self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete).
		self out.
		]
		ifTrue: [ UIManager default inform: 'No se pudo desplegar el contenido del registro'. ] .

]

{ #category : #gui }
ControlUnit >> outreg: register [
	|gui |
	gui := UIManager default.

		self arrow: (busDatos temporary) secondParameter: register. 
		self updateRegister: 'bus' secondParameter: ((busDatos temporary) complete).
		self arrow: ((busDatos memory) mbr) secondParameter: (busDatos temporary) .
		self updateRegister: 'mbr' secondParameter: (((busDatos memory) mbr) complete).
		self out.

]

{ #category : #gui }
ControlUnit >> refreshgui [
	"Refreza las cajas del GUI"

	self updateRegister: ax.
	self updateRegister: bx.
	self updateRegister: cx.
	self updateRegister: dx.
	self updateRegister: programCounter.
	self updateRegister: instructionRegister.
	self updateRegister: (busDatos alu b1).
	self updateRegister: (busDatos alu b2).
	self updateRegister: (busDatos alu b3).
	self updateRegister: (busDatos alu b4).
	self updateRegister: (busDatos memory mar).
	self updateRegister: (busDatos memory mbr).
	self updateRegister: 'carry' secondParameter: (busDatos flags carry).
	self updateRegister: 'sign' secondParameter: (busDatos flags sign).
	self updateRegister: 'zero' secondParameter: (busDatos flags zero).
	self updateRegister: 'interrupt' secondParameter: (busDatos flags interrupt).
	self updateRegister: 'bus' secondParameter: (busDatos temporary complete).

]

{ #category : #initialization }
ControlUnit >> resetAFCA [
	"Reestable toda la AFCA"
instructionRegister := Subregister new initialize: 'ir'.
	busDatos := DataBus new initialize: self.
	programCounter := Subregister new initialize: 'pc'.
	ah := Subregister new initialize: 'ah'.
	al := Subregister new initialize: 'al'.
	ax := Register new initialize: 'ax' high: ah low: al.
	bh := Subregister new initialize: 'bh'.
	bl := Subregister new initialize: 'bl'.
	bx := Register new initialize: 'bx' high: bh low: bl.
	ch := Subregister new initialize: 'ch'.
	cl := Subregister new initialize: 'cl'.
	cx := Register new initialize: 'cx' high: ch low: cl.
	dh := Subregister new initialize: 'dh'.
	dl := Subregister new initialize: 'dl'.
	dx := Register new initialize: 'dx' high: dh low: dl.
	
	step := false.
	registerDictionary := Dictionary new.
	registerDictionary
    at: 'ax' put: ax;
    at: 'al' put: al;
    at: 'ah' put: ah;
    at: 'bx' put: bx;
    at: 'bh' put: bh;
    at: 'bl' put: bl;
    at: 'cx' put: cx;
    at: 'ch' put: ch;
    at: 'cl' put: cl;
    at: 'dx' put: dx;
    at: 'dh' put: dh;
    at: 'dl' put: dl;
	 at: 'ir' put: instructionRegister;
	 at: 'pc' put: programCounter;
	 at: 'mar' put: (busDatos memory mar);
	 at: 'mbr' put: (busDatos memory mbr);
	 at: 'b1' put: (busDatos alu b1);
	at: 'b2' put: (busDatos alu b2);
	at: 'b3' put: (busDatos alu b3);
	at: 'b4' put: (busDatos alu b4);
	at: 'bus' put: (busDatos temporary).

	self refreshgui .

]

{ #category : #'file support' }
ControlUnit >> restoreAFCA [
	"Método para restaurar un archivo de un AFCA. Se lee del folder datos/"
	|gui answer archivo line flags memory alu data code|
	gui := UIManager default.
	answer := gui request: '¿Cuál es el nombre del archivo?' initialAnswer: 'afca.txt' .
	(answer = '' or: answer isNil) ifFalse: [
		| lineArray stream fileArray|
		"Reestablecemos le AFCA"
		self resetAFCA.
		"Abrimos el archivo"
        answer := 'datos\',answer.
        
        stream := answer asFileReference readStream . 
        archivo := stream contents .
		
		flags := busDatos flags.
		alu := busDatos alu.
		memory := busDatos memory .
		data := memory data.
		code := memory code.
		
		fileArray := archivo findTokens: String crlf.
		line := fileArray at:1.
		lineArray := line substrings.
		"Leemos y actualizamos los registros con la información del archivo"
		ax complete: ((lineArray at: 1) asNumber).
		bx complete: ((lineArray at: 2) asNumber).
		cx complete: ((lineArray at: 3) asNumber).
		dx complete: ((lineArray at: 4) asNumber).
		programCounter complete: ((lineArray at: 5) asNumber).
		alu b1 complete: ((lineArray at: 6) asNumber).
		alu b2 complete: ((lineArray at: 7) asNumber).
		alu b3 complete: ((lineArray at: 8) asNumber).
		alu b4 complete: ((lineArray at: 9) asNumber).
		(busDatos temporary) complete: ((lineArray at: 10) asNumber).
		flags carry: ((lineArray at: 11) asNumber).
		flags sign: ((lineArray at: 12) asNumber).
		flags zero: ((lineArray at: 13) asNumber).
		flags interrupt: ((lineArray at: 14) asNumber).
		memory mar complete: ((lineArray at: 15) asNumber).
		memory mbr complete: ((lineArray at: 16) asNumber).
	
		"actualiza el instructionRegister"
		line := fileArray at:2.
		lineArray := line substrings.
		
		instructionRegister instruction: (Instruction new initializeNumber: (lineArray at: 1)
			destino: (lineArray at: 2)
			fuente: (lineArray at: 3)
			dato: (lineArray at: 4)).
			
		"Actualiza el segmento de datos en memoria"
		1 to: data size do: [:index | 
			line := fileArray at:(index+2).
			data at: index put: (line asNumber).
			].
		
		"Actualiza el segmento de código en memoria"
		1 to: code size do: [:index |
			line := fileArray at:(index + 130).
			lineArray := line substrings.
			(lineArray size = 1)
			ifFalse: [code at: index put: (Instruction new
				initializeNumber: (lineArray at: 1)
				destino: (lineArray at: 2)
				fuente: (lineArray at: 3)
				dato: (lineArray at: 4)).]
			].
	
		"Refrezca el gui"
		self refreshgui.
		
		UIManager default inform: 'AFCA cargada'.					
	] ifTrue: [UIManager default inform: 'El nombre no puede estar vacío.'.].

]

{ #category : #'file support' }
ControlUnit >> saveAFCA [
	|gui answer archivo content flags memory alu instruction data code|
	gui := UIManager default.
	(instructionRegister instruction) ifNil: [UIManager default inform: 'Ejecute una instrucción antes de guardar el estado del AFCA'.]
	ifNotNil: [
	answer := gui request: '¿Cuál es el nombre del archivo del AFCA?' initialAnswer: 'afca.txt' .
	(answer = '' or: answer isNil) ifFalse: [
		answer := 'datos\',answer.
		archivo := answer asFileReference writeStream.
		"Escribimos los registros en el archivo. Están separados por espacios en blanco
		Orden:
		ax bx cx dx programCounter b1 b2 b3 b4 busDatos carry sign zero interrupt mar mbr
		instructionRegister
		datos: 1 por línea.
		código: 1 instrucción por línea
		Las instrucciones van a tener el formato:
		instruccionCode destinoCode fuenteCode cuartoDato"
		flags := busDatos flags.
		alu := busDatos alu.
		memory := busDatos memory .
		content := (ax complete asString),' ',(bx complete asString),' ',(cx complete asString),' ',(dx complete asString),' ',(programCounter complete asString),' ',( alu b1 complete asString),' ',(alu b2 complete asString),' ',(alu b3 complete asString),' ',(alu b4 complete asString),' ',(busDatos temporary complete asString),' ',(flags carry asString),' ',(flags sign asString),' ',(flags zero asString),' ',(flags interrupt asString),' ',(memory mar complete asString),' ',(memory mbr complete asString),(Character cr asString), (Character lf asString).
		instruction := instructionRegister instruction.
		content := content,(instruction instruccion asString),' ',(instruction destino asString),' ',(instruction fuente asString),' ',(instruction cuartodato asString),(Character cr asString), (Character lf asString).
		
		data := memory data.
		code := memory code.
		
		"Escribimos el segmento de datos"
		1 to: data size do:
		[:index |
		content := content,((data at: index) asString),(Character cr asString), (Character lf asString).].
		
		"Escribimos el segmento de codigo"
		1 to: code size do: [:index | | instructionStr |
			instruction := code at: index.
			instruction ifNil: [content := content,'nil',(Character cr asString), (Character lf asString).]
			ifNotNil: [
			instructionStr := (instruction instruccion asString),' ',(instruction destino asString),' ',(instruction fuente asString),' ',(instruction cuartodato asString),(Character cr asString), (Character lf asString).
			content := content,instructionStr.].].
		
		"self resetAFCA.
		instructions := self openFile: answer.
		instructions ifNotNil: [ 
			1 to: instructions size do: [ :index | 
				|  instruction | 
				instruction := instructions at: index.
				self movinstructiontomem: instruction to: index.
			]."
		"lastInstruction := Instruction new initialize: 'stop' .
		self movinstructiontomem: lastInstruction to: ((instructions size) + 1)."
		archivo nextPutAll: content.
		archivo close.
		UIManager default inform: 'AFCA guardada en archivo'.
		]
	ifTrue: [UIManager default inform: 'El nombre no puede estar vacío.'.].
	].

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

{ #category : #flags }
ControlUnit >> stc [
	(busDatos flags) stc.
	self updateRegister: 'carry' secondParameter: (busDatos flags carry). 

]

{ #category : #accessing }
ControlUnit >> step [
	^ step.

]

{ #category : #accessing }
ControlUnit >> step: pStep [
	step := pStep .

]

{ #category : #microinstructions }
ControlUnit >> stepInstruction [
	step := true .
	self executeInstruction .
	step := false.

]

{ #category : #microinstructions }
ControlUnit >> stepInstruction: register [
	UIManager default confirm: (register, ' actualizado. Presione OK para continuar.').

]

{ #category : #accessing }
ControlUnit >> stepProgram [
	step := true .
	self executeProgram .

]

{ #category : #flags }
ControlUnit >> sti [
	(busDatos flags) sti.
	self updateRegister: 'interrupt' secondParameter: (busDatos flags interrupt). 

]

{ #category : #flags }
ControlUnit >> sts [
	(busDatos flags) sts.
	self updateRegister: 'sign' secondParameter: (busDatos flags sign). 

]

{ #category : #flags }
ControlUnit >> stz [
	(busDatos flags) stz.
	self updateRegister: 'zero' secondParameter: (busDatos flags zero). 

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
ControlUnit >> transformOperand: operand data: dato [
	| result |
	(operand = 'inm')
			ifTrue: [result := dato]
			ifFalse: [
				((operand first) = $[)
					ifTrue: [((operand second) = $b)
						ifTrue: [result := (operand allButFirst allButLast) ]
						ifFalse: [result := dato]
						]
					ifFalse: [result := operand].
				].
	^ result.

]

{ #category : #gui }
ControlUnit >> updateRegister: register [
	| regUpdate reg value |
	reg := (((register name) = 'al') or: ((register name) = 'ah'))
					ifTrue: [ax]
					ifFalse: [
					(((register name) = 'bl') or: ((register name) = 'bh'))
					ifTrue: [bx]	
					ifFalse: [
					(((register name) = 'cl') or: ((register name) = 'ch'))
					ifTrue: [cx]
					ifFalse: [
					(((register name) = 'dl') or: ((register name) = 'dh'))
					ifTrue: [dx]
					ifFalse:	[register].
						].
					].
				].
	regUpdate := reg name.
	value := reg complete .
	
	"Actualiza la interfaz grafica"
	regUpdate = 'ax' ifTrue: [
		axvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'ax'].
		^ value ].
	regUpdate = 'bx' ifTrue: [
		bxvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'bx'].
		^ value ].
	regUpdate = 'cx' ifTrue: [
		cxvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'cx'].
		^ value ].
	regUpdate = 'dx' ifTrue: [
		dxvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'dx'].
		^ value ].
	regUpdate = 'b1' ifTrue: [
		b1value contents: value asString.
		step ifTrue: [self stepInstruction: 'b1'].
		^ value ].
	regUpdate = 'b2' ifTrue: [
		b2value contents: value asString.
		step ifTrue: [self stepInstruction: 'b2'].
		^ value ].
	regUpdate = 'b3' ifTrue: [
		b3value contents: value asString.
		step ifTrue: [self stepInstruction: 'b3'].
		^ value ].
	regUpdate = 'b4' ifTrue: [
		b4value contents: value asString.
		step ifTrue: [self stepInstruction: 'b4'].
		^ value ].
	regUpdate = 'ir' ifTrue: [
		value := instructionRegister instruction.
		irvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'ir'].
		^ value ].
	regUpdate = 'pc' ifTrue: [
		pcvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'pc'].
		^ value ].
	regUpdate = 'mar' ifTrue: [
		marvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'mar'].
		^ value ].
	regUpdate = 'mbr' ifTrue: [
		mbrvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'mbr'].
		^ value ].
	regUpdate = 'carry' ifTrue: [
		carryvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'carry flag'].
		^ value ].
	regUpdate = 'sign' ifTrue: [
		signvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'sign flag'].
		^ value ].
	regUpdate = 'zero' ifTrue: [
		zerovalue contents: value asString.
		step ifTrue: [self stepInstruction: 'zero flag'].
		^ value ].
	regUpdate = 'interrupt' ifTrue: [
		interruptvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'interrupt flag'].
		^ value ].
	regUpdate = 'bus' ifFalse: [ ^ self ].
	busvalue contents: value asString.
	step ifTrue: [self stepInstruction: 'bus'].
	^ value

]

{ #category : #gui }
ControlUnit >> updateRegister: register secondParameter: value [
	"Actualiza la interfaz grafica"
	register = 'ax' ifTrue: [
		axvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'ax'].
		^ value ].
	register = 'bx' ifTrue: [
		bxvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'bx'].
		^ value ].
	register = 'cx' ifTrue: [
		cxvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'cx'].
		^ value ].
	register = 'dx' ifTrue: [
		dxvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'dx'].
		^ value ].
	register = 'b1' ifTrue: [
		b1value contents: value asString.
		step ifTrue: [self stepInstruction: 'b1'].
		^ value ].
	register = 'b2' ifTrue: [
		b2value contents: value asString.
		step ifTrue: [self stepInstruction: 'b2'].
		^ value ].
	register = 'b3' ifTrue: [
		b3value contents: value asString.
		step ifTrue: [self stepInstruction: 'b3'].
		^ value ].
	register = 'b4' ifTrue: [
		b4value contents: value asString.
		step ifTrue: [self stepInstruction: 'b4'].
		^ value ].
	register = 'ir' ifTrue: [
		irvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'ir'].
		^ value ].
	register = 'pc' ifTrue: [
		pcvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'pc'].
		^ value ].
	register = 'mar' ifTrue: [
		marvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'mar'].
		^ value ].
	register = 'mbr' ifTrue: [
		mbrvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'mbr'].
		^ value ].
	register = 'carry' ifTrue: [
		carryvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'carry flag'].
		^ value ].
	register = 'sign' ifTrue: [
		signvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'sign flag'].
		^ value ].
	register = 'zero' ifTrue: [
		zerovalue contents: value asString.
		step ifTrue: [self stepInstruction: 'zero flag'].
		^ value ].
	register = 'interrupt' ifTrue: [
		interruptvalue contents: value asString.
		step ifTrue: [self stepInstruction: 'interrupt flag'].
		^ value ].
	register = 'bus' ifFalse: [ ^ self ].
	busvalue contents: value asString.
	step ifTrue: [self stepInstruction: 'bus'].
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
