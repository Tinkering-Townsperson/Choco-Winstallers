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

            choco install atom
            choco install curl
            choco install filezilla
            choco install gh
            choco install github-desktop
            choco install golang
            choco install hashtab
            choco install hxd
            choco install powertoys
            choco install processhacker
            choco install putty
            choco install python
            choco install qbittorrent
            choco install resourcehacker.portable
            choco install ruby
            choco install rufus
            choco install vlc
            choco install vnc-viewer
            choco install wget
            choco install windirstat

            echo "Going to downloads Page"
            start msedge https://tinkering-townsperson.github.io/Choco-Winstallers/downloads


        }
        catch{
            exit
        }
    }
    exit
}
