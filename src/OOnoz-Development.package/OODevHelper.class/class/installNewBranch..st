helpers
installNewBranch: branchName
	Metacello new
		githubUser: 'LeCoinEnBande'
			project: 'OOnoz'
			commitish: branchName
			path: 'src';
		baseline: 'OOnoz';
		onWarningLog;
		get;
		load