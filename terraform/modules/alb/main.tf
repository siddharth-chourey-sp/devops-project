resource "aws_lb" "app_alb" {
        name = "devops-web-app-alb"
    load_balancer_type = "application"
    subnets = var.public_subnets
    security_groups = [var.alb_sg_id]

    tags = {
      Name = "devops-web-app-alb"
    }
}

resource "aws_lb_target_group" "app_tg" {
    name     = "devops-web-app-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc_id
    
    health_check {
        path                = "/health"
        port                = "traffic-port"
        protocol            = "HTTP"
        matcher             = "200"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 3
        unhealthy_threshold = 3
    }
    
    tags = {
        Name = "devops-web-app-tg"
    }
}

resource "aws_lb_listener" "app_listener" {
    load_balancer_arn = aws_lb.app_alb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.app_tg.arn
    }
}