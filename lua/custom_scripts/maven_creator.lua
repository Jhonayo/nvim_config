local M = {}

-- Función para obtener las versiones de Java instaladas
local function get_java_versions()
  local output = vim.fn.systemlist("update-alternatives --list java")
  local versions = {}
  for _, path in ipairs(output) do
    local version = path:match("/java%-(%d+)")
    if version then
      table.insert(versions, version)
    end
  end
  return versions
end

function M.create_maven_project()
  local project_name = vim.fn.input("Nombre del proyecto Maven: ")
  local group_id = vim.fn.input("Group ID (paquete base): ", "com.example")
  local artifact_id = vim.fn.input("Artifact ID (nombre del artefacto): ", project_name)
  local version = vim.fn.input("Versión del proyecto (default 1.0-SNAPSHOT): ", "1.0-SNAPSHOT")

  -- Obtener versiones de Java instaladas
  local java_versions = get_java_versions()
  if #java_versions == 0 then
    print("No se encontraron versiones de Java instaladas.")
    return
  end

  -- Preguntar por la versión de Java
  print("Selecciona la versión de Java:")
  for i, v in ipairs(java_versions) do
    print(i .. ": Java " .. v)
  end
  local java_choice = tonumber(vim.fn.input("Elige una opción (1-" .. #java_versions .. "): "))
  local selected_java = java_versions[java_choice] or "17"

  -- Generar comando de Maven
  local cmd = string.format(
    "mvn archetype:generate -DgroupId=%s -DartifactId=%s -Dversion=%s -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false",
    group_id, artifact_id, version
  )

  -- Ejecutar el comando
  vim.fn.system(cmd)

  -- Modificar el archivo `pom.xml` para incluir la versión de Java seleccionada
  local pom_path = artifact_id .. "/pom.xml"
  local pom_file = io.open(pom_path, "r+")
  if pom_file then
    local pom_content = pom_file:read("*a")
    pom_file:close()
    pom_content = pom_content:gsub(
      "</project>",
      string.format(
        [[
  <properties>
    <maven.compiler.source>%s</maven.compiler.source>
    <maven.compiler.target>%s</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>
</project>]],
        selected_java, selected_java
      )
    )
    pom_file = io.open(pom_path, "w")
    pom_file:write(pom_content)
    pom_file:close()
    print("Proyecto Maven creado con Java " .. selected_java .. " en: " .. artifact_id)
    vim.cmd("e " .. artifact_id)
  else
    print("No se pudo modificar el pom.xml.")
  end
end


return M

