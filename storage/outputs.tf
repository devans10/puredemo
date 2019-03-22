###### storage/outputs.tf

output "bootvol" {
  value = "${purestorage_volume.bootvol.name}"
}

output "bootvolserial" {
  value = "${purestorage_volume.bootvol.serial}"
}

output "datavol" {
  value = "${purestorage_volume.datavol.name}"
}

output "datavolserial" {
  value = "${purestorage_volume.datavol.serial}"
}
