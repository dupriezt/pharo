Class {
	#name : #RBRenamePackageRefactoring,
	#superclass : #RBPackageRefactoring,
	#instVars : [
		'package',
		'newName'
	],
	#category : #'Refactoring-Core-Refactorings'
}

{ #category : #'instance creation' }
RBRenamePackageRefactoring class >> model: aRBSmalltalk rename: aPkg to: aNewName [ 
	^(self new)
		model: aRBSmalltalk;
		packageName: aPkg name newName: aNewName;
		yourself
]

{ #category : #'instance creation' }
RBRenamePackageRefactoring class >> rename: aClass to: aNewName [
	^self new packageName: aClass name newName: aNewName
]

{ #category : #transforming }
RBRenamePackageRefactoring >> manifestClassNameFor: aPackageName [
	"Returns a symbol representing a suitable name for a Manifest class for the given package"
	
	^('Manifest', (aPackageName select: [:each | each isAlphaNumeric ])) asSymbol
]

{ #category : #initialization }
RBRenamePackageRefactoring >> packageName: aName newName: aNewName [ 
	packageName := aName asSymbol.
	package := self model packageNamed: packageName.
	newName := aNewName asSymbol
]

{ #category : #preconditions }
RBRenamePackageRefactoring >> preconditions [ 
	^ (RBCondition withBlock: [ newName = package name ifTrue: 
		[ self refactoringError: 'Use a different name' ].
		true ]) &
	(RBCondition withBlock: [ [RPackage organizer validatePackageDoesNotExist: newName. true]
			on: Error 
			do: [ :e | self refactoringError: e messageText ]
		])
	
]

{ #category : #transforming }
RBRenamePackageRefactoring >> renameManifestClass [ 
	|refactoring manifest|
	manifest := package realPackage packageManifestOrNil.
	manifest ifNotNil: [
	refactoring := RBRenameClassRefactoring 
		model: self model
		rename: manifest
		to: (self manifestClassNameFor: newName).
	self performCompositeRefactoring: refactoring]
]

{ #category : #transforming }
RBRenamePackageRefactoring >> renamePackage [
	self model renamePackage: package to: newName
]

{ #category : #printing }
RBRenamePackageRefactoring >> storeOn: aStream [ 
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' rename: '.
	aStream nextPutAll: package name.
	aStream
		nextPutAll: ' to: #';
		nextPutAll: newName;
		nextPut: $)
]

{ #category : #transforming }
RBRenamePackageRefactoring >> transform [

	self renamePackage.
	self renameManifestClass.
]
