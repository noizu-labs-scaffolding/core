defmodule Noizu.Context.Entity do
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R

  #-------------------
  #
  #-------------------
  def id(R.ref(handler: Noizu.Context.Entity, identifier: id)), do: {:ok, id}


  #-------------------
  #
  #-------------------
  def ref(role) when is_atom(role), do: {:ok, R.ref(handler: Noizu.Context.Entity, identifier: role)}
  def ref(R.ref(handler: Noizu.Context.Entity) = ref), do: {:ok, ref}
end

defmodule Noizu.Context do
  require Noizu.Context.Records
  import Noizu.Context.Records
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R

  #-------------------
  #
  #-------------------
  defp roles(R.ref(handler: Noizu.Context.Entity, identifier: :restricted)) do
    [restricted: true]
  end
  defp roles(R.ref(handler: Noizu.Context.Entity, identifier: :internal)) do
    [internal: true]
  end
  defp roles(R.ref(handler: Noizu.Context.Entity, identifier: :system)) do
    [system: true]
  end
  defp roles(R.ref(handler: Noizu.Context.Entity, identifier: :admin)) do
    [admin: true]
  end

  #-------------------
  #
  #-------------------
  def restricted() do
    {:ok, ref} = Noizu.Context.Entity.ref(:restricted)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end
  def restricted(nil), do: restricted()
  def restricted(context(roles: roles) = context) do
    context(context, roles: [restricted: true])
  end

  #-------------------
  #
  #-------------------
  def internal() do
    {:ok, ref} = Noizu.Context.Entity.ref(:internal)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end
  def internal(nil), do: internal()
  def internal(context(roles: roles) = context) do
    context(context, roles: [internal: true])
  end


  #-------------------
  #
  #-------------------
  def system() do
    {:ok, ref} = Noizu.Context.Entity.ref(:system)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end
  def system(nil), do: system()
  def system(context(roles: roles) = context) do
    context(context, roles: [system: true])
  end

  #-------------------
  #
  #-------------------
  def admin() do
    {:ok, ref} = Noizu.Context.Entity.ref(:admin)
    {:ok, roles} = roles(ref)
    context(caller: ref, ts: DateTime.utc_now(), roles: roles)
  end
  def admin(nil), do: admin()
  def admin(context(roles: roles) = context) do
    context(context, roles: [admin: true])
  end



end