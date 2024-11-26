local M = {}

-- Función para detectar la clase principal desde el archivo abierto
local function get_main_class()
  local filepath = vim.fn.expand("%:p") -- Ruta completa del archivo actual
  local project_root = require("jdtls.setup").find_root({ ".git", "pom.xml", "build.gradle" }) -- Detectar la raíz del proyecto

  if not project_root or not filepath:find(project_root, 1, true) then
    print("No se pudo determinar la raíz del proyecto.")
    return nil
  end

  -- Obtener la ruta relativa desde la raíz del proyecto
  local relative_path = filepath:sub(#project_root + 2)
  -- Eliminar src/main/java/ y reemplazar / por .
  local classname = relative_path:gsub("^src/main/java/", ""):gsub("/", "."):gsub("\\", "."):gsub("%.java$", "")

  return classname
end

-- Ejecutar un proyecto Maven con detección dinámica
function M.run_main()
  local classname = get_main_class()
  if not classname or classname == "" then
    print("No se pudo determinar la clase principal.")
    return
  end

  -- Comando para Maven
  local cmd = string.format("mvn exec:java -Dexec.mainClass=%s", classname)

  -- Abrir terminal y ejecutar el comando
  vim.cmd("split term://" .. cmd)
end

return M

