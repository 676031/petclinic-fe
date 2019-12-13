const sonarqubeScanner = require('sonarqube-scanner');
     sonarqubeScanner({
       serverUrl: 'http://34.83.46.198/',
       options : {
       'sonar.sources': '.',
       'sonar.inclusions' : 'src/**' // Entry point of your code
       }
     }, () => {});