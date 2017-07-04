instance creation
newFrom: aDictOrCollection
	
	| df |
	
	((aDictOrCollection isKindOf: Dictionary) or: 
	 (aDictOrCollection isKindOf: OrderedDictionary))
		ifTrue: [ ^ super newFrom: aDictOrCollection ].
		
	df := self new.
	
	aDictOrCollection do: [ :series |
		df at: series name put: series ].
	
	df columnNames: (df at: (df keyAtIndex: 1)) keys.
	
	^ df
		
	