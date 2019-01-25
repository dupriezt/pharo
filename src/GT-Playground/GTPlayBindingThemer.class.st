Class {
	#name : #GTPlayBindingThemer,
	#superclass : #GLMBrickThemerModule,
	#category : #'GT-Playground'
}

{ #category : #rows }
GTPlayBindingThemer >> borderColor [

	^ Smalltalk ui theme borderColor
]

{ #category : #rows }
GTPlayBindingThemer >> borderWidth [

	^ 1
]

{ #category : #'empty-text' }
GTPlayBindingThemer >> emptyTextColor [

	^ Smalltalk ui theme glamourLightTextColor 
]

{ #category : #'empty-text' }
GTPlayBindingThemer >> emptyTextFontSize [

	^ Smalltalk ui theme textFont pointSize
]

{ #category : #'empty-text' }
GTPlayBindingThemer >> emptyTextPadding [

	^ 15
]

{ #category : #icons }
GTPlayBindingThemer >> goIcon [

	^ GLMUIThemeExtraIcons glamorousGo
]

{ #category : #icons }
GTPlayBindingThemer >> inspectIcon [

	^ GLMUIThemeExtraIcons glamorousInspect
]

{ #category : #rows }
GTPlayBindingThemer >> padding [

	^ 5
]

{ #category : #icons }
GTPlayBindingThemer >> removeIcon [

	^ GLMUIThemeExtraIcons glamorousRemove
]

{ #category : #rows }
GTPlayBindingThemer >> selectedColor [

	^ Color veryVeryLightGray alpha: 0.5
]
