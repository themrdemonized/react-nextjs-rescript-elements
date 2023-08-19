let default = () => {
  let c = (_) => ()

  <div>
    <CheckboxComponent
      type_={M}
      updateModelValue={c}
    >{React.string("Тестовый текст")}</CheckboxComponent>
  </div>
}
