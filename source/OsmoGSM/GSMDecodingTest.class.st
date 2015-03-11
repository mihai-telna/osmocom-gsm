Class {
	#name : #GSMDecodingTest,
	#superclass : #TestCase,
	#category : #'OsmoGSM-Tests'
}

{ #category : #'as yet unclassified' }
GSMDecodingTest >> test7BitDecode [
	| wanted res |
	wanted := 'Your remaining balance is:1704 min,expiring on:10-07-2010'.
	res := #[217 119 93 14 146 151 219 225 180 59 237 62 131 196 97 118 216 61 46 131 210 115 93 236 6 163 129 218 105 55 171 140 135 167 229 105 247 25 244 118 235 98 176 22 236 214 146 193 98 48] 
		    decodeGSM7Bit.
	self assert: res = wanted

]

{ #category : #'as yet unclassified' }
GSMDecodingTest >> testExpand [
	| wanted res |
	wanted := 'Your remaining balance is:1704 min,expiring on:10-07-2010' asByteArray.
	res := GSMDecoding expand: #[217 119 93 14 146 151 219 225 180 59 237 62 131 196 97 118 216 61 46 131 210 115 93 236 6 163 129 218 105 55 171 140 135 167 229 105 247 25 244 118 235 98 176 22 236 214 146 193 98 48].
	self assert: res equals: wanted

]
