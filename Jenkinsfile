pipeline {
  agent {
    kubernetes {
      label 'jenkins-mvn-slave'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  # Use service account that can deploy to all namespaces
  serviceAccountName: jenkins-admin
  containers:
  - name: maven
    image: maven:3.6.3-jdk-8
    command:
    - cat
    tty: true
    volumeMounts:
      - mountPath: "/root/.m2"
        name: m2
  volumes:
    - name: m2
      persistentVolumeClaim:
        claimName: m2
"""
}
   }
  stages {
    stage('Build') {
      steps {
        container('maven') {
          sh """
                        echo 'Hello from mvn image!'
                        ls -R
                        echo '_____________'
                        ls -la /root/
                        echo '_____________'
                        ls -R
                                                """
        }
      }
    }
  }
}
