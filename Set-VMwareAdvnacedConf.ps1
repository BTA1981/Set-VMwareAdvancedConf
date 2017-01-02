# Set VMware Advanced configuration option (in this case for preventing a certain bug)

import-module VMware.VimAutomation.Core

$VM = "vss01"
$vCenter = "vc01"

Connect-VIServer $vCenter
$vm = Get-View (Get-VM $VM).ID
$CfgSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
#$CfgSpec.extraconfig = New-Object VMware.Vim.optionvalue

# you can use any advanced setting key/value pair here:
 $CfgSpec.extraConfig += New-Object VMware.Vim.OptionValue
 $CfgSpec.extraConfig[0].key = "monitor_control.enable_softResetClearTSC"
 $CfgSpec.extraConfig[0].value = "TRUE"
 if ($VM.guest.GuestId -like "windows8*Guest") {
    $vm.ReconfigVM_Task($cfgSpec)
 }
