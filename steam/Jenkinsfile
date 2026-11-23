pipeline {
    agent any

    stages {
        stage('Gracze online') {
            steps {
                powershell './steam/gracze.ps1'
            }
        }
        stage('Nowosci od tworcow') {
            steps {
                powershell './steam/nowosci.ps1'
            }
        }
    }
}
