resource "aws_key_pair" "this" {
  key_name   = "ansible-master-key"
  public_key = file("/home/shiv/ansible-master-key.pub")
}
