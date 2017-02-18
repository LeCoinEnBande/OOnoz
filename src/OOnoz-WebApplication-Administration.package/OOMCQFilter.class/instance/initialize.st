initialization
initialize
	super initialize.
	self
		keepChallenges: true;
		keepELearning: true;
		levels: (1 to: 5);
		keepInactives: true;
		keepActives: true