variable "resource_group_name" {
    type=string
}

variable "resource_list" {
    type=map(object({
        resource_type=string
    }
    ))
}