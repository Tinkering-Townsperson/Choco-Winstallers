param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
## Test if the script is running as admin, if not, run it again as admin
if ((Test-Admin) -eq $false){
    if ($elevated) {
    } else {
        try{
            Start-Process powershell.exe -WindowStyle Normal -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($MyInvocation.MyCommand.Definition))
            ## Window Styles : Normal, Minimized, Maximized and Hidden

            Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


        }
        catch{
            exit
        }
    }
    exit
}
