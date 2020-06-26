node {
    def registry = 'aamirpinger/udacity-project-capstone'
    stage ('Git Repo Checkout') {
        echo "Git Repo Checkout"
        checkout scm
        echo "Checkout complete"
    }
    
    stage("Linting") {
      echo 'Linting...'
      sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    }

        stage('Build Image') {
        app = docker.build("${registry}")
        echo "Build Complete"
        sh 'docker image ls'
        }

        stage('Push image') {
            docker.withRegistry('', 'docker-hub') {
            app.push()
        echo 'Image pushed to Docker Hub'
        }
    }

    stage('Deploying') {
      echo 'Deploying to AWS...'
      dir ('./') {
        withAWS(credentials: 'aws-creds', region: 'us-west-2') {
            sh "aws eks --region us-west-2 update-kubeconfig --name CapstoneEKSUdacity-0TtoHmzFVWVJ"
            sh "kubectl get nodes"
            sh "kubectl get pods"
            sh "kubectl apply -f aws/kube/aws-auth-cm.yaml"
            sh "kubectl apply -f aws/kube/depl.yaml"
            sh "kubectl apply -f aws/kube/lb.yaml"
            sh "kubectl get nodes"
            sh "kubectl get pods"
        }
}
}
}
