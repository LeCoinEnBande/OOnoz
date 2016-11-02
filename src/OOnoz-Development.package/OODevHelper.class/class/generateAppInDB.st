helpers
generateAppInDB
	<script>
	| app |
	app := OOApp new.
	app themes: (OOInstancesGenerator generateThemes).
	app save