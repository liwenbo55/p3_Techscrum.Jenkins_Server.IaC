terraform {
  backend "s3" {
    region = "ap-southeast-2"
    bucket = "p3.techscrum.jenkinsserver.statefile"
    key    = "jenkinsserver.tfstate"
  }
}
