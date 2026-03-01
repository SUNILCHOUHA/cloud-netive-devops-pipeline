resource "aws_s3_bucket" "state_bucket" {
  bucket = "backend-eks-state-cicd"
  
  tags = {
    Name = "Backend"
  }
}