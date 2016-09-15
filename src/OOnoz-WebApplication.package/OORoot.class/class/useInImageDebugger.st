helpers
useInImageDebugger
	"Because it's a pain in the ass to always set it by hand in Seaside settings."

	<script>
	WAApplication allInstancesDo: [ :app | app exceptionHandler: WADebugErrorHandler ]