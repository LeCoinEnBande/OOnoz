helpers
generateUserWithMCQsInDB
	<script>
	| user |
	user := OOUser new.
	user mcqs: (OOInstancesGenerator generateMCQsUpTo: 30).
	user mcqs do: #save.
	user save