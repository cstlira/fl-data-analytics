pipeline {
    agent { 
        docker  { 
            image 'ubuntu:latest'
            args '--user root'
        }
    }
    
    environment {
        REDSHIFT_URL      = credentials('jenkins-dbt-redshift-url')
        REDSHIFT_PASSWORD = credentials('jenkins-dbt-redshift-password')
        REDSHIFT_USER     = credentials('jenkins-dbt-redshift-user')
    }
    
    stages {
        stage('Install dbt & deps') {
            steps {
                sh '''
                      apt-get -y update
                      apt-get install -y git libpq-dev python-dev python3-pip
                      apt-get remove -y python-cffi
                      pip install --upgrade cffi
                      pip install cryptography~=3.4
                      pip install dbt-redshift
                      dbt deps --target ci
                      dbt run --target ci
                
                '''
            }
        }
    }
}
