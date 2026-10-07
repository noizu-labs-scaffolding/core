defimpl Noizu.EntityReference.Protocol, for: Tuple do
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R

  @spec id(any) :: {:ok, any} | {:error, any}
  # 〚🔧:d63006d2-678f-577e-88cc-f91d11772bb7〛 id :: auto-generated pointer for public function id
  def id({:error, _} = e), do: e

  def id(R.ref(module: h) = subject) do
    h.id(subject)
  end

  @spec kind(any) :: {:ok, any} | {:error, any}
  # 〚🔧:1beaa2cc-9d2d-5574-9551-acae8f7ad1c6〛 kind :: auto-generated pointer for public function kind
  def kind({:error, _} = e), do: e

  def kind(R.ref(module: h) = subject) do
    h.kind(subject)
  end

  @spec ref(any) :: {:ok, any} | {:error, any}
  # 〚🔧:6b4b8d6b-47dc-5190-877e-a68f1d34d714〛 ref :: auto-generated pointer for public function ref
  def ref({:error, _} = e), do: e

  def ref(R.ref(module: h) = subject) do
    h.ref(subject)
  end

  @spec sref(any) :: {:ok, any} | {:error, any}
  # 〚🔧:7fd5f652-9c1a-5be9-800c-03ee4ddcc5de〛 sref :: auto-generated pointer for public function sref
  def sref({:error, _} = e), do: e

  def sref(R.ref(module: h) = subject) do
    h.sref(subject)
  end

  @spec entity(any, any) :: {:ok, any} | {:error, any}
  # 〚🔧:db4ae3ab-0f73-5bf9-ae27-e419b2d01c19〛 entity :: auto-generated pointer for public function entity
  def entity({:error, _} = e, _), do: e

  def entity(R.ref(module: h) = subject, context) do
    h.entity(subject, context)
  end
end
