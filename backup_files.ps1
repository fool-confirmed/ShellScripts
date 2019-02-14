$byDate = get-date -format yyyy-MMM-dd
$prefix = "c:\backup\" + $byDate

function Copy-File ($source)
{
    # get path and file name
    $folder = Split-Path -Path $filePath -Parent
    $folder = Split-Path -Path $folder -NoQualifier
    $file = Split-Path -Path $filePath -Leaf

    # assemble destination folder
    $finalPath = $prefix + $folder

    # ensure folder exists
    if(-not(Test-Path -Path $finalPath)) {
        mkdir $finalPath > $null
        Write-Host "Created $finalPath" -ForegroundColor Green
    }else{
        Write-Host "folder $finalPath exists" -ForegroundColor Yellow
    }
    
    Copy-Item -Path $source -Destination $finalPath        
    Write-Host "$source is copied to $finalPath"
}

$array = @(
"C:\temp\dummy.cs",
"C:\temp\dummy1.aspx",
"C:\temp\dummy2.ascx"
)

foreach($filePath in $array){
    Copy-File($filePath)
}
