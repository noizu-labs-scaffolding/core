# 〚🔌:𓴟𔍇𓜃𔗎〛 Noizu.EntityReference.Protocol for Tuple :: Noizu.EntityReference.Protocol for Tuple implementation
defimpl Noizu.EntityReference.Protocol, for: Tuple do
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R

  @spec id(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `R.ref(module: h) = subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓧜𓡎𓅞𔊧〛 id :: id/1
  """
  def id({:error, _} = e), do: e

  def id(R.ref(module: h) = subject) do
    h.id(subject)
  end

  @spec kind(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `R.ref(module: h) = subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓆽𓗳𔏤𓨖〛 kind :: kind/1
  """
  def kind({:error, _} = e), do: e

  def kind(R.ref(module: h) = subject) do
    h.kind(subject)
  end

  @spec ref(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `R.ref(module: h) = subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓴥𓖻𓿻𓌤〛 ref :: ref/1
  """
  def ref({:error, _} = e), do: e

  def ref(R.ref(module: h) = subject) do
    h.ref(subject)
  end

  @spec sref(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `R.ref(module: h) = subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓮬𓳩𓾦𓝎〛 sref :: sref/1
  """
  def sref({:error, _} = e), do: e

  def sref(R.ref(module: h) = subject) do
    h.sref(subject)
  end

  @spec entity(any, any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `R.ref(module: h) = subject`, `context`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓉺𓮚𓁽𓽹〛 entity :: entity/2
  """
  def entity({:error, _} = e, _), do: e

  def entity(R.ref(module: h) = subject, context) do
    h.entity(subject, context)
  end
end
