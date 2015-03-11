Class {
	#name : #GSMNumberDigitsTest,
	#superclass : #TestCase,
	#category : #'OsmoGSM-Tests'
}

{ #category : #'as yet unclassified' }
GSMNumberDigitsTest >> testDecodeFrom [
	| number res |

	number :=  #[114 4 24 0 0 240 255 255].
	res := GSMNumberDigits decodeFrom: number.
	self assert: res equals: '27408100000'.

	number := #(73 132 50 23 120).
	res := GSMNumberDigits decodeFrom: number.
	self assert: res = '9448237187'.

	number := #(73 132 50 23 120 186 220 174).
	res := GSMNumberDigits decodeFrom: number.
	self assert: res = '9448237187*#abc*'.

	number := #(114 4 8 0 0 48 0 240).
	res := GSMNumberDigits decodeFrom: number.
	self assert: res = '274080000003000'.	
]

{ #category : #'as yet unclassified' }
GSMNumberDigitsTest >> testEncodeFrom [
	| res |
	res := GSMNumberDigits encodeFrom: '9448237187*#abc*'.
	self assert: res = #(73 132 50 23 120 186 220 174) asByteArray.

	res := GSMNumberDigits encodeFrom: '274080000003000'.
	self assert: res = #(114 4 8 0 0 48 0 240) asByteArray.

]
