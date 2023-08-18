%%private(@module("./ButtonComponent.module.scss") external styles: {..} = "default")

@react.component
let make = (~onClick, ~children) =>
  <button
    onClick
    className={cx([
      styles["root"]
    ])}
  >children</button>
