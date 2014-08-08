Extension { #name : #Number }

{ #category : #'*SS7-Helper' }
Number >> toE164 [
	^ self asByteArray toE164
]
