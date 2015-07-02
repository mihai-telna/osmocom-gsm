"
I help to encode/decode various address infos
"
Class {
	#name : #GSMAddressCoding,
	#superclass : #Object,
	#category : #'OsmoGSM-Address'
}

{ #category : #'as yet unclassified' }
GSMAddressCoding class >> decodeSMSAddress: aStream [
	| len byteLen tmp ton npi data |
	len := aStream next.
	tmp := aStream next.
	ton := (tmp bitShift: -4) bitAnd: 2r111.
	npi := (tmp bitAnd: 2r1111).

	byteLen := ((len + 1) / 2) asInteger.
	data := aStream next: byteLen.
	data size = byteLen
		ifFalse: [^self error: 'Short Read on Pharo'].

	ton = GSMAddress tonAlphanumeric ifTrue: [
		| addr |
		addr := GSMUSSDDecoding decode: data.
		^GSMAddress new
			typeOfNumber: ton;
			numberingPlan: npi;
			address: addr;
			yourself.
	].
	^GSMAddress new
		typeOfNumber: ton;
		numberingPlan: npi;
		address: (GSMNumberDigits decodeFrom: data);
		yourself.
]

{ #category : #'as yet unclassified' }
GSMAddressCoding class >> encodeSMSAddress: anAddress [
	^ByteArray streamContents: [:stream |
		stream
			nextPut: anAddress address size;
			nextPut: (2r10000000 bitOr: ((anAddress typeOfNumber bitShift: 4) bitOr: (anAddress numberingPlan bitAnd: 2r1111)));
			nextPutAll: (GSMNumberDigits encodeFrom: anAddress address)
	]
]

{ #category : #'as yet unclassified' }
GSMAddressCoding class >> encodeSMSAlphanumericAddress: anAddress [
	^ByteArray streamContents: [:stream |
		| data len |
		data := anAddress address asUSSD7Bit.
		len := data size * 2.
		anAddress address size odd ifTrue: [
			len := len - 1].


		stream
			nextPut: len;
			nextPut: (2r10000000 bitOr: ((anAddress typeOfNumber bitShift: 4) bitOr: (anAddress numberingPlan bitAnd: 2r1111)));
			nextPutAll: data
	]
]
