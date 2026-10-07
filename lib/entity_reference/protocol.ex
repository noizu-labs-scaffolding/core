# 〚🔌:𓨔𔊺𓥿𓰚〛 Noizu.EntityReference.Protocol :: Noizu.EntityReference.Protocol protocol
defprotocol Noizu.EntityReference.Protocol do
  @fallback_to_any true

  @spec id(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓭰𔃛𔒲𓩽〛 id :: id/1
  """
  def id(subject)

  @spec kind(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓮶𓌕𓈁𔕺〛 kind :: kind/1
  """
  def kind(subject)

  @spec ref(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓂭𓋻𓬕𓡌〛 ref :: ref/1
  """
  def ref(subject)

  @spec sref(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓈒𓦗𓺃𓁬〛 sref :: sref/1
  """
  def sref(subject)

  @spec entity(any, any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`, `context`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓜍𓂇𔐿𓈲〛 entity :: entity/2
  """
  def entity(subject, context)
end
