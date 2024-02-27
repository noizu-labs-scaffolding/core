defimpl  Noizu.EntityReference.Protocol, for: Tuple do
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R
  def id({:error, _} = e), do: e
  def id(R.ref(module: h) = subject) do
    apply(h, :id, [subject])
  end
  def kind({:error, _} = e), do: e
  def kind(R.ref(module: h) = subject) do
    apply(h, :kind, [subject])
  end

  def ref({:error, _} = e), do: e
  def ref(R.ref(module: h) = subject) do
    apply(h, :ref, [subject])
  end

  def sref({:error, _} = e), do: e
  def sref(R.ref(module: h) = subject) do
    apply(h, :sref, [subject])
  end

  def entity({:error, _} = e, _), do: e
  def entity(R.ref(module: h) = subject, context) do
    apply(h, :entity, [subject, context])
  end
end
