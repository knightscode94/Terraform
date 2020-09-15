output "ubuntu_ip" {
    value = module.ubuntu_webserver_node.public_ip
}

output "amazon_linux2_ip" {
    value = module.amazon_linux2_webserver_node.public_ip
}