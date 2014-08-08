Extension { #name : #ByteString }

{ #category : #'*SS7-Helper' }
ByteString >> toE164 [
	^(#(16r91) , (GSMNumberDigits encodeFrom: self)) asByteArray
]

{ #category : #'*SS7-Helper' }
ByteString >> toTBCD [
	^ GSMNumberDigits encodeFrom: self
]
