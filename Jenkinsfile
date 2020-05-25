node {
    def registry = 'aamirpinger/udacity-capstone-project'
    stage('Checking out git repo') {
      echo 'Checkout...'
      checkout scm
    }
    stage('Checking environment') {
      echo 'Checking environment...'
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage("Linting") {
      echo 'Linting...'
      sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    }
    stage('Building image') {
	    echo 'Building Docker image...'
      withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
	     	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
	     	sh "docker build --tag=${registry} ."
	     	sh "docker tag ${registry} ${registry}"
	     	sh "docker push ${registry}"
      }
    }
    stage('Deploying') {
      echo 'Deploying to AWS...'
      dir ('./') {
        withAWS(credentials: '	jenkins AWS', region: 'us-west-2') {
            sh "aws eks --region us-west-2 update-kubeconfig --name CapstoneEKSUdacity-ckowlANas6sE"
            sh "kubectl get nodes,pods"
            sh "kubectl set image deployments/capstone-app capstone-app=${registry}:latest --record"
            sh "kubectl get nodes,pods"
        }
      }
    }
}