db
launchRealVoyageBackEnd
	<script>
	| repository |
	repository := VOMongoRepository host: 'mongodb-jecisc.alwaysdata.net' database: 'jecisc_pepit' username: 'jecisc_pepit' password: 'OOnozProject1'.
	repository enableSingleton.
	^ repository