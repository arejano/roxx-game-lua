debug_ui = {}

button = {
    x = 10,
    y = 10,
    width = 100,
    height = 30,
    label = "Click Me",
    bgColor = { 0.2, 0.6, 1 },
    borderColor = { 1, 1, 1 },
    textColor = { 1, 1, 1 }
}

function debug_ui:button(buton)
    love.graphics.setColor(button.bgColor)
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)

    -- Desenhar a borda do botão
    love.graphics.setColor(button.borderColor)
    love.graphics.setLineWidth(1)
    love.graphics.rectangle("line", button.x, button.y, button.width, button.height)

    -- Desenhar o label do botão
    love.graphics.setColor(button.textColor)
    love.graphics.printf(button.label, button.x, button.y + button.height / 2 - 6, button.width, "center")
end

return debug_ui
