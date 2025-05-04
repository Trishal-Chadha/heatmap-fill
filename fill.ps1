$start = Get-Date "2025-02-01"
$end = Get-Date "2025-05-04"

while ($start -le $end) {

    $commitCount = Get-Random -Minimum 6 -Maximum 15

    for ($i = 0; $i -lt $commitCount; $i++) {

        $randomMinutes = Get-Random -Minimum 0 -Maximum 1439
        $date = $start.AddMinutes($randomMinutes)

        $dateString = $date.ToString("yyyy-MM-dd HH:mm:ss")

        $content = [guid]::NewGuid().ToString()
        Set-Content -Path "data.txt" -Value $content -Append

        git add data.txt
        git commit --date="$dateString" -m "commit $content"
    }

    $start = $start.AddDays(1)
}