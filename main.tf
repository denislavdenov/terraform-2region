provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-east-1"
}

# Additional provider configuration for west coast region
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  alias  = "west"
  region = "us-west-2"
}

resource "aws_instance" "web_west" {
  provider = aws.west
  ami           = "ami-06d51e91cea0dac8d"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWest"
  }
}

resource "aws_instance" "web_east" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloEast"
  }
}
