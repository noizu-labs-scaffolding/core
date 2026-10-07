defmodule Noizu.Context.Entity do
  @moduledoc """
  Stub Placeholder Entity
  """

  alias Noizu.EntityReference.Records, as: R
  require Noizu.EntityReference.Records

  # -------------------
  # id/1
  # -------------------
  @spec id(any) :: {:ok, any} | {:error, any}
  # 〚🔧:209c9f34-7965-5747-98d1-b6686fc39ade〛 id :: auto-generated pointer for public function id
  def id(R.ref(module: __MODULE__, id: id)), do: {:ok, id}

  # -------------------
  # ref/1
  # -------------------
  @spec ref(any) :: {:ok, any} | {:error, any}
  # 〚🔧:91099f04-fe7b-552a-8989-f6acb5148c76〛 ref :: auto-generated pointer for public function ref
  def ref(role) when is_atom(role),
    do: {:ok, R.ref(module: __MODULE__, id: role)}

  def ref(R.ref(module: __MODULE__) = ref),
      do: {:ok, ref}
end

defmodule Noizu.Context do
  @moduledoc """
  Context module for Noizu.
  """

  import Noizu.Context.Records
  alias Noizu.Context.Entity
  alias Noizu.EntityReference.Records, as: R
  require Noizu.Context.Records
  require Noizu.EntityReference.Records

  @spec with_option(any, any, any) :: any
  # 〚🔧:5a6a9864-12dc-5619-9dac-e35633693edd〛 with_option :: auto-generated pointer for public function with_option
  def with_option(context(options: options) = context, option, value) do
    context(context, options: put_in(options || %{}, [Access.key(option)], value))
  end

  @spec with_options(any, any) :: any
  # 〚🔧:857db5b1-b101-5375-88db-9782b392db1c〛 with_options :: auto-generated pointer for public function with_options
  def with_options(context() = context, options) do
    context(context, options: options)
  end

  @spec option(any, any) :: {:ok, any} | {:error, any}
  # 〚🔧:044f7fb6-d876-50ea-9cf5-30728d1aceea〛 option :: auto-generated pointer for public function option
  def option(context, option)
  def option(context(options: nil), option), do: {:error, {:no_option, option}}

  def option(context(options: options), option) do
    cond do
      Map.has_key?(options, option) -> {:ok, options[option]}
      :else -> {:error, {:no_option, option}}
    end
  end

  @spec option(any, any, any) :: {:ok, any} | {:error, any}
  def option(context, option, default)
  def option(context(options: nil), _, default), do: {:ok, default}

  def option(context(options: options), option, default) do
    cond do
      Map.has_key?(options, option) -> {:ok, options[option]}
      :else -> {:ok, default}
    end
  end

  # -------------------
  #
  # -------------------
  @spec roles(any) :: {:ok, any} | {:error, any}
  defp roles(R.ref(module: Entity, id: :restricted)) do
    {:ok, [restricted: true]}
  end

  defp roles(R.ref(module: Entity, id: :internal)) do
    {:ok, [internal: true]}
  end

  defp roles(R.ref(module: Entity, id: :system)) do
    {:ok, [system: true]}
  end

  defp roles(R.ref(module: Entity, id: :admin)) do
    {:ok, [admin: true]}
  end

  # -------------------
  #
  # -------------------
  @spec restricted() :: any
  # 〚🔧:91d46540-277f-54f3-8ff6-a47126be2de0〛 restricted :: auto-generated pointer for public function restricted
  def restricted do
    {:ok, ref} = Entity.ref(:restricted)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end

  @spec restricted(any) :: any
  def restricted(nil), do: restricted()

  def restricted(context(roles: _) = context) do
    context(context, roles: [restricted: true])
  end

  # -------------------
  #
  # -------------------
  @spec internal() :: any
  # 〚🔧:bc4cbc80-8ee2-5c5e-a32f-af8efda66196〛 internal :: auto-generated pointer for public function internal
  def internal do
    {:ok, ref} = Entity.ref(:internal)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end

  @spec internal(any) :: any
  def internal(nil), do: internal()

  def internal(context(roles: _) = context) do
    context(context, roles: [internal: true])
  end

  # -------------------
  #
  # -------------------
  @spec system() :: any
  # 〚🔧:e2089678-c564-5875-a00e-22d613af99a7〛 system :: auto-generated pointer for public function system
  def system do
    {:ok, ref} = Entity.ref(:system)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end

  @spec system(any) :: any
  def system(nil), do: system()

  def system(context(roles: _) = context) do
    context(context, roles: [system: true])
  end

  # -------------------
  #
  # -------------------
  @spec admin() :: any
  # 〚🔧:60cd34c3-c216-5c21-91b8-2d9bad6d1cb2〛 admin :: auto-generated pointer for public function admin
  def admin do
    {:ok, ref} = Entity.ref(:admin)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end

  @spec admin(any) :: any
  def admin(nil), do: admin()

  def admin(context(roles: _) = context) do
    context(context, roles: [admin: true])
  end

  # -------------------
  #
  # -------------------
  @doc """
  placeholder for when real credentials need to be plumbed in, making it easy to find and cleanup over time.
  """
  @spec dummy() :: any
  # 〚🔧:663e17e4-6f01-5af1-95ff-558e3f17872e〛 dummy :: placeholder for when real credentials need to be plumbed in, making it easy to find and cleanup over
  def dummy do
    {:ok, ref} = Entity.ref(:system)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end

  @spec dummy(any) :: any
  def dummy(nil), do: dummy()

  def dummy(context(roles: _) = context) do
    context(context, roles: [system: true])
  end

  @spec dummy_for_user(any) :: any
  @spec dummy_for_user(any, any) :: any
  # 〚🔧:42d653d1-5295-5e81-87c5-cd6d4ad69881〛 dummy_for_user :: auto-generated pointer for public function dummy_for_user
  def dummy_for_user(user, context \\ nil) do
    with {:ok, user} <- Noizu.EntityReference.Protocol.ref(user) do
      {:ok, context(dummy(context), caller: user)}
    end
  end
end
