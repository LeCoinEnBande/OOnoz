helpers
launchInMemoryVoyageBackEnd
	<script>
	| repository |
	repository := VOMemoryRepository new.
	repository enableSingleton.
	^ repository