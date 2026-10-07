defprotocol Noizu.EntityReference.Protocol do
  @fallback_to_any true

  @spec id(any) :: {:ok, any} | {:error, any}
  # 〚🔌:07c0d04a-7fb8-5464-b75d-52d99d8d984d〛 id :: auto-generated pointer for public function id
  def id(subject)

  @spec kind(any) :: {:ok, any} | {:error, any}
  # 〚🔌:159831d1-c023-5fd8-a5f0-e999e598deda〛 kind :: auto-generated pointer for public function kind
  def kind(subject)

  @spec ref(any) :: {:ok, any} | {:error, any}
  # 〚🔌:430e325c-eaa0-5c4b-a333-daf5b616e36c〛 ref :: auto-generated pointer for public function ref
  def ref(subject)

  @spec sref(any) :: {:ok, any} | {:error, any}
  # 〚🔌:0987ac7d-e62f-556a-b732-dcde0b80abdc〛 sref :: auto-generated pointer for public function sref
  def sref(subject)

  @spec entity(any, any) :: {:ok, any} | {:error, any}
  # 〚🔌:220abfc2-552b-5fce-b05c-9c6f301647e2〛 entity :: auto-generated pointer for public function entity
  def entity(subject, context)
end
