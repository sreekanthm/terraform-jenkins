pipeline
{   
    agent any
    environment{  
      PATH = "${PATH}:${getTerraformPath()}"
    }
    stages{
        stage('s3 - create bucket'){
            steps{
                script{
                    createS3Bucket('javahome-tf-test')
                }
            }
        }
        stage('terraform init and apply -dev'){
            steps{
                sh returnStatus: true, script: 'terraform workspace new dev'
                sh "terraform init"
                sh "terraform apply -var-file=dev.tfvars -auto-approve"
            }
        }
        stage('terraform init and apply -prod'){
            steps{
                sh returnStatus: true, script: 'terraform workspace new prod'
                sh "terraform init"
                sh "terraform apply -var-file=prod.tfvars -auto-approve"
            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-12', type: 'terraform'
    return tfHome
}
def createS3Bucket(bucketName){

    sh returnStatus: true, script: 'aws s3 mb ${bucketName} --region=eu-west-1'

}