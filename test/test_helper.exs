ExUnit.start

# Removed for ecto 2.0
# Mix.Task.run "ecto.create", ~w(-r ChessHub.Repo --quiet)
# Mix.Task.run "ecto.migrate", ~w(-r ChessHub.Repo --quiet)

# Ecto 2 replacement
# Ecto.Adapters.SQL.begin_test_transaction(ChessHub.Repo)
Ecto.Adapters.SQL.Sandbox.mode(ChessHub.Repo, :manual)
