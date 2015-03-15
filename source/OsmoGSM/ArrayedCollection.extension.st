Extension { #name : #ArrayedCollection }

{ #category : #'*OsmoGSM-Coding' }
ArrayedCollection >> decodeGSM7Bit [
	^GSMDecoding decode: self

]

{ #category : #'*OsmoGSM-Coding' }
ArrayedCollection >> decodeUSSD7Bit [
	^GSMUSSDDecoding decode: self
]
