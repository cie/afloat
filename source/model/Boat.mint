record Boat {
  x: Number,
  y: Number
}

component BoatView {
  property boat: Boat

  connect Clock exposing { t }

  get angle {
    `Math.sin(#{t / 6.28 / 3})` * 9
  }
  
  fun render() {
    <path
      transform={
        "translate(" + Number.toString(boat.x) + "," + Number.toString(boat.y) + ")" + 
        "rotate(" + Number.toString(angle) + ")"}
      d={
        "M" + Number.toString(-15) + "," + Number.toString(-10) +
        "Q" + Number.toString(6) + "," + Number.toString(-11) +
        "," + Number.toString(15) + "," + Number.toString(0) +
        "Q" + Number.toString(6) + "," + Number.toString(11) +
        "," + Number.toString(-15) + "," + Number.toString(10) +
        "L" + Number.toString(-15) + "," + Number.toString(-10)}
      fill="#d2b340"
    />
  }
}