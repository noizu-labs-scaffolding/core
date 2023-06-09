defmodule Noizu.EntityReference.Records do
  require Record
  Record.defrecord(:ref, [handler: nil, identifier: nil])
end