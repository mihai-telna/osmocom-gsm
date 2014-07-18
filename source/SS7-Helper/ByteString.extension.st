Extension { #name : #ByteString }

{ #category : #'*SS7-Helper' }
ByteString >> fromE164 [
	^GSMNumberDigits decodeFrom: (ByteArray readHexFrom: self) allButFirst.
]
