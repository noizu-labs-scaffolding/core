defprotocol Noizu.EntityReference.Protocol do
  @fallback_to_any true
  def id(subject)
  def ref(subject)
  def sref(subject)
  def entity(subject, context)
end
