defimpl  Noizu.EntityReference.Protocol, for: Any do
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
      defimpl  Noizu.EntityReference.Protocol, for: [unquote(module)] do
        def id(subject), do: apply(unquote(module), :id, [subject])
        def ref(subject), do: apply(unquote(module), :ref, [subject])
        def sref(subject), do: apply(unquote(module), :sref, [subject])
        def entity(subject, context), do: apply(unquote(module), :entity, [subject, context])
      end
    end
  end

end