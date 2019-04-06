###### root/outputs.ft

output "Boot Volume" {
  value = "${module.storage.bootvol}"
}

output "Boot Volume Serial" {
    value = "${module.storage.bootvolserial}"
}

output "Data Volume" {
  value = "${module.storage.datavol}"
}

output "Data Volume Serial" {
  value = "${module.storage.datavolserial}"
}

