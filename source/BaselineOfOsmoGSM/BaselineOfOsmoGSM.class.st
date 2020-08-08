Class {
	#name : #BaselineOfOsmoGSM,
	#superclass : #BaselineOf,
	#category : #BaselineOfOsmoGSM
}

{ #category : #baselines }
BaselineOfOsmoGSM >> baseline: spec [
	<baseline>

	spec
		package: 'OsmoGSM';
		package: 'SS7-Helper'.
]
