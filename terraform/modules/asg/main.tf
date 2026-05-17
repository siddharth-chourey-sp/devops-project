resource "aws_launch_template" "app" {
  name_prefix            = "web-app-lt"
  image_id               = var.ami_id
  instance_type          = "t2.micro"
  update_default_version = true

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }
  
  vpc_security_group_ids = [var.ec2_sg_id]

  user_data = base64encode(file("${path.root}/user_data.sh"))
  
}


resource "aws_autoscaling_group" "app" {
  desired_capacity = 1
  max_size         = 1
  min_size         = 1

  vpc_zone_identifier = var.private_subnets

  target_group_arns = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  health_check_type = "ELB"
  health_check_grace_period = 300
  tag {
    key                 = "Name"
    value               = "web-app-instance"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
    }
  }

}

