"
I model super variables
"
Class {
	#name : #OCSuperVariable,
	#superclass : #OCSpecialVariable,
	#category : #'Deprecated90-OpalCompiler-Core'
}

{ #category : #emitting }
OCSuperVariable >> emitValue: methodBuilder [
	"super references the receiver, send that follows is a super send (the message lookup starts in the superclass)"
	methodBuilder pushReceiver
]

{ #category : #initialization }
OCSuperVariable >> initialize [
	super initialize.
	
	name := 'super'
]

{ #category : #generated }
OCSuperVariable >> isSuper [

	self
		deprecated: 'Use #isSuperVariable instead'
		transformWith: '`@rec isSuper' -> '`@rec isSuperVariable'.
	^ self isSuperVariable
]

{ #category : #debugging }
OCSuperVariable >> readInContext: aContext [
	^aContext receiver
]
