"
I am the base class for GSM Encoding as of GSM 03.38. I
can be subclassed to deal with specifics for USSD and other systems.
"
Class {
	#name : #GSMEncoding,
	#superclass : #Object,
	#category : #'OsmoGSM-Coding'
}

{ #category : #'as yet unclassified' }
GSMEncoding class >> compact: aByteArray [
	"Pack an array of bytes into 7bit. This is used for UDH handling
	the padding is done to the left in this case. Actually between the
	UDH and the actual payload. We simply pad to the left."
	| bits |
	bits := OrderedCollection new: aByteArray size * 7 // 8.

	"Split it into sevent bits"
	aByteArray do: [:val | 
		1 to: 7 do: [:digit | bits add: (val bitAt: digit)]].
	self padBits: bits on: nil.
	^self convertToBytes: bits
]

{ #category : #'as yet unclassified' }
GSMEncoding class >> convertToBits: aString [
	| bits |
	bits := OrderedCollection new: aString size * 7 // 8.

	"Split it into bits"
	aString do: 
		[:char | 
		| val |
		val := char codePoint.
		1 to: 7 do: [:digit | bits add: (val bitAt: digit)]].
	^bits

]

{ #category : #'as yet unclassified' }
GSMEncoding class >> convertToBytes: bits [
	| bytes |
	bytes := ByteArray new: bits size // 8.
	1 to: bits size
	    by: 8
	    do: 
		[:each | 
		| byte |
		byte := 0.
		byte := (byte bitShift: 1) bitOr: (bits at: each + 7).
		byte := (byte bitShift: 1) bitOr: (bits at: each + 6).
		byte := (byte bitShift: 1) bitOr: (bits at: each + 5).
		byte := (byte bitShift: 1) bitOr: (bits at: each + 4).
		byte := (byte bitShift: 1) bitOr: (bits at: each + 3).
		byte := (byte bitShift: 1) bitOr: (bits at: each + 2).
		byte := (byte bitShift: 1) bitOr: (bits at: each + 1).
		byte := (byte bitShift: 1) bitOr: (bits at: each + 0).
		bytes at: each // 8 + 1 put: byte].
	^bytes

]

{ #category : #'as yet unclassified' }
GSMEncoding class >> encode: aString [
	| bits |
	bits := self convertToBits: aString.
	self padBits: bits on: aString.
	^self convertToBytes: bits

]

{ #category : #'as yet unclassified' }
GSMEncoding class >> padBits: bits on: aString [
	"I have to make sure that bits can be divided by/8"

	| rest |
	rest := 8 - (bits size \\ 8).
	rest = 8 ifTrue: [^self].
	rest to: 1
	    by: -1
	    do: [:each | bits add: 0]
]
