pipeline {
  agent any
  node {
  def remote = [:]
  remote.name = 'Prod'
  remote.host = '35.178.161.189'
  remote.user = $USERNAME
  remote.password = $USEPASS
  remote.allowAnyHosts = true
  stages {
    stage('Remote SSH') {
      writeFile file: 'abc.sh', text: 'ls -lrt'
      sshPut remote: remote, from: 'abc.sh', into: '.'
    }
    stage('Health Check'){
      steps {
        sh """ 
           echo 'Well done!'
	"""
      }
    }
  }
}
