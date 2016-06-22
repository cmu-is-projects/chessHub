ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ChessHub.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ChessHub.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ChessHub.Repo)
