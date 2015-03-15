"
I know funky rules of which characters to remove
"
Class {
	#name : #GSMUSSDDecoding,
	#superclass : #GSMDecoding,
	#category : #'OsmoGSM-Coding'
}

{ #category : #'as yet unclassified' }
GSMUSSDDecoding class >> handleBytes: bytes from: bits [
        ((bytes last = Character cr asciiValue) and: [(bits size \\ 7) = 0])
            ifTrue:  [ ^ bytes allButLast asString ]
            ifFalse: [ ^ super handleBytes: bytes from: bits ].
]
