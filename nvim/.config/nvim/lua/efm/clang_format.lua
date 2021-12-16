local command = string.format('%s ${INPUT}', "/usr/bin/clang-format")

return {formatCommand = command, formatStdin = true}

