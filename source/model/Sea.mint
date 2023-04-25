store Sea {
  state waves = [ ] of Wave
  state boats = [ { x: 200, y: 200 } ] of Boat

  fun addWave (wave : Wave) {
    next
      {
        waves:
          waves
          |> Array.push(wave)
      }
  }
}

component SeaView {
  property t : Number

  fun render {
    <g>
      <{
        Sea.waves
        |> Array.map(
          (wave : Wave) : Html {
            <WaveView wave={wave} />
          })
      }>
      <{
        Sea.boats
        |> Array.map(
          (boat : Boat) : Html {
            <BoatView boat={boat} />
          })
      }>
    </g>
  }
}
