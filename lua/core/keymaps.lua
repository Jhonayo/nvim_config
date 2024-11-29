-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local wk = require("which-key")

--Menu de atajos
wk.add({
  {"<leader>f",group = "[F]ile"},
  {"<leader>j",group = "[J]ava"},
    {"<leader>jc",group = "[N]ew"},
    {"<leader>js",group = "[S]erverlet"},
  {"<leader>s",group = "[V]entanas"},
  {"<leader>c",group = "[C]ode"},
  {"<leader>e",group = "[E]xplorer"},
  {"<leader>h",group = "[H]arpoon"},

})


-- Personal de juan
keymap.set({'i','v'}, "jk", "<ESC>",{desc = "Exit insert mode with jk"})
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Mapeos generales
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Guardar y salir" })
keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Salir sin guardar" })
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Guardar" })
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Abrir URL bajo el cursor" })

-- Gestión de ventanas divididas
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit [V]ertical" })
keymap.set("n", "<leader>sw", "<C-w>s",{ desc = "[S]plit [H]orizontalmente" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "[S]plit [E]qualize sizes" })
keymap.set("n", "<leader>sc", ":close<CR>", { desc = "[C]lose [S]plit" })
keymap.set("n", "<leader>sj", "2<C-w>-", { desc = "[S]plit [J]reduce height" })
keymap.set("n", "<leader>sk", "2<C-w>+", { desc = "[S]plit [K]increase height" })
keymap.set("n", "<leader>sh", "2<C-w><", { desc = "[S]plit [H]reduce width" })
keymap.set("n", "<leader>sl", "2<C-w>>", { desc = "[S]plit [L]increase width" })

-- Gestión de pestañas
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Abrir una nueva pestaña" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Cerrar una pestaña" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Ir a la siguiente pestaña" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Ir a la pestaña anterior" })

--Code organizacion
keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = "Mostrar acciones de código" })
keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = "Renombrar símbolo" })
keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = "Formatear archivo actual" })
keymap.set('v', '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = "Formatear selección actual" })

-- Mapeos de diferencias
keymap.set("n", "<leader>rc", ":diffput<CR>", { desc = "Aplicar diff desde el actual al otro" })
keymap.set("n", "<leader>rj", ":diffget 1<CR>", { desc = "Obtener diff desde la izquierda (local)" })
keymap.set("n", "<leader>rk", ":diffget 3<CR>", { desc = "Obtener diff desde la derecha (remoto)" })
keymap.set("n", "<leader>rn", "]c", { desc = "Siguiente diferencia" })
keymap.set("n", "<leader>rp", "[c", { desc = "Diferencia anterior" })

-- Mapeos de lista rápida (Quickfix)
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Abrir lista rápida" })
keymap.set("n", "<leader>qf", ":cfirst<CR>", { desc = "Ir al primer elemento de la lista rápida" })
keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "Ir al siguiente elemento de la lista rápida" })
keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "Ir al elemento anterior de la lista rápida" })
keymap.set("n", "<leader>ql", ":clast<CR>", { desc = "Ir al último elemento de la lista rápida" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Cerrar lista rápida" })

--/////////////////////////////////////////////////////
-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Maximizar/Restaurar ventana" }) -- toggle maximize tab

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Abrir/Cerrar [E]xplorador de archivos" }) -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", { desc = "Focalizar explorador de archivos" } ) -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Buscar archivo en explorador" }) -- find file in file explorer

-- Telescope
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = "Buscar archivos" })
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Búsqueda por texto" })
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = "Listar buffers" })
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = "Buscar en ayuda" })
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, { desc = "Buscar en buffer actual" })
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, { desc = "Buscar símbolos en documento" })
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, { desc = "Buscar llamadas entrantes" })
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({ default_text = ":method:" }) end, { desc = "Buscar métodos en árboles" })

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Alternar blame de Git" })

-- Harpoon OK
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[H]arpoon [A]dd file" })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "[H]arpoon [H]arpoon menu" })
vim.keymap.set("n", "<leader>hr", mark.rm_file, { desc = "[H]arpoon [R]emove current file" })

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "[H]arpoon go to file [1]" })
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "[H]arpoon go to file [2]" })
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "[H]arpoon go to file [3]" })
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "[H]arpoon go to file [4]" })
vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end, { desc = "[H]arpoon go to file [5]" })
vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end, { desc = "[H]arpoon go to file [6]" })
vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end, { desc = "[H]arpoon go to file [7]" })
vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end, { desc = "[H]arpoon go to file [8]" })
vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end, { desc = "[H]arpoon go to file [9]" })

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>", { desc = "Ejecutar consulta REST" } ) -- Run REST query

-- LSP (Lenguaje de Servidor Específico)
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = "Mostrar documentación flotante" })
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = "Ir a la definición del símbolo" })
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = "Ir a la declaración del símbolo" })
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "Ir a la implementación del símbolo" })
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = "Ir a la definición del tipo" })
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = "Listar referencias del símbolo" })
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Mostrar ayuda de firma de función" })



keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "Mostrar diagnósticos en una ventana flotante" })
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = "Ir al diagnóstico anterior" })
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = "Ir al siguiente diagnóstico" })
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { desc = "Listar símbolos en el documento" })
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', { desc = "Mostrar autocompletado" })




