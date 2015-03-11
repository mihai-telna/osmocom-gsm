"
I test the classic 7bit GSM encoding
"
Class {
	#name : #GSMEncodingTest,
	#superclass : #TestCase,
	#category : #'OsmoGSM-Tests'
}

{ #category : #'as yet unclassified' }
GSMEncodingTest >> test7BitEncode [
	| wanted res |
	wanted := #(16rD9 16r77 16r5D 16r0E 16r92 16r97 16rDB 16rE1 16rB4 16r3B 16rED 16r3E 16r83 16rC4 16r61 16r76 16rD8 16r3D 16r2E 16r83 16rD2 16r73 16r5D 16rEC 16r06 16rA3 16r81 16rDA 16r69 16r37 16rAB 16r8C 16r87 16rA7 16rE5 16r69 16rF7 16r19 16rF4 16r76 16rEB 16r62 16rB0 16r16 16rEC 16rD6 16r92 16rC1 16r62 16r30) 
		    asByteArray.
	res := 'Your remaining balance is:1704 min,expiring on:10-07-2010' 
		    asGSM7Bit.
	self assert: res = wanted

]

{ #category : #'as yet unclassified' }
GSMEncodingTest >> test7BitEncodeNoPadding [
	| input encoded |
	input := #[5 0 3 168 2 1 0 113 119 101 114 116 121 117 105 111 112 63 97 115 100 102 103 104 106 107 108 63 63 122 120 99 118 98 110 109 81 87 69 82 84 89 85 73 79 80 63 65 83 68 70 71 72 74 75 76 63 63 90 88 67 86 66 78 77 49 50 51 52 53 54 55 56 57 48 113 119 101 114 116 121 117 105 111 112 63 97 115 100 102 103 104 106 107 108 63 63 122 120 99 118 98 110 109 49 50 51 52 53 54 55 56 57 48 81 87 69 82 84 89 85 73 79 80 63 65 83 68 70 71 72 74 75 76 63 63 90 88 67 86 66 78 77 49 50 51 52 53 54 55 56 57 48 113 119 101 114 116 121 117].
	self assert: input size equals: 160.

	encoded := GSMEncoding compact: input.
	self assert: encoded size equals: 140.
	
]
