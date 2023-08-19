@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"
type types = M | S
type modes = Normal | Parted
type states = True | False | Parted
@react.component
let make: (
  ~modelValue: states=?,
  ~disabled: bool=?,
  ~isError: bool=?,
  ~type_: types=?,
  ~mode: modes=?,
  ~updateModelValue: states => unit,
  ~children: React.element=?,
  ~style: ReactDOM.Style.t=?,
  ~className: string=?,
) => React.element
