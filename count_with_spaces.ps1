# Array of file paths (replace with your actual file paths)
$filePaths = @(
    ".\content\chapter1-introduction.tex",
    ".\content\chapter2-analysis.tex",
    ".\content\chapter3-solution_proposal.tex",
    ".\content\chapter4-experimenting.tex",
    ".\content\chapter5-evaluation.tex",
    ".\content\conclusion.tex"
)

$OutputEncoding = [System.Text.Encoding]::UTF8

# Initialize sum variables
$totalCharCount = 0
$fileCharCounts = @()  # Array to hold file name, character count, and percentage

# Loop through each file path
foreach ($filePath in $filePaths) {
    # Check if the file exists
    if (Test-Path $filePath) {
        $tempFile = ".\__temp_utf8.txt"
        & pandoc $filePath -t plain --output=$tempFile --lua-filter=strip-math.lua
        $text = Get-Content $tempFile -Raw -Encoding UTF8
        $charCount = ($text | Measure-Object -Character).Characters
        Remove-Item $tempFile
        Write-Output $text

        # Add to the character count array
        $fileCharCounts += [PSCustomObject]@{
            FileName = $filePath
            CharCount = $charCount
        }

        # Add to total character count
        $totalCharCount += $charCount
    } else {
        # Add file with 0 char count if not found
        $fileCharCounts += [PSCustomObject]@{
            FileName = $filePath
            CharCount = 0
        }
    }
}

# Print the header for the table
Write-Host ("{0,-50} {1,15} {2,15}" -f "File Name", "Characters", "Percentage")

Write-Host ("-" * 82)

# Print each file's name, character count, and percentage
$fileCharCounts | ForEach-Object {
    $percentage = if ($totalCharCount -gt 0) { [math]::Round(($_.CharCount / $totalCharCount) * 100, 2) } else { 0 }
    Write-Host ("{0,-50} {1,15} {2,15}" -f $_.FileName, $_.CharCount, $percentage)
}

# Print a horizontal separator line
Write-Host ("-" * 82)

# Print the total character count for all files (body only)
Write-Host ("{0,-50} {1,15}" -f "Total", $totalCharCount) characters

# Calculate norm pages (total characters / 1800) and round up to two decimal places
$normPages = [math]::Ceiling(($totalCharCount / 1800) * 100) / 100

# Print the norm pages (rounded to two decimal places)
Write-Host ("{0,-50} {1,15}" -f "Norm pages", $normPages) pages

