as yet unclassified
mongoWinningStrategy
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'winningStrategy';
		accessor:
			(MAPluggableAccessor
				read: [ :gift | 
					gift winningStrategy copy
						gift: nil;
						yourself ]
				write: [ :gift :strat | 
					gift
						winningStrategy:
							(strat
								gift: gift;
								yourself) ]);
		yourself