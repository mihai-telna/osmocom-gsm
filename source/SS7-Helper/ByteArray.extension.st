Extension { #name : #ByteArray }

{ #category : #'*SS7-Helper' }
ByteArray >> fromE164 [
	^GSMNumberDigits decodeFrom: self allButFirst
]

{ #category : #'*SS7-Helper' }
ByteArray >> fromTBCD [
	^GSMNumberDigits decodeFrom: self asByteArray
]
