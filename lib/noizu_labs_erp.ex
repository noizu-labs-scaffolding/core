
defmodule NoizuLabs.EntityReference.Helpers do
  @moduledoc false

  def ok?(result, requirement \\ :required)
  def ok?({:ok, v}, _), do: v
  def ok?(result = {:error, _}, requirement), do: raise NoizuLabs.EntityReference.ResultException, result: result, requirement: requirement
  def ok?(result, requirement), do: raise NoizuLabs.EntityReference.ResultException, result: {:error, {:invalid_tuple, result}}, requirement: requirement
end

defmodule NoizuLabs.EntityReference.Records do
  require Record
  Record.defrecord(:ref, [handler: nil, identifier: nil])
end

defprotocol NoizuLabs.EntityReference.Protocol do
  @fallback_to_any true
  def id(subject)
  def ref(subject)
  def sref(subject)
  def entity(subject, context)
end

defimpl  NoizuLabs.EntityReference.Protocol, for: Tuple do
  require NoizuLabs.EntityReference.Records
  alias NoizuLabs.EntityReference.Records, as: R
  def id(R.ref(handler: h) = subject) do
    apply(h, :id, [subject])
  end
  def ref(R.ref(handler: h) = subject) do
    apply(h, :ref, [subject])
  end
  def sref(R.ref(handler: h) = subject) do
    apply(h, :sref, [subject])
  end
  def entity(R.ref(handler: h) = subject, context) do
    apply(h, :entity, [subject, context])
  end
end

defimpl  NoizuLabs.EntityReference.Protocol, for: Any do
  def id(subject), do: {:error, {:unsupported, subject}}
  def ref(subject), do: {:error, {:unsupported, subject}}
  def sref(subject), do: {:error, {:unsupported, subject}}
  def entity(subject, _), do: {:error, {:unsupported, subject}}

  defmacro __deriving__(module, struct, options) do
    deriving(module, struct, options)
  end
  def deriving(module, struct, options) do
    # we should be defining a provider rather than requiring these methods be defined for each struct
    quote do
      defimpl  NoizuLabs.EntityReference.Protocol, for: [unquote(module)] do
        def id(subject), do: apply(unquote(module), :id, [subject])
        def ref(subject), do: apply(unquote(module), :ref, [subject])
        def sref(subject), do: apply(unquote(module), :sref, [subject])
        def entity(subject, context), do: apply(unquote(module), :entity, [subject, context])
      end
    end
  end

end


defmodule NoizuLabs.EntityReference do
  defmodule ProtocolException do
    defexception [ref: nil, message: nil, error: nil]
  end
  defmodule ResultException do
    defexception [result: nil, requirement: nil, message: nil]
  end

  defmacro __using__(_) do
    quote do
      alias NoizuLabs.EntityReference.Protocol, as: ERP
    end
  end
end
