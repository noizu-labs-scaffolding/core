defimpl  Noizu.EntityReference.Protocol, for: Tuple do
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R
  def id(R.ref(module: h) = subject) do
    apply(h, :id, [subject])
  end
  def id(R.ref(module: h) = subject) do
    apply(h, :kind, [subject])
  end
  def ref(R.ref(module: h) = subject) do
    apply(h, :ref, [subject])
  end
  def sref(R.ref(module: h) = subject) do
    apply(h, :sref, [subject])
  end
  def entity(R.ref(module: h) = subject, context) do
    apply(h, :entity, [subject, context])
  end
end
