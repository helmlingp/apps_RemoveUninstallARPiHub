$reg = Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" 

foreach($r in $reg) {
    if(($r.Publisher -like "*VMware*") -and ($r.DisplayName -like "*Workspace One*")){
    $psChildName = $r.PSChildName
    $regPath = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$psChildName"
        if($r.NoRemove -eq $null) {
            New-ItemProperty -Path $regPath -Name "NoRemove" -PropertyType DWORD -Value 1
        }
        else {
            Set-ItemProperty -Path $regPath -Name "NoRemove" -Value 1
        }
    }
}