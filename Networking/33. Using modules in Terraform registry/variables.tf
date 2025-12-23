variable "subnets" {
   type=list(object({
      name=string
      address_prefixes = list(string)
   }
   ))
}