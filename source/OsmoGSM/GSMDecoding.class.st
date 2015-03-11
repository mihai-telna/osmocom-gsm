"
I am the base class for GSM Decoding as of GSM 03.38. I
can be subclassed to deal with specifics for USSD and other systems.
"
Class {
	#name : #GSMDecoding,
	#superclass : #Object,
	#category : #'OsmoGSM-Coding'
}

{ #category : #'as yet unclassified' }
GSMDecoding class >> convertFromBytes: aByteArray [
	"We convert the stream into single bits. It is the
	 easiest to do it like this."

	| bits |
	bits := OrderedCollection new.
	aByteArray do: [:each | 1 to: 8 do: [:pos | bits add: (each bitAt: pos)]].
	^bits

]

{ #category : #'as yet unclassified' }
GSMDecoding class >> convertToBytes: bits [
	| bytes |
	bytes := ByteArray new: bits size // 7.
	1 to: bits size
	    by: 7
	    do: 
		[:pos | 
		pos + 6 <= bits size 
		    ifTrue: 
			[| byte |
			byte := 0.
			byte := (byte bitShift: 1) bitOr: (bits at: pos + 6).
			byte := (byte bitShift: 1) bitOr: (bits at: pos + 5).
			byte := (byte bitShift: 1) bitOr: (bits at: pos + 4).
			byte := (byte bitShift: 1) bitOr: (bits at: pos + 3).
			byte := (byte bitShift: 1) bitOr: (bits at: pos + 2).
			byte := (byte bitShift: 1) bitOr: (bits at: pos + 1).
			byte := (byte bitShift: 1) bitOr: (bits at: pos + 0).
			bytes at: pos // 7 + 1 put: byte]].
	^bytes

]

{ #category : #'as yet unclassified' }
GSMDecoding class >> decode: aByteArray [
	| bits bytes |
	bits := self convertFromBytes: aByteArray.
	bytes := self convertToBytes: bits.
	^self handleBytes: bytes from: bits

]

{ #category : #'as yet unclassified' }
GSMDecoding class >> expand: aByteArray [
	"Expand a packed bytearray to one 7bit character per byte"
	^self convertToBytes: (self convertFromBytes: aByteArray)

]

{ #category : #'as yet unclassified' }
GSMDecoding class >> handleBytes: bytes from: bits [
	^bytes asString

]
