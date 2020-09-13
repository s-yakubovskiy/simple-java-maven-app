pipeline {
  agent {
    kubernetes {
      label 'jenkins-mvn'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  # Use service account that can deploy to all namespaces
  serviceAccountName: jenkins
  containers:
  - name: maven
    image: maven:3.6.3-jdk-8
    command:
    - cat
    tty: true
    volumeMounts:
      - mountPath: "/root/.m2"
        name: m2
  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  volumes:
    - name: docker-sock
      hostPath:
        path: /var/run/docker.sock
    - name: m2
      persistentVolumeClaim:
        claimName: m2
"""
}
   }
  stages {
    stage('Build') {
      steps {
        checkout([$class: 'GitSCM',
                        branches: [[name: '*/master' ]],
                        extensions: scm.extensions,
                        userRemoteConfigs: [[
                            url: 'git@github.com:s-yakubovskiy/simple-java-maven-app.git',
                            credentialsId: '7475a4e3-d467-410a-b073-9ca21746e89d'
                        ]]
                    ])
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
