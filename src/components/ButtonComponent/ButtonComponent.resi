@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"
type typeSizes = L | S | M
type typeColors = Primary | Secondary | Tertiary
@react.component
let make: (
  ~type_: string=?,
  ~value: string=?,
  ~name: string=?,
  ~typeSize: typeSizes=?,
  ~typeColor: typeColors=?,
  ~disabled: bool=?,
  ~forceActive: bool=?,
  ~iconWithTextSlot: React.element=?,
  ~iconSingleSlot: React.element=?,
  ~iconDouble1Slot: React.element=?,
  ~iconDouble2Slot: React.element=?,
  ~onClick: JsxEvent.Mouse.t => unit,
  ~props: ReactDOM.domProps=?,
) => React.element
