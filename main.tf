provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "k8s-master" {
  instance_type = var.instance_type
  ami = var.ami_id
  key_name = "us-key-pair"
  vpc_security_group_ids = [ aws_security_group.k8s-master.id ]
  associate_public_ip_address = true
  count = 1  # Single master node

  tags = {
    Name = "K8s-Master"
  }

  # File provisioner (with connection details)
  provisioner "file" {
    source      = "D:/ultimate-kubeadm-project/terraform-15/kubeadm.sh"
    destination = "/tmp/kubeadm.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"  # Adjust if necessary
      private_key = file(var.ssh_private_key)
      host        = self.public_ip
    }
  }

  # Remote execution
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/kubeadm.sh",
      "/tmp/kubeadm.sh"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"  # Adjust if necessary
      private_key = file(var.ssh_private_key)
      host        = self.public_ip
    }
  }
}

resource "aws_instance" "k8s-worker" {
  instance_type = var.instance_type
  ami = var.ami_id
  key_name = "us-key-pair"
  vpc_security_group_ids = [ aws_security_group.k8s-worker.id ]
  associate_public_ip_address = true
  count = 1  # Single worker node

  tags = {
    Name = "K8s-Worker"
  }

  # File provisioner (with connection details)
  provisioner "file" {
    source      = "D:/ultimate-kubeadm-project/terraform-15/kubeadm.sh"
    destination = "/tmp/kubeadm.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"  # Adjust if necessary
      private_key = file(var.ssh_private_key)
      host        = self.public_ip
    }
  }

  # Remote execution
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/kubeadm.sh",
      "/tmp/kubeadm.sh"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"  # Adjust if necessary
      private_key = file(var.ssh_private_key)
      host        = self.public_ip
    }
  }
}
