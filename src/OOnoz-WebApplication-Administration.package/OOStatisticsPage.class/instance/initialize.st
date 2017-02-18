initialization
initialize
	super initialize.
	self charts: (OOAbstractStatChartComponent allSubclasses collect: [ :c | c owner: self ])