accessing
filter: aCollectionOfMCQ
	^ self blockFilters inject: aCollectionOfMCQ into: [ :res :filter | filter value: res ]