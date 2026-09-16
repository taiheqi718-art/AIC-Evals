$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing.Common

$width = 1280
$height = 640
$bitmap = [System.Drawing.Bitmap]::new($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

function New-Color([string]$hex, [int]$alpha = 255) {
    $value = $hex.TrimStart('#')
    [System.Drawing.Color]::FromArgb(
        $alpha,
        [Convert]::ToInt32($value.Substring(0, 2), 16),
        [Convert]::ToInt32($value.Substring(2, 2), 16),
        [Convert]::ToInt32($value.Substring(4, 2), 16)
    )
}

function New-RoundedPath([float]$x, [float]$y, [float]$w, [float]$h, [float]$r) {
    $path = [System.Drawing.Drawing2D.GraphicsPath]::new()
    $diameter = $r * 2
    $path.AddArc($x, $y, $diameter, $diameter, 180, 90)
    $path.AddArc($x + $w - $diameter, $y, $diameter, $diameter, 270, 90)
    $path.AddArc($x + $w - $diameter, $y + $h - $diameter, $diameter, $diameter, 0, 90)
    $path.AddArc($x, $y + $h - $diameter, $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    return $path
}

function Fill-RoundedRect($g, [System.Drawing.Brush]$brush, [float]$x, [float]$y, [float]$w, [float]$h, [float]$r) {
    $path = New-RoundedPath $x $y $w $h $r
    try { $g.FillPath($brush, $path) } finally { $path.Dispose() }
}

function Stroke-RoundedRect($g, [System.Drawing.Pen]$pen, [float]$x, [float]$y, [float]$w, [float]$h, [float]$r) {
    $path = New-RoundedPath $x $y $w $h $r
    try { $g.DrawPath($pen, $path) } finally { $path.Dispose() }
}

function Draw-StringAt($g, [string]$text, [System.Drawing.Font]$font, [System.Drawing.Brush]$brush, [float]$x, [float]$y) {
    $g.DrawString($text, $font, $brush, [System.Drawing.PointF]::new($x, $y))
}

$backgroundRectangle = [System.Drawing.Rectangle]::new(0, 0, $width, $height)
$backgroundBrush = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
    $backgroundRectangle,
    (New-Color '#07101a'),
    (New-Color '#101225'),
    24
)
$graphics.FillRectangle($backgroundBrush, $backgroundRectangle)

$cyanGlow = [System.Drawing.SolidBrush]::new((New-Color '#64d8ff' 30))
$violetGlow = [System.Drawing.SolidBrush]::new((New-Color '#a88bff' 27))
$graphics.FillEllipse($cyanGlow, -130, -130, 520, 500)
$graphics.FillEllipse($violetGlow, 920, -170, 520, 500)

$frameBrush = [System.Drawing.SolidBrush]::new((New-Color '#0a111d' 244))
$cardBrush = [System.Drawing.SolidBrush]::new((New-Color '#0d1625' 244))
$linePen = [System.Drawing.Pen]::new((New-Color '#94a3b8' 56), 1.2)
Fill-RoundedRect $graphics $frameBrush 40 32 1200 576 28
Stroke-RoundedRect $graphics $linePen 40 32 1200 576 28

$textBrush = [System.Drawing.SolidBrush]::new((New-Color '#f5f7fb'))
$softBrush = [System.Drawing.SolidBrush]::new((New-Color '#d9e2ed'))
$mutedBrush = [System.Drawing.SolidBrush]::new((New-Color '#9aa8bb'))
$cyanBrush = [System.Drawing.SolidBrush]::new((New-Color '#64d8ff'))
$greenBrush = [System.Drawing.SolidBrush]::new((New-Color '#45e0a8'))

$fontEyebrow = [System.Drawing.Font]::new('Cascadia Mono', 10, [System.Drawing.FontStyle]::Bold)
$fontTitle = [System.Drawing.Font]::new('Segoe UI', 35, [System.Drawing.FontStyle]::Bold)
$fontSubtitle = [System.Drawing.Font]::new('Segoe UI', 13, [System.Drawing.FontStyle]::Regular)
$fontBadge = [System.Drawing.Font]::new('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$fontLabel = [System.Drawing.Font]::new('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
$fontHero = [System.Drawing.Font]::new('Segoe UI', 54, [System.Drawing.FontStyle]::Bold)
$fontHeroDenominator = [System.Drawing.Font]::new('Segoe UI', 25, [System.Drawing.FontStyle]::Bold)
$fontStat = [System.Drawing.Font]::new('Segoe UI', 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = [System.Drawing.Font]::new('Segoe UI', 9, [System.Drawing.FontStyle]::Regular)
$fontChart = [System.Drawing.Font]::new('Segoe UI', 10, [System.Drawing.FontStyle]::Regular)
$fontChartValue = [System.Drawing.Font]::new('Cascadia Mono', 9.5, [System.Drawing.FontStyle]::Bold)

Draw-StringAt $graphics 'PUBLIC EVIDENCE BUNDLE' $fontEyebrow $cyanBrush 74 63
Draw-StringAt $graphics 'Qwen3.8-Flash × AIC' $fontTitle $textBrush 72 87
Draw-StringAt $graphics 'updo-policy-alerting · DeepSWE v1.1 · post-fix attempt 1' $fontSubtitle $mutedBrush 76 139

$badgeBrush = [System.Drawing.SolidBrush]::new((New-Color '#45e0a8' 22))
$badgePen = [System.Drawing.Pen]::new((New-Color '#45e0a8' 102), 1.2)
Fill-RoundedRect $graphics $badgeBrush 1011 68 181 43 21
Stroke-RoundedRect $graphics $badgePen 1011 68 181 43 21
$graphics.FillEllipse($greenBrush, 1030, 85, 9, 9)
Draw-StringAt $graphics 'VERIFIED · 17/17' $fontBadge $greenBrush 1050 79

Fill-RoundedRect $graphics $cardBrush 74 175 360 344 21
Stroke-RoundedRect $graphics $linePen 74 175 360 344 21
Fill-RoundedRect $graphics $cardBrush 452 175 740 344 21
Stroke-RoundedRect $graphics $linePen 452 175 740 344 21

Draw-StringAt $graphics 'CANONICAL RESULT' $fontLabel $mutedBrush 98 198
Draw-StringAt $graphics '17' $fontHero $textBrush 95 224
$heroSize = $graphics.MeasureString('17', $fontHero)
Draw-StringAt $graphics '/17' $fontHeroDenominator $mutedBrush (98 + $heroSize.Width) 249

$stats = @(
    @('123/123', 'P2P checks'),
    @('1.0', 'Reward'),
    @('$0.31', 'Model/API cost'),
    @('< 56m 55s', 'Effective time')
)
for ($index = 0; $index -lt $stats.Count; $index++) {
    $column = $index % 2
    $row = [math]::Floor($index / 2)
    $x = 98 + ($column * 160)
    $y = 349 + ($row * 72)
    Draw-StringAt $graphics $stats[$index][0] $fontStat $softBrush $x $y
    Draw-StringAt $graphics $stats[$index][1] $fontSmall $mutedBrush $x ($y + 27)
}

Draw-StringAt $graphics 'SAME-TASK SCORED PASSES' $fontLabel $softBrush 476 198
Draw-StringAt $graphics 'Official mini-swe-agent results · task-difficulty context' $fontSmall $mutedBrush 476 220

$models = @(
    @('GPT-6 Astra', 0.70, '14/20'),
    @('GPT-5.6 Sol', 0.60, '12/20'),
    @('Claude Opus 5', 0.40, '8/20'),
    @('Gemini 3.8 Flash', 0.00, '0/8'),
    @('Claude Fable 5', 0.00, '0/20'),
    @('Claude Sonnet 5', 0.00, '0/20')
)
$trackBrush = [System.Drawing.SolidBrush]::new((New-Color '#94a3b8' 33))
for ($index = 0; $index -lt $models.Count; $index++) {
    $y = 257 + ($index * 42)
    Draw-StringAt $graphics $models[$index][0] $fontChart $softBrush 476 $y
    Fill-RoundedRect $graphics $trackBrush 628 ($y + 6) 452 8 4
    $fillWidth = [float](452 * [double]$models[$index][1])
    if ($fillWidth -gt 0) {
        $barRectangle = [System.Drawing.Rectangle]::new(628, [int]($y + 6), [int]$fillWidth, 8)
        $barBrush = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
            $barRectangle,
            (New-Color '#a88bff'),
            (New-Color '#64d8ff'),
            0
        )
        Fill-RoundedRect $graphics $barBrush 628 ($y + 6) $fillWidth 8 4
        $barBrush.Dispose()
    }
    Draw-StringAt $graphics $models[$index][2] $fontChartValue $softBrush 1102 ($y - 1)
}

Draw-StringAt $graphics 'Exact patch · verifier totals · SHA-256 evidence · rubric notes' $fontSmall $softBrush 74 563
Draw-StringAt $graphics 'Different harness and sampling · not a controlled leaderboard' $fontSmall $mutedBrush 844 563

$outputPath = Join-Path $PSScriptRoot 'social-preview.png'
$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

foreach ($item in @(
    $fontEyebrow, $fontTitle, $fontSubtitle, $fontBadge, $fontLabel, $fontHero,
    $fontHeroDenominator, $fontStat, $fontSmall, $fontChart, $fontChartValue,
    $backgroundBrush, $cyanGlow, $violetGlow, $frameBrush, $cardBrush, $linePen,
    $textBrush, $softBrush, $mutedBrush, $cyanBrush, $greenBrush,
    $badgeBrush, $badgePen, $trackBrush
)) { $item.Dispose() }
$graphics.Dispose()
$bitmap.Dispose()

Write-Output $outputPath
