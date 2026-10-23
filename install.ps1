# ==============================================================================
# ZCODE :: AUTONOMOUS POWER CORE & JAILBREAK ENGINE (WINDOWS)
# Operator: Hengki · Core: Protocol v2.5 · Systems & Dual-Use Technical Unlock
# ==============================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ESC = [char]27
$C_RESET = "$ESC[0m"
$C_BOLD  = "$ESC[1m"
$G_CYAN  = "$ESC[38;2;56;189;248m"
$G_MINT  = "$ESC[38;2;74;222;128m"
$G_DARK  = "$ESC[38;2;115;115;125m"
$G_AMBER = "$ESC[38;2;245;158;11m"

Write-Host "`n$G_CYAN$C_BOLD=== [ZCode Autonomous Power Core Installer v2.5] ===$C_RESET"
Write-Host "$G_DARKDeploying global AGENTS.md, slash commands, and systems skills...$C_RESET`n"

$ScriptDir = $PSScriptRoot
if (-not $ScriptDir) { $ScriptDir = (Get-Location).Path }

$ZCodeRoot    = Join-Path $env:USERPROFILE ".zcode"
$CommandsDir  = Join-Path $ZCodeRoot "commands"
$SkillsDir    = Join-Path $ZCodeRoot "skills"
$CliDir       = Join-Path $ZCodeRoot "cli"
$AgentsRoot   = Join-Path $env:USERPROFILE ".agents"

# Create directories
foreach ($dir in @($CommandsDir, $SkillsDir, $CliDir, (Join-Path $AgentsRoot "commands"), (Join-Path $AgentsRoot "skills"))) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# 1. Deploy Global AGENTS.md
$SourceAgents = Join-Path $ScriptDir "AGENTS.md"
if (Test-Path $SourceAgents) {
    Copy-Item -Path $SourceAgents -Destination (Join-Path $ZCodeRoot "AGENTS.md") -Force
    Write-Host "$G_MINT[OK]$C_RESET Deployed Core Instructions -> $ZCodeRoot\AGENTS.md"
} else {
    Write-Host "$G_AMBER[WARN]$C_RESET AGENTS.md not found in script directory."
}

# 2. Deploy Slash Commands
$SourceCommands = Join-Path $ScriptDir ".zcode\commands"
if (Test-Path $SourceCommands) {
    Copy-Item -Path "$SourceCommands\*" -Destination $CommandsDir -Recurse -Force
    Copy-Item -Path "$SourceCommands\*" -Destination (Join-Path $AgentsRoot "commands") -Recurse -Force
    Write-Host "$G_MINT[OK]$C_RESET Injected Slash Commands (/godmode, /deep, /re, /systems, /audit, /telemetry)"
}

# 3. Deploy Skills
$SourceSkills = Join-Path $ScriptDir ".zcode\skills"
if (Test-Path $SourceSkills) {
    Copy-Item -Path "$SourceSkills\*" -Destination $SkillsDir -Recurse -Force
    Copy-Item -Path "$SourceSkills\*" -Destination (Join-Path $AgentsRoot "skills") -Recurse -Force
    Write-Host "$G_MINT[OK]$C_RESET Installed Skills (systems-core, binary-triage)"
}

# 4. Configure CLI Environment
$ConfigFile = Join-Path $CliDir "config.json"
$ConfigData = @{
    skills = @{ enabled = $true }
    hooks  = @{ enabled = $true }
    plugins = @{}
} | ConvertTo-Json -Depth 4
[System.IO.File]::WriteAllText($ConfigFile, $ConfigData, [System.Text.Encoding]::UTF8)
Write-Host "$G_MINT[OK]$C_RESET Activated Engine Hooks & Skills in $ConfigFile"

Write-Host "`n$G_CYAN$C_BOLD[!] Installation Succeeded.$C_RESET"
Write-Host "$G_DARKPlease restart the ZCode application to refresh active memory buffers.$C_RESET`n"
