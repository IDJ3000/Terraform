resource "aws_instance" "web1" {
}

import {
  to = aws_instance.web1
  id = "i-094d84212542ec640"
}