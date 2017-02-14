db
launchRealVoyageBackEnd
	<script>
	| repository |
	repository := VOMongoRepository host: 'ds159188.mlab.com' port: 59188 database: 'pepit' username: 'pepit2' password: 'OOnozProject1'.
	repository enableSingleton.
	^ repository