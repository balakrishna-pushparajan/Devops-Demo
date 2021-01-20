node('master')
{
    stage('git')
    {
    checkout scm        
    }
    stage('Containerization')
    {
        sh'''
        cd /var/lib/jenkins/workspace/Devops-Demo/
        docker build -t balakrishnapushparajan/demo:devops .
        '''
    }
    registry = "balakrishnapushparajan/demo"
    withDockerRegistry(credentialsId:'dockerbala', url: '')
    {
       sh'''
       docker push balakrishnapushparajan/demo:devops
       docker stop demo
       docker system prune -f
       docker volume prune -f 
       docker run -d --name devops -p 5000:5000 balakrishnapushparajan/demo:devops
       
    '''
    }
    stage('WebApp interaction')
    {
     sh'''
      docker exec -i devops ps -ef
     
     '''
     
    }
        
    
    
}
