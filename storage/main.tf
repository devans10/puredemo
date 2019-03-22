###### storage/main.tf

# Random ID for boot volume
resource "random_id" "tf_bootvol_id" {
    byte_length = 1
}

# Random ID for data volume
resource "random_id" "tf_datavol_id" {
    byte_length = 1
}

# Create boot volume, 100G
resource "purestorage_volume" "bootvol" {
    name = "${purestorage_host.tf_host.name}-bootvol-${random_id.tf_bootvol_id.dec}"
    size = "${pow(1024, 3)*100}"
}

# Create data volume, 1T
resource "purestorage_volume" "datavol" {
    name = "${purestorage_host.tf_host.name}-datavol-${random_id.tf_datavol_id.dec}"
    size = "${pow(1024, 4)}"
}

# Create host
resource "purestorage_host" "tf_host" {
    name = "${var.hostname}"
    wwn = "${var.wwn}"
    volume {
        vol = "${purestorage_volume.bootvol.name}"
        lun = 1
    }
}

# Create hostgroup and attach shared data volume
resource "purestorage_hostgroup" "ft_hostgroup" {
    name = "tfhostgroup"
    hosts = ["${purestorage_host.ft_host.name}"]
    volume {
        vol = "${purestorage_volume.datavol.name}"
        lun = 250
    }
}

