pipeline {
  agent any
  
  environment {
        REDSHIFT_URL      = credentials('jenkins-dbt-redshift-url')
        REDSHIFT_PASSWORD = credentials('jenkins-dbt-redshift-password')
        REDSHIFT_USER     = credentials('jenkins-dbt-redshift-user')
    }
  
  stages {
    
    stage('PR stage execution') {
      when {
        branch 'PR-*'
      }
      steps {
        sh ''' 
          python --version
        ''' 
      }
      
    }
    
  }
}
