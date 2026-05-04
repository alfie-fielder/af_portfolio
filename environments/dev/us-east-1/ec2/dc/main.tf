module "dc" {
  source = "git::https://github.com/alfie-fielder/af_portfolio_ec2_module.git?ref=v2.0.0"

  ami           = var.ami
  instance_type = var.instance_type

  subnet_id                   = data.terraform_remote_state.vpc.outputs.private_subnet_ids[0]
  vpc_security_group_ids      = [data.terraform_remote_state.sg.outputs.dc_security_group_id]
  associate_public_ip_address = false

  key_name             = var.key_name
  iam_instance_profile = null

  ebs_optimized = true
  monitoring    = true

  root_volume_size                  = var.root_volume_size
  root_volume_type                  = var.root_volume_type
  root_volume_kms_key_id            = var.kms_key_id
  root_volume_delete_on_termination = false
  ebs_block_devices                 = var.ebs_block_devices

  shutdown_behavior           = "stop"
  user_data_replace_on_change = false

  metadata_hop_limit = 1

  tags        = var.tags
  volume_tags = var.volume_tags
}
