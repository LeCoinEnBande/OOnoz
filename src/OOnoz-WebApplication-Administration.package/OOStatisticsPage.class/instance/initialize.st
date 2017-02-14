initialization
initialize
	super initialize.
	self charts: (OOAbstractStatChartComponent allSubclasses collect: #new).
	self selectedChart: self charts anyOne