tests
testNumericIndexChain

	self shouldnt: [
		DataFrame new
			columnsAt: #(2 4 1 3);
    		rowsFrom: 1 to: 100.
	] raise: MessageNotUnderstood.