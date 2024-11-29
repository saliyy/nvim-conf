local function get_test_config(test_name, custom_env)
    -- Если custom_env не передан, устанавливаем его как пустую таблицу
    custom_env = custom_env or {}
    
    -- Объединяем стандартную переменную окружения с пользовательскими
    print(custom_env)

    -- Объединяем стандартные переменные окружения с пользовательскими
    for key, value in pairs(custom_env) do
        env[key] = value
    end

    return {
        type = 'go',
        name = 'Debug ' .. test_name,
        request = 'launch',
        mode = 'test',
        program = '${workspaceFolder}',
        args = { '-run', test_name },
        env = env,
    }
end
