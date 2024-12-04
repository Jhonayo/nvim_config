-- Detectar el proyecto actual
local function detect_project()
    local cwd = vim.fn.getcwd()
    local project_name = cwd:match("^.+/(.+)$") -- Obtiene el nombre del directorio actual
    return project_name, cwd
end

-- Compilar y generar el archivo WAR FUNCIONAL
--local function build_project()
--    local project_name, cwd = detect_project()
--    print("Compilando proyecto: " .. project_name)
--    vim.cmd("! cd " .. cwd .. " && mvn clean package")
--end


local function build_project()
    local project_name, cwd = detect_project()
    print("Compilando proyecto: " .. project_name)

    -- Limpieza del directorio target antes de compilar
    local cmd = "rm -rf " .. cwd .. "/target/* && cd " .. cwd .. " && mvn clean package"

    -- Abrir terminal y ejecutar el comando
    vim.cmd("split term://" .. cmd)
end







-- Desplegar el archivo WAR en Tomcat FUNCIONAL

--local function deploy_project()
--    local project_name, cwd = detect_project()
--    local war_file = cwd .. "/target/" .. project_name .. "-1.0-SNAPSHOT.war"
--    local tomcat_webapps = "/opt/tomcat/apache-tomcat-10.1.33/webapps/"
--    print("Desplegando proyecto: " .. project_name)
--    vim.cmd("!  cp " .. war_file .. " " .. tomcat_webapps)
--end
local function deploy_project()
    local project_name, cwd = detect_project()

    -- Validar que el directorio actual sea válido
    if not cwd or cwd == "" then
        print("Error: No se pudo determinar el directorio actual del proyecto.")
        return
    end

    local target_dir = cwd .. "/target/"
    local tomcat_webapps = "/opt/tomcat/apache-tomcat-10.1.33/webapps/"

    -- Validar que el directorio target exista
    if vim.fn.isdirectory(target_dir) == 0 then
        print("Error: El directorio target no existe: " .. target_dir)
        return
    end

    -- Detectar el archivo WAR
    local handle = io.popen("ls " .. target_dir .. "*.war")
    if not handle then
        print("Error al intentar buscar el archivo WAR en: " .. target_dir)
        return
    end

    local war_file = handle:read("*a"):gsub("%s+", "") -- Elimina saltos de línea o espacios
    handle:close()

    if war_file == "" then
        print("No se encontró ningún archivo WAR en: " .. target_dir)
        return
    end

    -- Validar que el directorio de Tomcat sea válido
    if vim.fn.isdirectory(tomcat_webapps) == 0 then
        print("Error: El directorio de Tomcat no es válido: " .. tomcat_webapps)
        return
    end

    -- Renombrar el archivo WAR al nombre del proyecto
    local renamed_war = target_dir .. project_name .. ".war"
    vim.cmd("!mv " .. war_file .. " " .. renamed_war)

    -- Comando para limpiar y copiar el WAR renombrado
    local cmd = "rm -rf " .. tomcat_webapps .. project_name .. "* && " ..
                "cp " .. renamed_war .. " " .. tomcat_webapps .. " && " ..
                "echo Proyecto desplegado en: http://localhost:8080/" .. project_name


    print("Ejecutando comando: " .. cmd)

    -- Ejecutar el comando en una terminal inferior
    vim.cmd("split | terminal " .. cmd)
end





--intento para mejora de funcion
--local function deploy_project()
   -- local project_name, cwd = detect_project()
   -- local target_dir = cwd .. "/target/"
   -- local tomcat_webapps = "/opt/tomcat/apache-tomcat-10.1.33/webapps/"

    -- Buscar cualquier archivo WAR generado en el directorio target
   -- local handle = io.popen("ls " .. target_dir .. "*.war")
  --  local war_file = handle:read("*a"):gsub("%s+", "") -- Elimina saltos de línea o espacios en blanco
   -- handle:close()

   -- if war_file == "" then
    --    print("No se encontró ningún archivo WAR en: " .. target_dir)
     --   return
   -- end

    -- Renombrar el archivo WAR al nombre del proyecto
   -- local renamed_war = target_dir .. project_name .. ".war"
    --vim.cmd("!mv " .. war_file .. " " .. renamed_war)

    -- Limpiar el directorio webapps para evitar conflictos
  --  vim.cmd("!rm -rf " .. tomcat_webapps .. project_name .. "*")

    -- Copiar el archivo WAR renombrado al directorio de Tomcat
--    print("Desplegando proyecto: " .. renamed_war)
--    vim.cmd("!cp " .. renamed_war .. " " .. tomcat_webapps)
--end










-- Recargar el proyecto en Tomcat sin reiniciar el servidor
local function reload_project()
    local project_name = detect_project()
    local tomcat_manager_url = "http://localhost:8080/manager/text/reload?path=/" .. project_name
    local auth = "admin:password" -- Reemplaza con tu usuario y contraseña del Manager de Tomcat
    vim.cmd("! curl -u " .. auth .. " " .. tomcat_manager_url)
end

-- Iniciar Tomcat
local function start_tomcat()
    print("Iniciando Tomcat...")
    vim.cmd("! /opt/tomcat/apache-tomcat-10.1.33/bin/startup.sh")
end

-- Detener Tomcat
local function stop_tomcat()
    print("Deteniendo Tomcat...")
    vim.cmd("! /opt/tomcat/apache-tomcat-10.1.33/bin/shutdown.sh")
end

-- Función para compilar, desplegar y reiniciar Tomcat automáticamente 
local function auto_deploy_project()
  -- Compilar el proyecto 
  build_project()
  -- Desplegar el proyecto 
  deploy_project()
  -- Detener Tomcat 
  stop_tomcat()
  -- Iniciar Tomcat 
  start_tomcat()
  print("Proyecto desplegado y Tomcat reiniciado exitosamente.")
end

-- Exportar funciones
return {
    build_project = build_project,
    deploy_project = deploy_project,
    reload_project = reload_project,
    start_tomcat = start_tomcat,
    stop_tomcat = stop_tomcat,
  auto_deploy_project = auto_deploy_project,
}

