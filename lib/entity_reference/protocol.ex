defprotocol Noizu.EntityReference.Protocol do
  @fallback_to_any true

  @spec id(any) :: {:ok, any} | {:error, any}
  # ⟦𓭰𔃛𔒲𓩽⟧ id :: auto-generated pointer for public function id
  def id(subject)

  @spec kind(any) :: {:ok, any} | {:error, any}
  # ⟦𓮶𓌕𓈁𔕺⟧ kind :: auto-generated pointer for public function kind
  def kind(subject)

  @spec ref(any) :: {:ok, any} | {:error, any}
  # ⟦𓂭𓋻𓬕𓡌⟧ ref :: auto-generated pointer for public function ref
  def ref(subject)

  @spec sref(any) :: {:ok, any} | {:error, any}
  # ⟦𓈒𓦗𓺃𓁬⟧ sref :: auto-generated pointer for public function sref
  def sref(subject)

  @spec entity(any, any) :: {:ok, any} | {:error, any}
  # ⟦𓜍𓂇𔐿𓈲⟧ entity :: auto-generated pointer for public function entity
  def entity(subject, context)
end
