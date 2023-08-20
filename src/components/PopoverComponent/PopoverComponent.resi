@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"
type types = M | S
type modes = Normal | Parted
type states = True | False | Parted
@react.component
let make: (
  ~tools: array<string>=?,
  ~clickTool: string => unit=?,
  ~children: React.element,
  ~toolsSlots: array<React.element>=?,
  ~props: ReactDOM.domProps=?,
) => React.element
