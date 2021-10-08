pipeline{
  agent {label "docker"}
  
  stages {
    
    stage('preparation'){
      steps {
        git 'https://github.com/AmrBumadian/Booster_CI_CD_Project.git'
      }
    
    }
    
    
     stage('build image'){
      steps {
          sh 'docker build . -f Dockerfile -t amrbumadian/booster_django_app:latest'
        }
     }
    
    
     stage('push image'){
            steps {
                withCredentials([usernamePassword(credentialsId:"dockerhub",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]) {
                    
                    sh """
                      docker login -u ${USERNAME} -p ${PASSWORD}
                      docker push amrbumadian/booster_django_app:latest
                    """
                }
            }
        }
     stage('deploy'){
            steps {
                sh 'docker run -d -p 9000:9000 amrbumadian/booster_django_app:latest'
            }
           post {
              success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL")
             }

              failure {
                slackSend (color: '#FF0000', message: "FAILED")
        
             }
    }
        }

    
    
     
    }
  

  
  
    
  }



















