# OOnoz


####TravisCI: Linux/OSX builds
Master: [![Build Status](https://travis-ci.org/LeCoinEnBande/OOnoz.svg?branch=master)](https://travis-ci.org/LeCoinEnBande/OOnoz)| Development: [![Build Status](https://travis-ci.org/LeCoinEnBande/OOnoz.svg?branch=development)](https://travis-ci.org/LeCoinEnBande/OOnoz)

####Windows builds
Master: [![Build status](https://ci.appveyor.com/api/projects/status/bjheqaf3kvxfjk8w/branch/master?svg=true)](https://ci.appveyor.com/project/jecisc/OOnoz/branch/master) | Latest commit: [![Build status](https://ci.appveyor.com/api/projects/status/bjheqaf3kvxfjk8w?svg=true)](https://ci.appveyor.com/project/jecisc/OOnoz)

#### JenkinsCI
Master And Development: [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=OOnoz)](https://ci.inria.fr/pharo-contribution/job/OOnoz/)

#### Coverage: 
[![Coverage Status](https://coveralls.io/repos/github/LeCoinEnBande/OOnoz/badge.svg?branch=master)](https://coveralls.io/github/LeCoinEnBande/OOnoz?branch=master)


University project for PEPIT

# Documentation

## Launching a Server

To launch a server you first need to initialize a configuration. The configuration has some parameters. Here is the list:

- `port`: The application port. By default: 8080
- `staticServerPort`: The static file serves port. By default: 1701
- `resourcesDirectoryPath`: The path to the folder containing the resources of the application relative to the image location. By default: '../../GitRepositories/OOnoz/Resources'
- `domainName`: The domain name used for the static file server. By default: 'localhost'

### Example of configuration file

    Configuration {
    	#parameters : {
    		'staticServerPort' : 1701,
    		'resourcesDirectoryPath' : '../../GitRepositories/OOnoz/Resources',
    		'port' : 8080,
    		'domainName' : 'localhost'
    	}
    }
    
To set the configuration to the server you can execute the following script with the right path to a configuration file:

    OOServer setConfigurationFromFile: '../../GitRepositories/OOnoz/configuration.ston'
    
If you use all the default values you can just execute:

    OOServer setConfigurationWith: OOConfiguration new
    
