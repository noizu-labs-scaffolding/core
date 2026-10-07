defimpl Noizu.EntityReference.Protocol, for: Any do
  @spec id(any) :: {:ok, any} | {:error, any}
  # 〚🔧:051a7494-0a2d-5a12-a1d1-6b11caec44fc〛 id :: auto-generated pointer for public function id
  def id(subject), do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:id, subject}}}}

  @spec kind(any) :: {:ok, any} | {:error, any}
  # 〚🔧:dc147254-66cb-5fce-a352-c787577a3f39〛 kind :: auto-generated pointer for public function kind
  def kind(subject),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:kind, subject}}}}

  @spec ref(any) :: {:ok, any} | {:error, any}
  # 〚🔧:6e28a592-7088-5f60-aaf3-358f5f906776〛 ref :: auto-generated pointer for public function ref
  def ref(subject),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:ref, subject}}}}

  @spec sref(any) :: {:ok, any} | {:error, any}
  # 〚🔧:0f802d6e-2e24-51d5-9c52-7cc53b421f52〛 sref :: auto-generated pointer for public function sref
  def sref(subject),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:sref, subject}}}}

  @spec entity(any, any) :: {:ok, any} | {:error, any}
  # 〚🔧:4d4ebc8a-d3e9-5240-86fe-7d220285f10e〛 entity :: auto-generated pointer for public function entity
  def entity(subject, _),
    do: {:error, {Noizu.EntityReference.Protocol, {:unsupported, {:entity, subject}}}}

  # 〚🔧:ffadfbef-ff46-59de-b65c-0b046bed247d〛 __deriving__ :: auto-generated pointer for public function __deriving__
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
