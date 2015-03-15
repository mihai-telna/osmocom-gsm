"
A GSMUSSDEncodingTest is a test class for testing the behavior of GSMUSSDEncoding
"
Class {
	#name : #GSMUSSDEncodingTest,
	#superclass : #TestCase,
	#category : #'OsmoGSM-Tests'
}

{ #category : #'as yet unclassified' }
GSMUSSDEncodingTest >> testEncode [
        | wanted |

        wanted := #[49 217 140 86 179 221 112 57 88 76 54 163 213 26].
        self assert: '123456789012345' asUSSD7Bit equals: wanted.
]
