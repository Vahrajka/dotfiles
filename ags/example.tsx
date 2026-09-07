import app from "ags/gtk4/app"
import MyButton from "./widgets/MyButton"

function Bar(monitor = 0) {
  return (
    <window visible class="Bar" monitor={monitor}>
      <box>clic</box>
      <MyButton />
    </window>
  )
}

app.start({
  main() {
    Bar(0)
    Bar(1) // instantiate for each monitor
  },
})
