# 〚🔌:𔉨𔀋𓤶𔍴〛 Noizu.EntityReference.Protocol for Any :: Noizu.EntityReference.Protocol for Any implementation
defimpl Noizu.EntityReference.Protocol, for: Any do
  @spec id(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓂄𓪋𓌁𓖜〛 id :: id/1
  """
  def id(subject), do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:id, subject}}}}

  @spec kind(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓫬𓉢𓒀𓱉〛 kind :: kind/1
  """
  def kind(subject),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:kind, subject}}}}

  @spec ref(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𔀵𔀪𓭪𓨦〛 ref :: ref/1
  """
  def ref(subject),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:ref, subject}}}}

  @spec sref(any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓽁𓷄𔌱𓛲〛 sref :: sref/1
  """
  def sref(subject),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:sref, subject}}}}

  @spec entity(any, any) :: {:ok, any} | {:error, any}
  @doc """
  How: takes `subject`, `_`; returns `{:ok, any} | {:error, any}`

  〚🔧:𓷓𓅁𔗂𓘾〛 entity :: entity/2
  """
  def entity(subject, _),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:entity, subject}}}}

  @doc """
  How: takes `module`, `_`, `_`

  〚🔧:𓔖𔑋𔌴𓆝〛 __deriving__ :: __deriving__/3
  """
  defmacro __deriving__(module, _, _) do
    # we should be defining a provider rather than requiring these methods be defined for each struct
    quote do
      defimpl Noizu.EntityReference.Protocol, for: [unquote(module)] do
        @spec id(any) :: {:ok, any} | {:error, any}
        def id(subject), do: unquote(module).id(subject)

        @spec kind(any) :: {:ok, any} | {:error, any}
        def kind(subject), do: unquote(module).kind(subject)

        @spec ref(any) :: {:ok, any} | {:error, any}
        def ref(subject), do: unquote(module).ref(subject)

        @spec sref(any) :: {:ok, any} | {:error, any}
        def sref(subject), do: unquote(module).sref(subject)

        @spec entity(any, any) :: {:ok, any} | {:error, any}
        def entity(subject, context), do: unquote(module).entity(subject, context)
      end
    end
  end
end
