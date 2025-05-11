# Array of file paths (replace with your actual file paths)
$filePaths = @(
    ".\..\content\chapter1-introduction.tex",
    ".\..\content\chapter2-analysis.tex",
    ".\..\content\chapter3-solution_proposal.tex",
    ".\..\content\chapter4-experimenting.tex",
    ".\..\content\chapter5-evaluation.tex",
    ".\..\content\conclusion.tex"
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
	$wordCount = [math]::Round($charCount * (250 / 1800))
        Remove-Item $tempFile
        Write-Output $text

        # Add to the character count array
        $fileCharCounts += [PSCustomObject]@{
            FileName = $filePath
            CharCount = $charCount
	    WordCount = $wordCount
        }

        # Add to total character count
        $totalCharCount += $charCount
    } else {
        # Add file with 0 char count if not found
        $fileCharCounts += [PSCustomObject]@{
            FileName = $filePath
            CharCount = 0
	    WordCount = 0
        }
    }
}

# Print the header for the table
Write-Host ("{0,-50} {1,15} {2,15} {3,15}" -f "File Name", "Characters", "Words", "Percentage")

Write-Host ("-" * 98)

# Print each file's name, character count, and percentage
$fileCharCounts | ForEach-Object {
    $percentage = if ($totalCharCount -gt 0) { [math]::Round(($_.CharCount / $totalCharCount) * 100, 2) } else { 0 }
    Write-Host ("{0,-50} {1,15} {2,15} {3,15}" -f $_.FileName, $_.CharCount, $_.WordCount, $percentage)
}

# Print a horizontal separator line
Write-Host ("-" * 98)

# Print the total character count for all files (body only)
Write-Host ("{0,-50} {1,15}" -f "Total", $totalCharCount) characters

# Calculate norm pages (total characters / 1800) and round up to two decimal places
$normPages = [math]::Ceiling(($totalCharCount / 1800) * 100) / 100

# Print the norm pages (rounded to two decimal places)
Write-Host ("{0,-50} {1,15}" -f "Norm pages", $normPages) pages

# Calculate estimated word count
$estimatedWords = [math]::Round($totalCharCount * (250 / 1800))

# Print the estimated word count
Write-Host ("{0,-50} {1,15}" -f "Estimated words", $estimatedWords) words

# ================================= COPY =================================
$prevTotalCharCount = $totalCharCount
$prevNormPages = $normPages

# Print a horizontal separator line
Write-Host ("-" * 98)

# Array of file paths (replace with your actual file paths)
$filePaths = @(
    ".\..\content\resume.tex"
)

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
	$wordCount = [math]::Round($charCount * (250 / 1800))
        Remove-Item $tempFile
        # Write-Output $text

        # Add to the character count array
        $fileCharCounts += [PSCustomObject]@{
            FileName = $filePath
            CharCount = $charCount
	    WordCount = $wordCount
        }

        # Add to total character count
        $totalCharCount += $charCount
    } else {
        # Add file with 0 char count if not found
        $fileCharCounts += [PSCustomObject]@{
            FileName = $filePath
            CharCount = 0
	    WordCount = 0
        }
    }
}

# Print the header for the table
Write-Host ("{0,-50} {1,15} {2,15}" -f "File Name", "Characters", "Words")

Write-Host ("-" * 82)

# Print each file's name, character count, and percentage
$fileCharCounts | ForEach-Object {
    Write-Host ("{0,-50} {1,15} {2,15}" -f $_.FileName, $_.CharCount, $_.WordCount)
}

# Print a horizontal separator line
Write-Host ("-" * 82)

# Calculate norm pages (total characters / 1800) and round up to two decimal places
$normPages = [math]::Ceiling(($totalCharCount / 1800) * 100) / 100

# Print the norm pages (rounded to two decimal places)
Write-Host ("{0,-50} {1,15}" -f "Norm pages", $normPages) pages

# calculate the percantge of the whole document
$percentage = if ($prevTotalCharCount -gt 0) { [math]::Round(($totalCharCount / $prevTotalCharCount) * 100, 2) } else { 0 }
# Print the percentage of the whole document
Write-Host ("{0,-50} {1,15}" -f "Percentage of the whole document", $percentage) %

# ================================= COPY END =================================