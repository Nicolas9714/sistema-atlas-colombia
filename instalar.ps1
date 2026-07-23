<#
.SYNOPSIS
    Instala skills de los atlas sectoriales del Sistema Atlas Colombia.

.DESCRIPTION
    Copia las skills de uno o varios atlas sectoriales (subcarpetas atlas/<alias>
    de este monorepo) hacia una carpeta destino, típicamente dentro del proyecto
    del usuario (ej. .claude\skills para Claude Code, .agents\skills para Codex).

    Compatible con Windows PowerShell 5.1.

.EXAMPLE
    .\instalar.ps1 -Atlas ambiental

.EXAMPLE
    .\instalar.ps1 -Atlas todos -Actualizar

.EXAMPLE
    .\instalar.ps1 -Atlas ambiental -Entidad navegar-anla -Global
#>

param(
    [Parameter(Mandatory)] [string[]] $Atlas,
    [string]   $Destino = ".claude\skills",
    [string[]] $Entidad,
    [switch]   $Global,
    [switch]   $Actualizar
)

$ErrorActionPreference = "Stop"

# Tabla de atlas registrados: alias -> nombre de la subcarpeta bajo atlas/.
# Al registrar un atlas nuevo, agregar una línea aquí.
$atlasRegistrados = @{
    "ambiental"          = "ambiental"
    "minero-energetico"  = "minero-energetico"
}

# En el monorepo, las skills de cada atlas viven en atlas/<alias>/skills,
# relativo a la raíz donde está este script.
$raizAtlas = Join-Path $PSScriptRoot "atlas"

# --- Expandir "todos" y resolver alias pedidos ---
$aliasPedidos = @()
foreach ($a in $Atlas) {
    if ($a -eq "todos") {
        foreach ($clave in $atlasRegistrados.Keys) {
            $aliasPedidos += $clave
        }
    } else {
        $aliasPedidos += $a
    }
}
$aliasPedidos = @($aliasPedidos | Select-Object -Unique)

# --- Validación: alias desconocidos ---
$aliasValidos = $atlasRegistrados.Keys
foreach ($a in $aliasPedidos) {
    if (-not $atlasRegistrados.ContainsKey($a)) {
        Write-Host "Error: el alias de atlas '$a' no existe." -ForegroundColor Red
        Write-Host "Alias válidos: $($aliasValidos -join ', '), todos"
        exit 1
    }
}

# --- Validación: subcarpetas de atlas existen en el monorepo ---
foreach ($a in $aliasPedidos) {
    $carpeta = $atlasRegistrados[$a]
    $rutaAtlas = Join-Path $raizAtlas $carpeta
    if (-not (Test-Path $rutaAtlas)) {
        Write-Host "Error: no se encontró la carpeta del atlas '$a' en $rutaAtlas" -ForegroundColor Red
        Write-Host "Debería existir en este monorepo; verifica que el checkout esté completo."
        exit 1
    }
}

# --- Validación: -Entidad solo con un atlas ---
if ($Entidad -and $aliasPedidos.Count -gt 1) {
    Write-Host "Error: -Entidad solo se puede usar con un único atlas." -ForegroundColor Red
    exit 1
}

# --- Validación: carpetas de -Entidad existen dentro del atlas ---
if ($Entidad) {
    $carpetaAtlas = $atlasRegistrados[$aliasPedidos[0]]
    $rutaSkills = Join-Path (Join-Path $raizAtlas $carpetaAtlas) "skills"
    $skillsDisponibles = Get-ChildItem -Path $rutaSkills -Directory | ForEach-Object { $_.Name }
    foreach ($e in $Entidad) {
        if ($skillsDisponibles -notcontains $e) {
            Write-Host "Error: la skill '$e' no existe en $rutaSkills" -ForegroundColor Red
            Write-Host "Skills disponibles: $($skillsDisponibles -join ', ')"
            exit 1
        }
    }
}

# --- Resolver destino efectivo ---
if ([IO.Path]::IsPathRooted($Destino)) {
    $destinoEfectivo = [IO.Path]::GetFullPath($Destino)
} elseif ($Global) {
    $destinoEfectivo = Join-Path $env:USERPROFILE $Destino
} else {
    $destinoEfectivo = Join-Path (Get-Location) $Destino
}

# --- Actualizar repos fuente (y este repo) antes de copiar ---
if ($Actualizar) {
    Write-Host "Actualizando el monorepo (Sistema Atlas Colombia)..."
    git -C $PSScriptRoot pull
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Advertencia: git pull falló en $PSScriptRoot, se continúa con la versión local." -ForegroundColor Yellow
    }
}

# --- Copia ---
if (-not (Test-Path $destinoEfectivo)) {
    New-Item -ItemType Directory -Force -Path $destinoEfectivo | Out-Null
}

function Copy-SkillExacta {
    param(
        [Parameter(Mandatory)] [string] $Origen,
        [Parameter(Mandatory)] [string] $Nombre
    )

    if ($Nombre -notmatch '^[a-z0-9-]+$') {
        throw "Nombre de skill no seguro: '$Nombre'."
    }

    $destinoSkill = Join-Path $destinoEfectivo $Nombre
    if (Test-Path -LiteralPath $destinoSkill) {
        Remove-Item -LiteralPath $destinoSkill -Recurse -Force
    }
    Copy-Item -LiteralPath $Origen -Destination $destinoSkill -Recurse -Force
}

$instaladas = @()

foreach ($a in $aliasPedidos) {
    $carpeta = $atlasRegistrados[$a]
    $rutaSkills = Join-Path (Join-Path $raizAtlas $carpeta) "skills"

    if ($Entidad) {
        foreach ($e in $Entidad) {
            $origen = Join-Path $rutaSkills $e
            Copy-SkillExacta -Origen $origen -Nombre $e
            $instaladas += [PSCustomObject]@{ Skill = $e; Atlas = $a }
        }
    } else {
        Get-ChildItem -Path $rutaSkills -Directory | ForEach-Object {
            Copy-SkillExacta -Origen $_.FullName -Nombre $_.Name
            $instaladas += [PSCustomObject]@{ Skill = $_.Name; Atlas = $a }
        }
    }
}

# --- Regla de composición: 2+ atlas => copiar también la orquestadora nacional ---
if ($aliasPedidos.Count -gt 1) {
    $rutaOrquestador = Join-Path $PSScriptRoot "atlas\nacional\skills\atlas-orquestador-colombia"
    Copy-SkillExacta -Origen $rutaOrquestador -Nombre "atlas-orquestador-colombia"
    $instaladas += [PSCustomObject]@{ Skill = "atlas-orquestador-colombia"; Atlas = "sistema-atlas-colombia" }
}

# --- Higiene: aviso de carpeta vieja sin sufijo de sector ---
$rutaVieja = Join-Path $destinoEfectivo "atlas-orquestador"
if (Test-Path $rutaVieja) {
    Write-Host ""
    Write-Host "Advertencia: se encontró '$rutaVieja', de una versión anterior de la orquestadora." -ForegroundColor Yellow
    Write-Host "Si ya no la necesitas, bórrala manualmente con:"
    Write-Host "  Remove-Item -Recurse '$rutaVieja'"
}

# --- Reporte final ---
Write-Host ""
Write-Host "Skills instaladas en $destinoEfectivo :"
foreach ($item in $instaladas) {
    Write-Host "  - $($item.Skill) (de $($item.Atlas))"
}
Write-Host ""
Write-Host "Verifica la instalación con /skills en Claude Code."
