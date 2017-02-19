initialization
initialize
	super initialize.
	self
		mcqFilter:
			(OOMCQFilter
				refreshScript: [ :html | 
					(html jQuery: #'chart-stat') load
						html: [ :r | 
							self mcqInputCache: nil.
							self renderChartOn: r.
							self valuesCache: nil ] ])