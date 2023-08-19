let default = () => {
  let (count, setCount) = React.useState(() => 0)

  <div>
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      value={`default count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Secondary}
      value={`Secondary count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Tertiary}
      value={`Tertiary count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={L}
      value={`Large count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={S}
      value={`Small count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      disabled=true
      value={`Disabled count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      forceActive=true
      value={`forceActive is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      value={`Hidden div count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
      type_="text"
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      iconWithTextSlot={
        <Icon4A />
      }
      value={`icon count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      iconSingleSlot={
        <Icon4A />
      }
      value={`icon count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      iconDouble1Slot={
        <Icon4A />
      }
      iconDouble2Slot={
        <IconArrowTriangleDownFill />
      }
      value={`icon count is ${count->Belt.Int.toString}`}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
  </div>
}
