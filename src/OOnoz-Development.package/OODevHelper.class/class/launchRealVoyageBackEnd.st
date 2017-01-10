db
launchRealVoyageBackEnd
	<script>
	| repository |
	repository := VOMongoRepository host: 'mongodb-jecisc.alwaysdata.net' database: 'jecisc_oonoz' username: 'jecisc_pepit' password: 'OOnozProject1'.
	repository enableSingleton.
	^ repository