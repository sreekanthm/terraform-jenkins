pipeline
{   
    agent any
    environment{  
      PATH = "${PATH}:${getTerraformPath()}"
    }
    stages{
        stage('s3 - create bucket'){
            steps{
                sh "ansible-playbook s3-bucket.yml"
            }
        }
        stage('terraform init and apply -dev'){
            steps{
                sh returnStatus: true, script: 'terraform workspace new dev'
                sh "terraform init"
                /*sh "terraform apply -var-file=dev.tfvars -auto-approve"*/
                sh "ansible-playbook terraform.yaml"
            }
        }
        stage('terraform init and apply -prod'){
            steps{
                sh returnStatus: true, script: 'terraform workspace new prod'
                sh "terraform init"
                /*sh "terraform apply -var-file=prod.tfvars -auto-approve"*/
                sh "ansible-playbook terraform.yaml -e app_env = prod"
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