resource "aws_iam_user" "innovative" {
  name = local.username[0]
  path = local.userpath

  tags = {
    Name = "value"

  }
}

resource "aws_iam_access_key" "innovative" {
  user = aws_iam_user.innovative.name

}

resource "aws_vpc" "name" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "value"
  }
}


