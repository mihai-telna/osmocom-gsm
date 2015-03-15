"
A GSMAddressCodingTest is a test class for testing the behavior of GSMAddressCoding
"
Class {
	#name : #GSMAddressCodingTest,
	#superclass : #TestCase,
	#category : #'OsmoGSM-Tests'
}

{ #category : #'as yet unclassified' }
GSMAddressCodingTest >> testAlphanumericDecoding [
	| res |
	res := GSMAddressCoding decodeSMSAddress: #[16r0d 16rd0 16rf3 16r34 16rfc 16r1c 16ra6 16r97 16r1b] readStream.
	self assert: res typeOfNumber equals: GSMAddress tonAlphanumeric.
	self assert: res numberingPlan equals: 0.
	self assert: res address equals: 'sipgate'.
]

{ #category : #'as yet unclassified' }
GSMAddressCodingTest >> testAlphanumericEncoding [
	| addr |
	addr := GSMAddress new
				typeOfNumber: GSMAddress tonAlphanumeric;
				numberingPlan: 0;
				address: 'sipgate';
				yourself.
	self assert: (addr encodeSMSAddress) equals: #[16r0d 16rd0 16rf3 16r34 16rfc 16r1c 16ra6 16r97 16r1b].
]

{ #category : #'as yet unclassified' }
GSMAddressCodingTest >> testNormalDecoding [
	| res |
	res := GSMAddressCoding decodeSMSAddress: #[12 145 83 52 88 0 16 145] readStream.
	self assert: res typeOfNumber equals: GSMAddress tonInternational.
	self assert: res numberingPlan equals: GSMAddress npISDN.
	self assert: res address equals: '354385000119'.
]

{ #category : #'as yet unclassified' }
GSMAddressCodingTest >> testNormalEncoding [
	| addr |
	addr := GSMAddress new
				typeOfNumber: GSMAddress tonInternational ;
				numberingPlan: GSMAddress npISDN;
				address: '354385000119';
				yourself.
	self assert: (addr encodeSMSAddress) equals: #[12 145 83 52 88 0 16 145].
]