-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
  keymap.set("n", '<leader>jo', function ()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports();
  end
end, { desc = "Organizar importaciones en archivos Java" })

keymap.set("n", '<leader>ju', function ()
  if vim.bo.filetype == 'java' then
    require('jdtls').update_project_config();
  end
end, { desc = "Actualizar configuración del proyecto Java" })

keymap.set("n", '<leader>jt', function ()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class();
  end
end, { desc = "Ejecutar pruebas de la clase actual (Java)" })

keymap.set("n", '<leader>jm', function ()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method();
  end
end, { desc = "Ejecutar prueba del método más cercano (Java)" })

-- Mapeo para compilar y ejecutar la clase actual (solo en archivos Java)
keymap.set("n", "<leader>jw", function()
  if vim.bo.filetype == "java" then
    -- Obtener la ruta completa del archivo actual
    local filepath = vim.fn.expand("%:p")

    -- Obtener el directorio raíz del proyecto (asume que "src" está en la raíz)
    local root_dir = vim.fn.fnamemodify(filepath, ":h"):match(".*src")

    -- Obtener el nombre completo del paquete (basado en la ruta del archivo)
    local classname = filepath
      :gsub(root_dir .. "/", "")         -- Elimina la parte inicial de la ruta
      :gsub("%.java$", "")              -- Elimina la extensión .java
      :gsub("/", ".")                   -- Convierte las barras en puntos

    -- Comando para compilar todas las clases relacionadas
    local compile_cmd = "javac -d bin -sourcepath src " .. filepath

    -- Comando para ejecutar la clase principal
    local run_cmd = "java -cp bin " .. classname

    -- Abrir una terminal dividida en la parte inferior y ejecutar los comandos
    vim.cmd("split term://" .. compile_cmd .. " && " .. run_cmd)
  else
    print("Este comando solo está disponible para archivos Java.")
  end
end, { desc = "[R]un [J]ava" })

-- Creacion de proyecto Maven personalizado
keymap.set("n", "<leader>jcm", function()
require("custom_scripts.maven_creator").create_maven_project()
end, { desc = "Crear un proyecto Maven" })

--ejecutar clases java con dap
vim.keymap.set("n", "<leader>jf", function()
  require("custom_scripts.run_java").run_main_without_debug()
end, { desc = "Ejecutar método main (sin depuración)" })

vim.keymap.set("n", "<leader>jx", function()
  require("custom_scripts.run_java").run_main()
end, { desc = "[R]un [J]ava Maven" })


-- Debugging ee
-- Mapeos para depuración (DAP - Debug Adapter Protocol)
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Alternar un punto de interrupción en la línea actual" })
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", { desc = "Establecer un punto de interrupción condicional" })
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", { desc = "Establecer un punto de registro (log point)" })
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Eliminar todos los puntos de interrupción" })
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "Listar todos los puntos de interrupción" })
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continuar la ejecución del programa" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Ejecutar la siguiente instrucción (paso por encima)" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Entrar en la siguiente instrucción (paso hacia adentro)" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Salir del alcance actual (paso hacia afuera)" })
keymap.set("n", "<leader>dd", function() require('dap').disconnect(); require('dapui').close(); end, { desc = "Desconectar la sesión de depuración y cerrar la interfaz de usuario" })
keymap.set("n", "<leader>dt", function() require('dap').terminate(); require('dapui').close(); end, { desc = "Terminar la sesión de depuración y cerrar la interfaz de usuario" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Abrir o cerrar la consola REPL de depuración" })
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Ejecutar nuevamente la última configuración de depuración" })
keymap.set("n", "<leader>di", function() require "dap.ui.widgets".hover() end, { desc = "Mostrar información de depuración sobre el elemento bajo el cursor" })
keymap.set("n", "<leader>d?", function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end, { desc = "Mostrar variables en una ventana flotante centrada" })
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "Listar los marcos de la pila de llamadas (stack frames)" })
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "Listar comandos disponibles para DAP" })
keymap.set("n", "<leader>de", function() require('telescope.builtin').diagnostics({default_text=":E:"}) end, { desc = "Buscar y mostrar diagnósticos con Telescope" })

-- tomcat
--local tomcat = require("custom_scripts.tomcat_connection")
vim.api.nvim_set_keymap("n", "<leader>jsb", ":lua require('custom_scripts.tomcat_connection').build_project()<CR>",{desc = "[B]uilt}"})
vim.api.nvim_set_keymap("n", "<leader>jsd", ":lua require('custom_scripts.tomcat_connection').deploy_project()<CR>",{desc = "[D]eploy"})
vim.api.nvim_set_keymap("n", "<leader>jsr", ":lua require('custom_scripts.tomcat_connection').reload_project()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>jss", ":lua require('custom_scripts.tomcat_connection').start_tomcat()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>jst", ":lua require('custom_scripts.tomcat_connection').stop_tomcat()<CR>", { noremap = true, silent = true })
-- Keymap para la función de despliegue automático
vim.api.nvim_set_keymap("n", "<leader>jsp", ":lua require('custom_scripts.tomcat_connection').auto_deploy_project()<CR>", { noremap = true, silent = true })

