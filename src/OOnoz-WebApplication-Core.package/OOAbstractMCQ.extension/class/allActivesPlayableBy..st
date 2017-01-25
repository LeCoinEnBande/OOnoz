*OOnoz-WebApplication-Core
allActivesPlayableBy: aUser
	self flag: #todo.	"When the active/inactive mcqs will be implemented we need to change this method."
	^ self allActives reject: [ :mcq | (OOMCQResult selectOne: [ :res | res mcq = mcq and: [ res user = aUser ] ]) isNotNil ]