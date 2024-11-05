# Below is the resource block which creates EC2 Instance
resource "aws_instance" "prod-instance" {
  ami           = "ami-02db68a01488594c5"
  instance_type = "t3.micro"
  tags = {
    Name = "Terraform"
  }
}

# Below is the provider which helps in connecting with AWS Account
provider "aws" {
  region = "eu-north-1"
}
