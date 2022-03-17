pipeline {
    agent { docker { image 'python:3.10.1-alpine' } }
    
    environment {
        REDSHIFT_URL      = credentials('jenkins-dbt-redshift-url')
        REDSHIFT_PASSWORD = credentials('jenkins-dbt-redshift-password')
        REDSHIFT_USER     = credentials('jenkins-dbt-redshift-user')
    }
    
    stages {
        stage('Install dbt & deps') {
            steps {
                sh 'pip install cffi'
                sh 'pip install cryptography~=3.4'
                sh 'pip install dbt-redshift'
                sh 'dbt deps --target ci'
            }
        }
    }
}
