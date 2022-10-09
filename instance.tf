provider "aws" {
  
  region     = var.region
  access_key = var.key
  secret_key = var.sec_key
}

module "challenge" {
  source  = "./instance/"

  name = "challenge"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.challenge.key_name
  monitoring             = true
  vpc_security_group_ids = [module.server-sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  ebs_block_device = [ {
   device_name = "/dev/xvda"
   volume_size = 100
   volume_type = "gp2"
} ]


  tags = {
    Terraform   = "true"
    Environment = "challenge"
  }
}

resource "aws_key_pair" "challenge" {
  key_name   = "challenge-${random_pet.unique.id}"
  public_key = file("${path.module}/public_key")
}

resource "aws_eip" "challenge" {
  vpc      = true
}

resource "aws_eip_association" "challenge" {
  instance_id   = module.challenge.id
  allocation_id = aws_eip.challenge.id
}