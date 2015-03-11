"
I represent table 10.5.118 continued
"
Class {
	#name : #GSMNumberDigits,
	#superclass : #Object,
	#classInstVars : [
		'digitMap',
		'reverseMap'
	],
	#category : #OsmoGSM
}

{ #category : #decoding }
GSMNumberDigits class >> decodeFrom: anArray [
	^self decodeFromStream: anArray readStream

]

{ #category : #decoding }
GSMNumberDigits class >> decodeFromStream: aStream [
	| str |
	str := WriteStream on: String new.
	[aStream atEnd] whileFalse: 
		[| in tmp char |
		in := aStream next.
		tmp := in bitAnd: 16r0F.
		char := self mapDigit: tmp.
		char = $Z ifFalse: [str nextPut: char].

		tmp := (in bitAnd: 16rF0) bitShift: -4.
		char := self mapDigit: tmp.
		char = $Z ifFalse: [str nextPut: char]].
	^str contents

]

{ #category : #'as yet unclassified' }
GSMNumberDigits class >> digitMap [
	^digitMap ifNil: 
		[digitMap := Dictionary new.
		1 to: 10 do: [:each | digitMap at: each put: (each + 48 - 1) asCharacter].
		digitMap at: 11 put: $*.
		digitMap at: 12 put: $#.
		digitMap at: 13 put: $a.
		digitMap at: 14 put: $b.
		digitMap at: 15 put: $c.
		digitMap at: 16 put: $Z.
		digitMap yourself]

]

{ #category : #'as yet unclassified' }
GSMNumberDigits class >> digitMap: aDigit [
	^self reverseMap at: aDigit

]

{ #category : #encoding }
GSMNumberDigits class >> encodeData: aNumber on: aStr [
	| digits |
	digits := OrderedCollection new.
	aNumber do: [:digit | digits add: (self digitMap: digit)].
	digits size odd ifTrue: [digits add: 16rF].

	"Create the binary structure"
	1 to: digits size
	    by: 2
	    do: 
		[:each | 
		| low high |
		low := digits at: each.
		high := digits at: each + 1.
		aStr nextPut: (low bitOr: (high bitShift: 4))]

]

{ #category : #encoding }
GSMNumberDigits class >> encodeFrom: aNumber [
	| str |
	str := WriteStream on: ByteArray new.
	self encodeData: aNumber on: str.
	^str contents

]

{ #category : #'as yet unclassified' }
GSMNumberDigits class >> mapDigit: aBinary [
	^self digitMap at: aBinary asInteger + 1

]

{ #category : #'as yet unclassified' }
GSMNumberDigits class >> reverseMap [
	^reverseMap ifNil: 
		[reverseMap := Dictionary new.
		self digitMap 
		    associationsDo: [:each | reverseMap at: each value put: each key - 1].
		reverseMap yourself]

]
