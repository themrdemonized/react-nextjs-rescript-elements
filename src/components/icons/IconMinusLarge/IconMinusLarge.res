%%private(@module("./IconMinusLarge.module.scss") external styles: {..} = "default")


@react.component
let make = (
    ~style: ReactDOM.Style.t=ReactDOM.Style.make(()),
    ~className = ""
) => {
    <IconComponent
        style={style}
        className={className}
    >
        <svg
            viewBox="0 0 16 16"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M2.64 7C2.41598 7 2.30397 7 2.2184 7.0436C2.14314 7.08195 2.08195 7.14314 2.0436 7.2184C2 7.30397 2 7.41598 2 7.64L2 8.36C2 8.58402 2 8.69603 2.0436 8.7816C2.08195 8.85686 2.14314 8.91805 2.2184 8.9564C2.30397 9 2.41598 9 2.64 9L13.36 9C13.584 9 13.696 9 13.7816 8.9564C13.8569 8.91805 13.9181 8.85686 13.9564 8.7816C14 8.69603 14 8.58402 14 8.36V7.64C14 7.41598 14 7.30397 13.9564 7.2184C13.9181 7.14314 13.8569 7.08195 13.7816 7.0436C13.696 7 13.584 7 13.36 7L2.64 7Z" 
                fill="currentColor"
            />
        </svg>
  </IconComponent>
}
