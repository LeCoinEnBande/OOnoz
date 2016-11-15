helpers
initPlayground
	<script>
	GTPlayground
		openContents:
			'| branch |
branch := ''development''.

OODevHelper 
	installGitFileTree;
	installNewBranch: branch;
	setupMemoryDB;
	defaultServerLaunching.'