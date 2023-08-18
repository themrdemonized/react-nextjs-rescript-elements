let default = () => {
  let (count, setCount) = React.useState(() => 0)

  <div>
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      iconSingleSlot={React.string(`count is ${count->Belt.Int.toString}`)}
    />
  </div>
}
