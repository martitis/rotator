[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$directory = "$env:USERPROFILE\Pictures\Screenshots"
$newestImage = Get-ChildItem -Path $directory -Filter *.png | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if ($newestImage -ne $null) {
    $image = [System.Drawing.Image]::FromFile($newestImage.FullName)
    $image.RotateFlip([System.Drawing.RotateFlipType]::Rotate180FlipNone)
    $newImagePath = Join-Path -Path $directory -ChildPath "rotated_image.png"
    $image.Save($newImagePath)
    $image.Dispose()
}
