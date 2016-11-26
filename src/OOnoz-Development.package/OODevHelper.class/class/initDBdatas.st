db
initDBdatas
	<script>
	(STON
		fromString:
			(FileSystem workingDirectory / '..' / '..' / 'GitRepositories' / 'OOnoz' / 'Resources'
				/ 'Datas' / 'datas.ston') contents) do: [ :set | set do: #save ]