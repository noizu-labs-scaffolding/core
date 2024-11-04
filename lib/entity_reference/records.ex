defmodule Noizu.EntityReference.Records do
  require Record
  Record.defrecord(:ref, [module: nil, id: nil])
end
