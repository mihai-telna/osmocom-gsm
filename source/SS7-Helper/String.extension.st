Extension { #name : #String }

{ #category : #'*SS7-Helper' }
String >> fromTBCD [
	^GSMNumberDigits decodeFrom: (ByteArray readHexFrom: self).
]

{ #category : #'*SS7-Helper' }
String >> toE164 [
	^(#(16r91) , (GSMNumberDigits encodeFrom: self)) asByteArray hex
]

{ #category : #'*SS7-Helper' }
String >> toTBCD [
	^(GSMNumberDigits encodeFrom: self) hex
]
