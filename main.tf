###### main.ft

# Purestore Flasharray Provider
provider "purestorage" {
    target = "${var.purestorage_flasharray}"
    api_token = "${var.purestorage_apitoken}"
}

# Compute module, outputs hostname and wwn of host
module "compute" {
    source = "./compute"
}

# Storage module, outputs Boot Volume name and serial
# and Data Volume name and serial
module "storage" {
    source = "./storage"
    host = "${module.compute.hostname}"
    wwn = "${module.compute.wwn}"
}
