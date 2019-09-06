
resource "aws_key_pair" "test" {
  key_name = "${var.key_name}"
  public_key="${file("~/.ssh/${var.key}")}"

}

output "key_name" {
  value = "${aws_key_pair.test.id}"
}
