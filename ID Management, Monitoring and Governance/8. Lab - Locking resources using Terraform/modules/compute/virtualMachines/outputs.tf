output "virtual_machine_details" {
    value={
        for machine in azurerm_windows_virtual_machine.virtualmachine :
        machine.name => (
            {
                virtual_machine_id=machine.id
            }
        )
    }  
}