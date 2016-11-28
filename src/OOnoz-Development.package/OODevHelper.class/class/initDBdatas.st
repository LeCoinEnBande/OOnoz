db
initDBdatas
	<script>
	(STON
		fromString:
			(OOServer current configuration resourcesDirectory / 'Datas'
				/ 'datas.ston') contents) do: [ :set | set do: #save ]