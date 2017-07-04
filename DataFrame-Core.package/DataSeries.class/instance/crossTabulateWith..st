as yet unclassified
crossTabulateWith: aSeries

	| df |
	
	(self size = aSeries size)
		ifFalse: [ SizeMismatch signal ].
	
	"TODO: Rewrite it with DataFrame>>select:"
	df := DataFrame rows: 
		(self unique collect: [ :each1 |
			aSeries unique collect: [ :each2 |
				(1 to: self size) inject: 0 into: [ :accum :i |
					(((self at: i) = each1) and: ((aSeries at: i) = each2))
						ifTrue: [ accum + 1 ]
						ifFalse: [ accum ] ] ] ]).
		
	df rowNames: self unique.
	df columnNames: aSeries unique.
	^ df