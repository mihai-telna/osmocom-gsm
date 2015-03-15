Class {
	#name : #GSMAddress,
	#superclass : #Object,
	#instVars : [
		'typeOfNumber',
		'numberingPlan',
		'address'
	],
	#category : #'OsmoGSM-Address'
}

{ #category : #'as yet unclassified' }
GSMAddress class >> npISDN [
	^2r1
]

{ #category : #'as yet unclassified' }
GSMAddress class >> tonAlphanumeric [
	^2r101
]

{ #category : #'as yet unclassified' }
GSMAddress class >> tonInternational [
	^2r1
]

{ #category : #'as yet unclassified' }
GSMAddress >> address [
	^ address
]

{ #category : #'as yet unclassified' }
GSMAddress >> address: anAddress [
	address := anAddress
]

{ #category : #'as yet unclassified' }
GSMAddress >> encodeSMSAddress [
	"TODO.. Create address subclasses?"
	^typeOfNumber = self class tonAlphanumeric
		ifTrue: [GSMAddressCoding encodeSMSAlphanumericAddress: self]
		ifFalse: [GSMAddressCoding encodeSMSAddress: self]
]

{ #category : #'as yet unclassified' }
GSMAddress >> numberingPlan [
	^ numberingPlan
]

{ #category : #'as yet unclassified' }
GSMAddress >> numberingPlan: aNumberingPlan [
	numberingPlan := aNumberingPlan
]

{ #category : #'as yet unclassified' }
GSMAddress >> typeOfNumber [
	^ typeOfNumber
]

{ #category : #'as yet unclassified' }
GSMAddress >> typeOfNumber: aNumber [
	typeOfNumber := aNumber
]
