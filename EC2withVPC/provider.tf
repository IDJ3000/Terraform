# Define the default AWS provider for us-east-1 region
provider "aws" {
  region = "us-east-1"
}

# Define another AWS provider for us-west-1 region, using alias
provider "aws" {
  alias  = "west"
  region = "us-west-1"
}
