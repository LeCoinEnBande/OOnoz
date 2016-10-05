helpers
defaultServerLaunching
	<script>
	OOServer setConfigurationWith: OOConfiguration new.
	ZnZincServerAdaptor startOn: OOServer current configuration port.
	self useInImageDebugger