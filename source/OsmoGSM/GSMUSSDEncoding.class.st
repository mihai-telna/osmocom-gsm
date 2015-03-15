"
I know the funky stuff for USSD encoding/padding
"
Class {
	#name : #GSMUSSDEncoding,
	#superclass : #GSMEncoding,
	#category : #'OsmoGSM-Coding'
}

{ #category : #'as yet unclassified' }
GSMUSSDEncoding class >> padBits: bits on: aString [
        | rest nl |

        "Check if we are on a byte boundary and a CR."
        ((aString last = Character cr) and: [(bits size \\ 8) = 0]) ifTrue: [ | cr |
            cr := Character cr value.
            1 to: 7 do: [:each | bits add: (cr bitAt: each) ].
            bits add: 0.
            ^ self
        ].

        "Check if we need to handle this, if not continue."
        aString size \\ 8 = 7
            ifFalse: [^ super padBits: bits on: aString].

        "Now add the padding."
        rest := 8 - (bits size \\ 8).
        rest = 7 ifFalse: [^self error: ('The rest should be 7 bits but were <1p>' expandMacrosWith:  rest)].

        nl := Character cr asciiValue.
        1 to: 7 do: [:each | bits add: (nl bitAt: each)].
]
