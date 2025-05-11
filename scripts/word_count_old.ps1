# Array of file paths (replace with your actual file paths)
$filePaths = @(
    ".\content\chapterl-introduction.tex",
    ".\content\chapter2-5-solution_proposal.tex",
    ".\content\chapter2-analysis.tex",
    ".\content\chapter3-experimenting.tex",
    ".\content\chapter4-evaluation.tex"
)

# Initialize sum variables
$totalCharCount = 0
$fileCharCounts = @()  # Array to hold file name, character count, and percentage

# Loop through each file path
foreach ($filePath in $filePaths) {
    # Check if the file exists
    if (Test-Path $filePath) {
        # Run texcount with the -char flag to count characters in the body (excluding LaTeX commands, comments, etc.)
        $texCountOutput = & "texcount" -char $filePath

        # The output should contain a line like "Letters in text: 4313"
        $charCountLine = $texCountOutput | Select-String -Pattern "Letters in text:"

        if ($charCountLine) {
            # Extract the character count (the number after "Letters in text:")
            $charCount = [int]($charCountLine.ToString().Split(":")[1].Trim())

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
    } else {
        # Add file with 0 char count if not found
        $fileCharCounts += [PSCustomObject]@{
            FileName = $filePath
            CharCount = 0
        }
    }
}

# Print the header for the table
Write-Host ("{0,-30} {1,15} {2,15}" -f "File Name", "Characters", "Percentage")

Write-Host ("-" * 62)

# Print each file's name, character count, and percentage
$fileCharCounts | ForEach-Object {
    $percentage = if ($totalCharCount -gt 0) { [math]::Round(($_.CharCount / $totalCharCount) * 100, 2) } else { 0 }
    Write-Host ("{0,-30} {1,15} {2,15}" -f $_.FileName, $_.CharCount, $percentage)
}

# Print a horizontal separator line
Write-Host ("-" * 62)

# Print the total character count for all files (body only)
Write-Host ("{0,-30} {1,15}" -f "Total", $totalCharCount) characters

# Calculate norm pages (total characters / 1800) and round up to two decimal places
$normPages = [math]::Ceiling(($totalCharCount / 1800) * 100) / 100

# Print the norm pages (rounded to two decimal places)
Write-Host ("{0,-30} {1,15}" -f "Norm pages", $normPages) pages

pause