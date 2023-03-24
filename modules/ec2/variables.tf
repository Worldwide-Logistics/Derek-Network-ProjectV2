variable "ssh_key_name" {
    type = string
    description = "Key for ssh"
}

variable "name" {
    type = string
    description = "Name for ec2 instance"
    default = null
}

variable "subnet_id" {
 type=string
 description="subnet to attached ec2 to" 
}
variable "ssh_security_group_id" {
    type = string
    description = "security group for ssh"
}