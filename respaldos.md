-- Mapeo para compilar y ejecutar la clase actual
--keymap.set("n", "<leader>rm", function()
  -- Obtener la ruta completa del archivo actual
  --local filepath = vim.fn.expand("%:p")

  -- Obtener el directorio raíz del proyecto (asume que "src" está en la raíz)
  --local root_dir = vim.fn.fnamemodify(filepath, ":h"):match(".*src")

  -- Obtener el nombre completo del paquete (basado en la ruta del archivo)
  --local classname = filepath
   -- :gsub(root_dir .. "/", "")         -- Elimina la parte inicial de la ruta
    --:gsub("%.java$", "")              -- Elimina la extensión .java
    --:gsub("/", ".")                   -- Convierte las barras en puntos

    -- Comando para compilar todas las clases relacionadas
  --local compile_cmd = "javac -d bin -sourcepath src " .. filepath

  -- Comando para ejecutar la clase principal
  --local run_cmd = "java -cp bin " .. classname

  -- Abrir una terminal dividida en la parte inferior y ejecutar los comandos
  --vim.cmd("split term://" .. compile_cmd .. " && " .. run_cmd)
--end, { desc = "Compilar y ejecutar clase con método Main" })



