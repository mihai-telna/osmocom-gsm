Extension { #name : #DateAndTime }

{ #category : #'*OsmoGSM-Coding' }
DateAndTime >> asGSMSCTS [
	"Semi octets.. while something like time_t would have fit.."
	| timeString |
	timeString := String streamContents: [:str |
		str
			nextPutAll: ((self year asString last: 2) padLeftTo: 2 with: $0);
			nextPutAll: (self month asString padLeftTo: 2 with: $0);
			nextPutAll: (self dayOfMonth asString padLeftTo: 2 with: $0);
			nextPutAll: (self hour asString padLeftTo: 2 with: $0);
			nextPutAll: (self minute asString padLeftTo: 2 with: $0);
			nextPutAll: (self second asString padLeftTo: 2 with: $0);
			nextPutAll: '00'. "TODO.. assumes UTC time"
	].
	^GSMNumberDigits encodeFrom: timeString readStream
]
