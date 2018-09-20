output "cluster_name" {
  value = "kt.cluster.k8s.local"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-kt-cluster-k8s-local.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-kt-cluster-k8s-local.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-kt-cluster-k8s-local.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-kt-cluster-k8s-local.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-west-2a-kt-cluster-k8s-local.id}", "${aws_subnet.us-west-2b-kt-cluster-k8s-local.id}", "${aws_subnet.us-west-2c-kt-cluster-k8s-local.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-kt-cluster-k8s-local.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-kt-cluster-k8s-local.name}"
}

output "region" {
  value = "us-west-2"
}

output "vpc_id" {
  value = "${aws_vpc.kt-cluster-k8s-local.id}"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_autoscaling_attachment" "master-us-west-2a-masters-kt-cluster-k8s-local" {
  elb                    = "${aws_elb.api-kt-cluster-k8s-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2a-masters-kt-cluster-k8s-local.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2b-masters-kt-cluster-k8s-local" {
  elb                    = "${aws_elb.api-kt-cluster-k8s-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2b-masters-kt-cluster-k8s-local.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2c-masters-kt-cluster-k8s-local" {
  elb                    = "${aws_elb.api-kt-cluster-k8s-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2c-masters-kt-cluster-k8s-local.id}"
}

resource "aws_autoscaling_group" "master-us-west-2a-masters-kt-cluster-k8s-local" {
  name                 = "master-us-west-2a.masters.kt.cluster.k8s.local"
  launch_configuration = "${aws_launch_configuration.master-us-west-2a-masters-kt-cluster-k8s-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-kt-cluster-k8s-local.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2a.masters.kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2b-masters-kt-cluster-k8s-local" {
  name                 = "master-us-west-2b.masters.kt.cluster.k8s.local"
  launch_configuration = "${aws_launch_configuration.master-us-west-2b-masters-kt-cluster-k8s-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2b-kt-cluster-k8s-local.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2b.masters.kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2c-masters-kt-cluster-k8s-local" {
  name                 = "master-us-west-2c.masters.kt.cluster.k8s.local"
  launch_configuration = "${aws_launch_configuration.master-us-west-2c-masters-kt-cluster-k8s-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2c-kt-cluster-k8s-local.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2c.masters.kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-kt-cluster-k8s-local" {
  name                 = "nodes.kt.cluster.k8s.local"
  launch_configuration = "${aws_launch_configuration.nodes-kt-cluster-k8s-local.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-kt-cluster-k8s-local.id}", "${aws_subnet.us-west-2b-kt-cluster-k8s-local.id}", "${aws_subnet.us-west-2c-kt-cluster-k8s-local.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.kt.cluster.k8s.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-kt-cluster-k8s-local" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "a.etcd-events.kt.cluster.k8s.local"
    "k8s.io/etcd/events"                         = "a/a,b,c"
    "k8s.io/role/master"                         = "1"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-kt-cluster-k8s-local" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "a.etcd-main.kt.cluster.k8s.local"
    "k8s.io/etcd/main"                           = "a/a,b,c"
    "k8s.io/role/master"                         = "1"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-kt-cluster-k8s-local" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "b.etcd-events.kt.cluster.k8s.local"
    "k8s.io/etcd/events"                         = "b/a,b,c"
    "k8s.io/role/master"                         = "1"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-kt-cluster-k8s-local" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "b.etcd-main.kt.cluster.k8s.local"
    "k8s.io/etcd/main"                           = "b/a,b,c"
    "k8s.io/role/master"                         = "1"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-kt-cluster-k8s-local" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "c.etcd-events.kt.cluster.k8s.local"
    "k8s.io/etcd/events"                         = "c/a,b,c"
    "k8s.io/role/master"                         = "1"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-kt-cluster-k8s-local" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "c.etcd-main.kt.cluster.k8s.local"
    "k8s.io/etcd/main"                           = "c/a,b,c"
    "k8s.io/role/master"                         = "1"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_elb" "api-kt-cluster-k8s-local" {
  name = "api-kt-cluster-k8s-local-m30ehq"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-kt-cluster-k8s-local.id}"]
  subnets         = ["${aws_subnet.us-west-2a-kt-cluster-k8s-local.id}", "${aws_subnet.us-west-2b-kt-cluster-k8s-local.id}", "${aws_subnet.us-west-2c-kt-cluster-k8s-local.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "kt.cluster.k8s.local"
    Name              = "api.kt.cluster.k8s.local"
  }
}

resource "aws_iam_instance_profile" "masters-kt-cluster-k8s-local" {
  name = "masters.kt.cluster.k8s.local"
  role = "${aws_iam_role.masters-kt-cluster-k8s-local.name}"
}

resource "aws_iam_instance_profile" "nodes-kt-cluster-k8s-local" {
  name = "nodes.kt.cluster.k8s.local"
  role = "${aws_iam_role.nodes-kt-cluster-k8s-local.name}"
}

resource "aws_iam_role" "masters-kt-cluster-k8s-local" {
  name               = "masters.kt.cluster.k8s.local"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.kt.cluster.k8s.local_policy")}"
}

resource "aws_iam_role" "nodes-kt-cluster-k8s-local" {
  name               = "nodes.kt.cluster.k8s.local"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.kt.cluster.k8s.local_policy")}"
}

resource "aws_iam_role_policy" "masters-kt-cluster-k8s-local" {
  name   = "masters.kt.cluster.k8s.local"
  role   = "${aws_iam_role.masters-kt-cluster-k8s-local.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.kt.cluster.k8s.local_policy")}"
}

resource "aws_iam_role_policy" "nodes-kt-cluster-k8s-local" {
  name   = "nodes.kt.cluster.k8s.local"
  role   = "${aws_iam_role.nodes-kt-cluster-k8s-local.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.kt.cluster.k8s.local_policy")}"
}

