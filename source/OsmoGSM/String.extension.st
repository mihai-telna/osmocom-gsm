Extension { #name : #String }

{ #category : #'*OsmoGSM-coding' }
String >> asGSM7Bit [
	"I convert a string into a 7bit encoded string. I should
	 also be in UnicodeString but I am not. This impl. is just
	 basic and does not deal with difficult bits."
	^GSMEncoding encode: self

]

{ #category : #'*OsmoGSM-coding' }
String >> asUSSD7Bit [
        "I convert a string into a 7bit encoded string. I know about
        padding rules for USSD messages."
        ^GSMUSSDEncoding encode: self.
]
