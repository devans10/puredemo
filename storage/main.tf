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
    name = "${var.hostname}-bootvol-${random_id.tf_bootvol_id.dec}"
    size = 107374182400
}

# Create data volume, 1T
resource "purestorage_volume" "datavol" {
    name = "${var.hostname}-datavol-${random_id.tf_datavol_id.dec}"
    size = 1099511627776
}

# Create host
resource "purestorage_host" "tf_host" {
    name = "${var.hostname}"
    wwn = ["${var.wwn}"]
    volume {
        vol = "${purestorage_volume.bootvol.name}"
        lun = 1
    }
}

# Create hostgroup and attach shared data volume
resource "purestorage_hostgroup" "tf_hostgroup" {
    name = "tfhostgroup"
    hosts = ["${purestorage_host.tf_host.name}"]
    volume {
        vol = "${purestorage_volume.datavol.name}"
        lun = 250
    }
}