resource "aws_internet_gateway" "kt-cluster-k8s-local" {
  vpc_id = "${aws_vpc.kt-cluster-k8s-local.id}"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "kt.cluster.k8s.local"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_key_pair" "kubernetes-kt-cluster-k8s-local-7eb54e2bad44e3d710b32b55c3713923" {
  key_name   = "kubernetes.kt.cluster.k8s.local-7e:b5:4e:2b:ad:44:e3:d7:10:b3:2b:55:c3:71:39:23"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.kt.cluster.k8s.local-7eb54e2bad44e3d710b32b55c3713923_public_key")}"
}

resource "aws_launch_configuration" "master-us-west-2a-masters-kt-cluster-k8s-local" {
  name_prefix                 = "master-us-west-2a.masters.kt.cluster.k8s.local-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "m3.medium"
  key_name                    = "${aws_key_pair.kubernetes-kt-cluster-k8s-local-7eb54e2bad44e3d710b32b55c3713923.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kt-cluster-k8s-local.id}"
  security_groups             = ["${aws_security_group.masters-kt-cluster-k8s-local.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2a.masters.kt.cluster.k8s.local_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  ephemeral_block_device = {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2b-masters-kt-cluster-k8s-local" {
  name_prefix                 = "master-us-west-2b.masters.kt.cluster.k8s.local-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "m3.medium"
  key_name                    = "${aws_key_pair.kubernetes-kt-cluster-k8s-local-7eb54e2bad44e3d710b32b55c3713923.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kt-cluster-k8s-local.id}"
  security_groups             = ["${aws_security_group.masters-kt-cluster-k8s-local.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2b.masters.kt.cluster.k8s.local_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  ephemeral_block_device = {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2c-masters-kt-cluster-k8s-local" {
  name_prefix                 = "master-us-west-2c.masters.kt.cluster.k8s.local-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "m3.medium"
  key_name                    = "${aws_key_pair.kubernetes-kt-cluster-k8s-local-7eb54e2bad44e3d710b32b55c3713923.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kt-cluster-k8s-local.id}"
  security_groups             = ["${aws_security_group.masters-kt-cluster-k8s-local.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2c.masters.kt.cluster.k8s.local_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  ephemeral_block_device = {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-kt-cluster-k8s-local" {
  name_prefix                 = "nodes.kt.cluster.k8s.local-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-kt-cluster-k8s-local-7eb54e2bad44e3d710b32b55c3713923.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-kt-cluster-k8s-local.id}"
  security_groups             = ["${aws_security_group.nodes-kt-cluster-k8s-local.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.kt.cluster.k8s.local_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.kt-cluster-k8s-local.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.kt-cluster-k8s-local.id}"
}

resource "aws_route_table" "kt-cluster-k8s-local" {
  vpc_id = "${aws_vpc.kt-cluster-k8s-local.id}"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "kt.cluster.k8s.local"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
    "kubernetes.io/kops/role"                    = "public"
  }
}

resource "aws_route_table_association" "us-west-2a-kt-cluster-k8s-local" {
  subnet_id      = "${aws_subnet.us-west-2a-kt-cluster-k8s-local.id}"
  route_table_id = "${aws_route_table.kt-cluster-k8s-local.id}"
}

resource "aws_route_table_association" "us-west-2b-kt-cluster-k8s-local" {
  subnet_id      = "${aws_subnet.us-west-2b-kt-cluster-k8s-local.id}"
  route_table_id = "${aws_route_table.kt-cluster-k8s-local.id}"
}

resource "aws_route_table_association" "us-west-2c-kt-cluster-k8s-local" {
  subnet_id      = "${aws_subnet.us-west-2c-kt-cluster-k8s-local.id}"
  route_table_id = "${aws_route_table.kt-cluster-k8s-local.id}"
}

resource "aws_security_group" "api-elb-kt-cluster-k8s-local" {
  name        = "api-elb.kt.cluster.k8s.local"
  vpc_id      = "${aws_vpc.kt-cluster-k8s-local.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "api-elb.kt.cluster.k8s.local"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_security_group" "masters-kt-cluster-k8s-local" {
  name        = "masters.kt.cluster.k8s.local"
  vpc_id      = "${aws_vpc.kt-cluster-k8s-local.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "masters.kt.cluster.k8s.local"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_security_group" "nodes-kt-cluster-k8s-local" {
  name        = "nodes.kt.cluster.k8s.local"
  vpc_id      = "${aws_vpc.kt-cluster-k8s-local.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "nodes.kt.cluster.k8s.local"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-kt-cluster-k8s-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-kt-cluster-k8s-local.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.api-elb-kt-cluster-k8s-local.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-kt-cluster-k8s-local.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-kt-cluster-k8s-local.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-west-2a-kt-cluster-k8s-local" {
  vpc_id            = "${aws_vpc.kt-cluster-k8s-local.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-west-2a"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "us-west-2a.kt.cluster.k8s.local"
    SubnetType                                   = "Public"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
    "kubernetes.io/role/elb"                     = "1"
  }
}

resource "aws_subnet" "us-west-2b-kt-cluster-k8s-local" {
  vpc_id            = "${aws_vpc.kt-cluster-k8s-local.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "us-west-2b"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "us-west-2b.kt.cluster.k8s.local"
    SubnetType                                   = "Public"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
    "kubernetes.io/role/elb"                     = "1"
  }
}

resource "aws_subnet" "us-west-2c-kt-cluster-k8s-local" {
  vpc_id            = "${aws_vpc.kt-cluster-k8s-local.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "us-west-2c"

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "us-west-2c.kt.cluster.k8s.local"
    SubnetType                                   = "Public"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
    "kubernetes.io/role/elb"                     = "1"
  }
}

resource "aws_vpc" "kt-cluster-k8s-local" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "kt.cluster.k8s.local"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "kt-cluster-k8s-local" {
  domain_name         = "us-west-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                            = "kt.cluster.k8s.local"
    Name                                         = "kt.cluster.k8s.local"
    "kubernetes.io/cluster/kt.cluster.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "kt-cluster-k8s-local" {
  vpc_id          = "${aws_vpc.kt-cluster-k8s-local.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.kt-cluster-k8s-local.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
