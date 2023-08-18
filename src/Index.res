let default = () => {
  let (count, setCount) = React.useState(() => 0)

  <div>
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      value={`count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Secondary}
      value={`count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Tertiary}
      value={`count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={L}
      value={`count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={S}
      value={`count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
  </div>
}
