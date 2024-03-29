import "imports/@4ait/trade_style_palette/schemes/default.scss"
import "imports/@4ait/trade_fonts/declare.scss"
import "imports/@4ait/trade_elements/src/styles/templates/button.scss"
import "imports/@4ait/trade_elements/src/styles/templates/checkbox.scss"
import "imports/@4ait/trade_elements/src/styles/templates/popover.scss"
import "imports/@4ait/trade_elements/src/styles/templates/text-field.scss"
import 'styles/main.scss'

// Note:
// Just renaming $$default to ResApp alone
// doesn't help FastRefresh to detect the
// React component, since an alias isn't attached
// to the original React component function name.
import ResApp from "src/App.mjs"
import { useEffect } from "react"

// Note:
// We need to wrap the make call with
// a Fast-Refresh conform function name,
// (in this case, uppercased first letter)
//
// If you don't do this, your Fast-Refresh will
// not work!
export default function App(props) {
  useEffect(() => {
    document.body.classList.add('trade-style-palette_scheme_default');
  }, [])
  return <ResApp {...props}/>;
}
