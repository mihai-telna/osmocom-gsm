Extension { #name : #ASN1OctetStringValue }

{ #category : #'*SS7-Helper' }
ASN1OctetStringValue >> fromE164 [
	^GSMNumberDigits decodeFrom: contents allButFirst
]

{ #category : #'*SS7-Helper' }
ASN1OctetStringValue >> fromE212 [
	^GSMNumberDigits decodeFrom: self allButFirst
]

{ #category : #'*SS7-Helper' }
ASN1OctetStringValue >> fromTBCD [
	^GSMNumberDigits decodeFrom: self asByteArray
]
