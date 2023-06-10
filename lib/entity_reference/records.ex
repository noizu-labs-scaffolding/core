defmodule Noizu.EntityReference.Records do
  require Record
  Record.defrecord(:ref, [module: nil, identifier: nil])
end