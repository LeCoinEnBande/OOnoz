accessing - parameters
resourcesDirectoryPath
	"I am a string representing the path of the directory where the static resources of the application should be store. The path should be relative to the directory."

	^ self parameters at: 'resourcesDirectoryPath' ifAbsentPut: '../../GitRepositories/OOnoz/resources'