defmodule Noizu.Core do
  defmacro __using__(_) do
    quote do
      require Noizu.EntityReference.Records

      alias Noizu.EntityReference.Protocol, as: ERP
      alias Noizu.EntityReference.Records, as: R

      require Noizu.Context.Records
      import Noizu.Context.Records
      import Noizu.Context
    end
  end
end