"
A GSMUSSDDecodingTest is a test class for testing the behavior of GSMUSSDDecoding
"
Class {
	#name : #GSMUSSDDecodingTest,
	#superclass : #TestCase,
	#category : #'OsmoGSM-Tests'
}

{ #category : #'as yet unclassified' }
GSMUSSDDecodingTest >> testUSSDDecode [
        | wanted |

        wanted := '123456789012345'.
        self assert: #[49 217 140 86 179 221 112 57 88 76 54 163 213 26] decodeUSSD7Bit equals: wanted.

]
