Class {
	#name : #GSMSCTSCodingTest,
	#superclass : #TestCase,
	#category : #'OsmoGSM-Tests'
}

{ #category : #'as yet unclassified' }
GSMSCTSCodingTest >> testSCTSEncoding [
	| dateAndTime res |
	dateAndTime := DateAndTime
						year: 2014 month: 11 day: 26
						hour: 7 minute: 0 second: 8.
	res := dateAndTime asGSMSCTS.
	self assert: res size equals: 7.
	self assert: res equals: #[16r41 16r11 16r62 16r70 16r00 16r80 16r00].
]
