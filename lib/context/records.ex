defmodule Noizu.Context.Records do
  require Record
  Record.defrecord(:context, [caller: nil, ts: nil, token: nil, reason: nil, roles: nil])
end