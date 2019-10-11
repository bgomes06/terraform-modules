provider "aws" {
  region = "us-east-1"
}

# Get latest snapshot from production DB
data "aws_db_snapshot" "db_snapshot" {
    most_recent = true
    db_instance_identifier = "database-1"
}
# Create new staging DB
resource "aws_db_instance" "db_uat" {
  instance_class       = "db.t2.micro"
  identifier           = "database-replica"
  username             = "bruno"
  password             = "brunoadmin321"
  db_subnet_group_name = "default-vpc-e0ad4c86"
  snapshot_identifier  = "${data.aws_db_snapshot.db_snapshot.id}"
  vpc_security_group_ids = ["sg-305d844d"]
  skip_final_snapshot = true
}

