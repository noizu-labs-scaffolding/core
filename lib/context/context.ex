defmodule Noizu.Context.Entity do
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R

  #-------------------
  #
  #-------------------
  def id(R.ref(module: Noizu.Context.Entity, identifier: id)), do: {:ok, id}


  #-------------------
  #
  #-------------------
  def ref(role) when is_atom(role), do: {:ok, R.ref(module: Noizu.Context.Entity, identifier: role)}
  def ref(R.ref(module: Noizu.Context.Entity) = ref), do: {:ok, ref}
end

defmodule Noizu.Context do
  require Noizu.Context.Records
  import Noizu.Context.Records
  require Noizu.EntityReference.Records
  alias Noizu.EntityReference.Records, as: R

  #-------------------
  #
  #-------------------
  defp roles(R.ref(module: Noizu.Context.Entity, identifier: :restricted)) do
    {:ok, [restricted: true]}
  end
  defp roles(R.ref(module: Noizu.Context.Entity, identifier: :internal)) do
    {:ok, [internal: true]}
  end
  defp roles(R.ref(module: Noizu.Context.Entity, identifier: :system)) do
    {:ok, [system: true]}
  end
  defp roles(R.ref(module: Noizu.Context.Entity, identifier: :admin)) do
    {:ok, [admin: true]}
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