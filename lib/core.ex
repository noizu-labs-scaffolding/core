defmodule Noizu.Core do
  @moduledoc """
  Core module for Noizu.

  〚📦:𓔣𓳓𔍯𓙝〛 Noizu.Core :: Core module for Noizu.
  """

  @doc """
  How: takes `_`

  〚🔧:𓸲𓕈𔔥𓰴〛 __using__ :: __using__/1
  """
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
