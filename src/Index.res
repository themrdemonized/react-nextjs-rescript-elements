let default = () => {
  let (count, setCount) = React.useState(() => 0)

  <div>
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      value={`default count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Secondary}
      value={`Secondary count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Tertiary}
      value={`Tertiary count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={L}
      value={`Large count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={S}
      value={`Small count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      disabled=true
      value={`Disabled count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      value={`Hidden div count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
      type_="text"
    />
  </div>
}
