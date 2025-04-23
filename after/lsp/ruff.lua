return {
  on_attach = function(client, _)
    -- Pyright provides hover
    client.server_capabilities.hoverProvider = false
  end,
}
