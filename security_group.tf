resource "aws_security_group" "k8s-worker" {
  name        = "k8s-worker"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-01b929e6919495ab8"
ingress {
  description = "costum tcp-1"
  from_port = 10256
  to_port = 10256
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]

}
 ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # This opens all TCP traffic to all IPs (use with caution)
  }

ingress {
  description = "costum tcp-1"
  from_port = 30000
  to_port = 32767
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  
}

ingress {
  description = "ssh"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  
}
ingress {
  description = "costum tcp-1"
  from_port = 10250
  to_port = 10250
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  
}
ingress {
    description = "tcp"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "tcp"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # This opens all TCP traffic to all IPs (use with caution)
  }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "k8s-master" {
  name = "k8s-master"
  description = "this sg is going to attach the master"
  vpc_id = "vpc-01b929e6919495ab8"


  ingress {
    description = "costum tcp-2"
    from_port = 10248
    to_port = 10260
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

ingress {
    description = "costum tcp-2"
    from_port = 2379
    to_port = 2380
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "costum tcp-2"
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "tcp"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "tcp"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # This opens all TCP traffic to all IPs (use with caution)
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

